<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="Preguntas.aspx.vb" Inherits="Views_Preguntas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
    <form id="form1" runat="server">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    Administraci&oacute;n de Usuarios
                </div>
            </div>
            <div class="panel-body">
                <div class="well well-sm text-right">
                    <asp:Label ID="lbCarrera" CssClass="control-label col-sm-4" runat="server" Text="Carrera:"></asp:Label>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ListaCarreras" runat="server" CssClass="form-control" DataSourceID="CarrerasSDS" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="CarrerasSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT * FROM [CARRERA]"></asp:SqlDataSource>
                    </div>                    
                    </div>
                <div class="table-responsive">
                    <asp:GridView ID="gvPreguntas" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="PreguntasSDS">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="ORDEN" HeaderText="ORDEN" SortExpression="ORDEN" />
                            <asp:BoundField DataField="PREGUNTA" HeaderText="PREGUNTA" SortExpression="PREGUNTA" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="PreguntasSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" DeleteCommand="DELETE FROM [PREGUNTA] WHERE [ID] = @ID" InsertCommand="INSERT INTO [PREGUNTA] ([ID_CARRERA], [ORDEN], [PREGUNTA]) VALUES (@ID_CARRERA, @ORDEN, @PREGUNTA)" SelectCommand="SELECT ID, ORDEN, PREGUNTA FROM [PREGUNTA] WHERE ([ID_CARRERA] = @ID_CARRERA)" UpdateCommand="UPDATE [PREGUNTA] SET [ORDEN] = @ORDEN, [PREGUNTA] = @PREGUNTA WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID_CARRERA" Type="Int64" />
                            <asp:Parameter Name="ORDEN" Type="Int32" />
                            <asp:Parameter Name="PREGUNTA" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListaCarreras" DefaultValue="0" Name="ID_CARRERA" PropertyName="SelectedValue" Type="Int64" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ORDEN" Type="Int32" />
                            <asp:Parameter Name="PREGUNTA" Type="String" />
                            <asp:Parameter Name="ID" Type="Int64" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:DetailsView ID="dtPregunta" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="DtPreguntaSDS">
                        <Fields>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="ID_CARRERA" HeaderText="ID_CARRERA" SortExpression="ID_CARRERA" />
                            <asp:BoundField DataField="ORDEN" HeaderText="ORDEN" SortExpression="ORDEN" />
                            <asp:BoundField DataField="PREGUNTA" HeaderText="PREGUNTA" SortExpression="PREGUNTA" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                        <EmptyDataTemplate>
                            <asp:Button ID="InsertButton" runat="server" CommandName="New" Text="Nuevo" CssClass="btn btn-success" />
                        </EmptyDataTemplate>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="DtPreguntaSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" DeleteCommand="DELETE FROM [PREGUNTA] WHERE [ID] = @ID" InsertCommand="INSERT INTO [PREGUNTA] ([ID_CARRERA], [ORDEN], [PREGUNTA]) VALUES (@ID_CARRERA, @ORDEN, @PREGUNTA)" SelectCommand="SELECT * FROM [PREGUNTA] WHERE ([ID_CARRERA] = @ID_CARRERA)" UpdateCommand="UPDATE [PREGUNTA] SET [ID_CARRERA] = @ID_CARRERA, [ORDEN] = @ORDEN, [PREGUNTA] = @PREGUNTA WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ID_CARRERA" Type="Int64" />
                            <asp:Parameter Name="ORDEN" Type="Int32" />
                            <asp:Parameter Name="PREGUNTA" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvPreguntas" DefaultValue="0" Name="ID_CARRERA" PropertyName="SelectedValue" Type="Int64" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ID_CARRERA" Type="Int64" />
                            <asp:Parameter Name="ORDEN" Type="Int32" />
                            <asp:Parameter Name="PREGUNTA" Type="String" />
                            <asp:Parameter Name="ID" Type="Int64" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </form>
</asp:Content>

