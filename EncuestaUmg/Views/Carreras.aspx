<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="Carreras.aspx.vb" Inherits="Views_Carreras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    Administraci&oacute;n de Carreras
                </div>
            </div>
            <div class="panel-body">
                <div class="form">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="well well-sm text-right">
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#nuevaCarrera"><i class="icon-plus-sign"></i>Nuevo</button>
                            </div>
                            <div class="table-responsive">

                                <asp:GridView ID="gvCarreras" runat="server" DataSourceID="CarrerasSDS" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" AllowPaging="True" CssClass="table table-stripped">
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                    </Columns>
                                    <SelectedRowStyle BackColor="#FF9933" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="CarrerasSDS" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:connStr %>"
                                    DeleteCommand="DELETE FROM [CARRERA] WHERE [ID] = @ID"
                                    InsertCommand="INSERT INTO [CARRERA] ([NOMBRE]) VALUES (@NOMBRE)"
                                    SelectCommand="SELECT * FROM [CARRERA]"
                                    UpdateCommand="UPDATE [CARRERA] SET [NOMBRE] = @NOMBRE WHERE [ID] = @ID">
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
                        </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvCarreras" EventName="SelectedIndexChanged" />
                        </Triggers>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    Administraci&oacute;n de Carreras
                </div>
            </div>
            <div class="panel-body">
                <div class="form">
                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="well well-sm text-right">
                                <asp:Button ID="btnNuevoCurso" runat="server" Text="Nuevo" data-toggle="modal" data-target="#nuevoCurso" CssClass="btn btn-success" />
                            </div>
                            <div class="table-responsive">

                                <asp:GridView ID="gvCursos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-stripped" DataKeyNames="ID" DataSourceID="CursosSDS">
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="CursosSDS" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:connStr %>"
                                    DeleteCommand="DELETE FROM [CURSO] WHERE [ID] = @ID"
                                    InsertCommand="INSERT INTO [CURSO] ([NOMBRE],[ID_CARRERA]) VALUES (@NOMBRE, @ID_CARRERA)"
                                    SelectCommand="SELECT [ID], [NOMBRE] FROM [CURSO] WHERE ([ID_CARRERA] = @ID_CARRERA)"
                                    UpdateCommand="UPDATE [CURSO] SET [NOMBRE] = @NOMBRE WHERE [ID] = @ID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ID" Type="Int64" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="NOMBRE" Type="String" />
                                        <asp:Parameter Name="ID_CARRERA" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="gvCarreras" DefaultValue="0" Name="ID_CARRERA" PropertyName="SelectedValue" Type="Int64" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="NOMBRE" Type="String" />
                                        <asp:Parameter Name="ID" Type="Int64" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvCarreras" EventName="SelectedIndexChanged" />                            
                        </Triggers>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <div class="modal fade" role="dialog" id="nuevoCurso">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                        <h4 class="modal-title">Agregar Curso</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form">
                            <div class="form-group">
                                <label>Nombre Curso: </label>                            
                                <input type="text" id="NombreCurso" name="NombreCurso" class="form-control" required="required" placeholder="Nombre Curso" />                                
                            </div>
                            <div class="form-group text-center">                            
                                <input type="submit" id="GuardarCurso" name="GuardarCurso" value="Guardar" class="btn btn-primary" />                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="modal fade" role="dialog" id="nuevaCarrera">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title">Agregar Carrera</h4>
                </div>
                <div class="modal-body">
                    <form method="post" action="Carreras.aspx" class="form">
                        <div class="form-group">
                            <label>Nombre Carrera: </label>
                            <input type="text" id="NombreCarrera" name="NombreCarrera" class="form-control" placeholder="Nombre Carrera" required="required" />
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" name="GuardarCarrera" id="GuardarCarrera" value="Guatdar" class="btn btn-primary" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>    
</asp:Content>

