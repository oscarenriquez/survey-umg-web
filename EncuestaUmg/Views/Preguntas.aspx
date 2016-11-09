<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="Preguntas.aspx.vb" Inherits="Views_Preguntas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="Server">
    <form id="form1" runat="server">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    Estudiantes
                </div>
            </div>
            <div class="panel-body">
                <div class="well well-sm">
                    <div class="row">
                        <asp:label id="lbCarrera" cssclass="control-label col-sm-4 text-right" runat="server" text="Carrera:"></asp:label>
                        <div class="col-sm-8">
                            <asp:dropdownlist id="ListaCarreras" runat="server" cssclass="form-control" datasourceid="CarrerasSDS" datatextfield="NOMBRE" datavaluefield="ID" AppendDataBoundItems="True" AutoPostBack="True">
                            <asp:ListItem Value="" Text="Seleccione una Carrera" />
                        </asp:dropdownlist>
                            <asp:sqldatasource id="CarrerasSDS" runat="server" connectionstring="<%$ ConnectionStrings:connStr %>" selectcommand="SELECT * FROM [CARRERA]"></asp:sqldatasource>
                        </div>
                    </div>
                </div>
                <div class="table-responsive">
                    <asp:gridview id="gvPreguntas" runat="server" allowpaging="True" allowsorting="True" autogeneratecolumns="False" cssclass="table" datakeynames="ID" datasourceid="PreguntasSDS">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="ORDEN" HeaderText="ORDEN" SortExpression="ORDEN" />
                            <asp:BoundField DataField="PREGUNTA" HeaderText="PREGUNTA" SortExpression="PREGUNTA" />
                        </Columns>
                        <SelectedRowStyle BackColor="#FF6600" />
                    </asp:gridview>
                    <asp:sqldatasource id="PreguntasSDS" runat="server" connectionstring="<%$ ConnectionStrings:connStr %>" selectcommand="SELECT ID, ORDEN, PREGUNTA FROM [PREGUNTA] WHERE ([ID_CARRERA] = @ID_CARRERA)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ListaCarreras" DefaultValue="0" Name="ID_CARRERA" PropertyName="SelectedValue" Type="Int64" />
                        </SelectParameters>
                    </asp:sqldatasource>
                    <asp:detailsview id="dtPregunta" runat="server" height="70px" width="50%" allowpaging="True" autogeneraterows="False" datakeynames="ID" datasourceid="DtPreguntaSDS" cssclass="table table-stripped">
                        <Fields>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="ORDEN" HeaderText="ORDEN" SortExpression="ORDEN" />
                            <asp:BoundField DataField="PREGUNTA" HeaderText="PREGUNTA" SortExpression="PREGUNTA" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                        </Fields>
                        <EmptyDataTemplate>
                            <asp:Button ID="InsertButton" runat="server" CommandName="New" Text="Nuevo" CssClass="btn btn-success" />
                        </EmptyDataTemplate>
                    </asp:detailsview>
                    <asp:sqldatasource id="DtPreguntaSDS" runat="server" connectionstring="<%$ ConnectionStrings:connStr %>" deletecommand="DELETE FROM [PREGUNTA] WHERE [ID] = @ID" insertcommand="INSERT INTO [PREGUNTA] ([ID_CARRERA], [ORDEN], [PREGUNTA]) VALUES (@ID_CARRERA, @ORDEN, @PREGUNTA)" selectcommand="SELECT ID, ORDEN, PREGUNTA FROM [PREGUNTA] WHERE ([ID] = @ID)" updatecommand="UPDATE [PREGUNTA] SET [ORDEN] = @ORDEN, [PREGUNTA] = @PREGUNTA WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int64" />
                        </DeleteParameters>
                        <InsertParameters>                            
                            <asp:ControlParameter ControlID="ListaCarreras" PropertyName="SelectedValue" Name="ID_CARRERA" Type="Int64" />                            
                            <asp:Parameter Name="ORDEN" Type="Int32" />
                            <asp:Parameter Name="PREGUNTA" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvPreguntas" DefaultValue="0" Name="ID" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ORDEN" Type="Int32" />
                            <asp:Parameter Name="PREGUNTA" Type="String" />
                            <asp:Parameter Name="ID" Type="Int64" />
                        </UpdateParameters>
                    </asp:sqldatasource>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

