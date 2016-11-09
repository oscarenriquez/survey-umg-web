<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="Estudiantes.aspx.vb" Inherits="Views_Estudiantes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="Server">
    <form id="form1" runat="server">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    Administraci&oacute;n de Usuarios
                </div>
            </div>
            <div class="panel-body">
                <div class="form">
                    <div class="well well-sm">
                        <div class="row">
                            <asp:Label ID="lbCarrera" CssClass="control-label col-sm-4 text-right" runat="server" Text="Carrera:"></asp:Label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="ListaCarreras" runat="server" CssClass="form-control" DataSourceID="CarrerasSDS" DataTextField="NOMBRE" DataValueField="ID" AppendDataBoundItems="True" AutoPostBack="True">
                                    <asp:ListItem Value="" Text="Seleccione una Carrera" />
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="CarrerasSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT * FROM [CARRERA]"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="gvEstudiantes" runat="server" DataSourceID="EstudiantesSDS" AutoGenerateColumns="False" CssClass="table table-stripped" DataKeyNames="ID">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="CARNET" HeaderText="CARNET" SortExpression="CARNET" />
                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                <asp:BoundField DataField="CICLO" HeaderText="CICLO" SortExpression="CICLO" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="EstudiantesSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT [ID], [CARNET], [NOMBRE], [CICLO] FROM [ESTUDIANTE] WHERE ([ID_CARRERA] = @ID_CARRERA)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ListaCarreras" DefaultValue="0" Name="ID_CARRERA" PropertyName="SelectedValue" Type="Int64" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

