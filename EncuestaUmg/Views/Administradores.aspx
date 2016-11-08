<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="Administradores.aspx.vb" Inherits="Views_Administradores" %>

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

                    <div class="well well-sm text-right">
                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#nuevoUsuario"><i class="icon-plus-sign"></i>Nuevo</button>
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="gvUsuarios" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="UsuariosSDS">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="LOGIN" HeaderText="LOGIN" SortExpression="LOGIN" />
                                <asp:BoundField DataField="PASSWORD" Visible="false" ReadOnly="true"  HeaderText="PASSWORD" SortExpression="PASSWORD" />
                                <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="UsuariosSDS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:connStr %>" 
                            DeleteCommand="DELETE FROM [USUARIOS] WHERE [ID] = @ID" 
                            InsertCommand="INSERT INTO [USUARIOS] ([LOGIN], [PASSWORD], [FECHA], [TIPO_USUARIO]) VALUES (@LOGIN, @PASSWORD, GETDATE(), @TIPO_USUARIO)" 
                            SelectCommand="SELECT [ID], [LOGIN], [PASSWORD], [FECHA] FROM [USUARIOS] WHERE ([TIPO_USUARIO] = @TIPO_USUARIO)" 
                            UpdateCommand="UPDATE [USUARIOS] SET [LOGIN] = @LOGIN, [FECHA] = @FECHA WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int64" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="LOGIN" Type="String" />
                                <asp:Parameter Name="PASSWORD" Type="String" />                                
                                <asp:Parameter DefaultValue="1" Name="TIPO_USUARIO" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:Parameter DefaultValue="1" Name="TIPO_USUARIO" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="LOGIN" Type="String" />
                                <asp:Parameter Name="FECHA" Type="DateTime" />
                                <asp:Parameter Name="ID" Type="Int64" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>        
    </form>
    <div class="modal fade" role="dialog" id="nuevoUsuario">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                        <h4 class="modal-title">Agregar Usuario</h4>
                    </div>
                    <div class="modal-body">
                        <form method="post" id="form2" class="form" action="Administradores.aspx">
                            <div class="form-group">
                                <label>Login: </label>
                                <input type="text" class="form-control" name="Login" id="Login" required="required" />
                            </div>
                            <div class="form-group">
                                <label>Password: </label>
                                <input type="text" class="form-control" name="Password" id="Password" required="required" />
                            </div>
                            <div class="form-group text-center">                                
                                <input type="submit" class="btn btn-primary" name="GuardarUsuario" value="Guardar" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

