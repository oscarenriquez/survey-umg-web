<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="Carreras.aspx.vb" Inherits="Views_Carreras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="Server">
    <form id="form1" runat="server">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    Administraci&oacute;n de Carreras
                </div>
            </div>
            <div class="panel-body">
                <div class="form">
                    <div class="well well-sm text-right">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#nuevaCarrera"><i class="icon-plus-sign"></i>Nuevo</button>
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="gvCarreras" runat="server" DataSourceID="CarrerasSDS" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True" CssClass="table table-stripped">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="CarrerasSDS" runat="server"
                            ConnectionString="<%$ ConnectionStrings:connStr %>" DeleteCommand="DELETE FROM [CARRERA] WHERE [ID] = @ID" InsertCommand="INSERT INTO [CARRERA] ([NOMBRE]) VALUES (@NOMBRE)" SelectCommand="SELECT * FROM [CARRERA]" UpdateCommand="UPDATE [CARRERA] SET [NOMBRE] = @NOMBRE WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="NOMBRE" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="NOMBRE" Type="String" />
                                <asp:Parameter Name="ID" Type="Int64" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" role="dialog" id="nuevaCarrera">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                        <h4 class="modal-title">Editar Tipo de Usuario</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form">
                            <div class="form-group">
                                <label>Nombre Carrera: </label>
                                <asp:TextBox ID="NombreCarrera" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="btnGuardarCarrera" runat="server" Text="Guardar" CssClass="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

