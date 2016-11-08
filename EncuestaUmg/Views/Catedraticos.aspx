<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="Catedraticos.aspx.vb" Inherits="Views_Catedraticos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Catedraticos.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    Administraci&oacute;n de Catedraticos
                </div>
            </div>
            <div class="panel-body">
                <div class="form">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="well well-sm text-right">
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#nuevoCatedratico"><i class="icon-plus-sign"></i>Nuevo</button>
                            </div>
                            <div class="table-responsive">
                                <asp:GridView ID="gvCatedraticos" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="CatedraticosSDS">
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="CODIGO" HeaderText="CODIGO" SortExpression="CODIGO" />
                                        <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                    </Columns>
                                    <SelectedRowStyle BackColor="#FF9933" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="CatedraticosSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" DeleteCommand="DELETE FROM [CATEDRATICO] WHERE [ID] = @ID" InsertCommand="INSERT INTO [CATEDRATICO] ([CODIGO], [NOMBRE]) VALUES (@CODIGO, @NOMBRE)" SelectCommand="SELECT * FROM [CATEDRATICO]" UpdateCommand="UPDATE [CATEDRATICO] SET [CODIGO] = @CODIGO, [NOMBRE] = @NOMBRE WHERE [ID] = @ID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ID" Type="Int64" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="CODIGO" Type="Int64" />
                                        <asp:Parameter Name="NOMBRE" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="CODIGO" Type="Int64" />
                                        <asp:Parameter Name="NOMBRE" Type="String" />
                                        <asp:Parameter Name="ID" Type="Int64" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                        </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvCatedraticos" EventName="SelectedIndexChanged" />
                        </Triggers>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    Asignar Curso a Catedratico
                </div>
            </div>
            <div class="panel-body">
                <div class="form">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="well well-sm text-right">
                                <asp:Button ID="btnNuevaAsignacion" runat="server" Text="Nuevo" data-toggle="modal" data-target="#nuevaAsignacion" CssClass="btn btn-success" />
                                <div class="table-responsive">
                                    <asp:GridView ID="gvAsignacion" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table" DataKeyNames="ID" DataSourceID="AsignacionSDS">
                                        <Columns>
                                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                            <asp:BoundField DataField="CARRERA" ReadOnly="true"   HeaderText="CARRERA" SortExpression="CARRERA" />
                                            <asp:BoundField DataField="CURSO" ReadOnly="true"   HeaderText="CURSO" SortExpression="CURSO" />
                                            <asp:BoundField DataField="SECCION" HeaderText="SECCION" SortExpression="SECCION" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="AsignacionSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" DeleteCommand="DELETE FROM [CATEDRATICO_CURSO] WHERE [ID] = @ID" InsertCommand="INSERT INTO [CATEDRATICO_CURSO] ([ID_CATEDRATICO], [ID_CURSO], [SECCION]) VALUES (@ID_CATEDRATICO, @ID_CURSO, @SECCION)" SelectCommand="SELECT A.ID AS ID, C.NOMBRE AS CARRERA, B.NOMBRE AS CURSO, A.SECCION 
FROM CATEDRATICO_CURSO AS A 
INNER JOIN CURSO AS B ON (A.ID_CURSO = B.ID)
INNER JOIN CARRERA AS C ON (B.ID_CARRERA = C.ID)
WHERE A.ID_CATEDRATICO = @ID_CATEDRATICO;" UpdateCommand="UPDATE [CATEDRATICO_CURSO] SET [SECCION] = @SECCION WHERE [ID] = @ID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID" Type="Int64" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="ID_CATEDRATICO" Type="Int64" />
                                            <asp:Parameter Name="ID_CURSO" Type="Int64" />
                                            <asp:Parameter Name="SECCION" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="gvCatedraticos" DefaultValue="0" Name="ID_CATEDRATICO" PropertyName="SelectedValue" Type="Int64" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="SECCION" Type="String" />
                                            <asp:Parameter Name="ID" Type="Int64" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                        </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gvCatedraticos" EventName="SelectedIndexChanged" />
                        </Triggers>

                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
        <div class="modal fade" role="dialog" id="nuevaAsignacion">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                        <h4 class="modal-title">Nueva Asignacion</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form">
                            <div class="form-group">
                                <label>Carrera: </label>
                                <select id="Carrera" name="Carrera" class="form-control" required="required">
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Curso: </label>
                                <select id="Curso" name="Curso" class="form-control" required="required">
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Seccion: </label>
                                <input type="text" id="Seccion" name="Seccion" class="form-control" required="required" placeholder="Seccion" />
                            </div>
                            <div class="form-group text-center">
                                <input type="submit" name="GuardarAsignacion" id="GuardarAsignacion" class="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="modal fade" role="dialog" id="nuevoCatedratico">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal">×</button>
                    <h4 class="modal-title">Agregar Catedraticos</h4>
                </div>
                <div class="modal-body">
                    <form method="post" action="Catedraticos.aspx" class="form">
                        <div class="form-group">
                            <label>Nombre: </label>
                            <input type="text" id="Nombre" name="Nombre" class="form-control" required="required" placeholder="Nombre" />
                        </div>
                        <div class="form-group">
                            <label>Codigo: </label>
                            <input type="number" id="Codigo" name="Codigo" class="form-control" required="required" />
                        </div>
                        <div class="form-group text-center">
                            <input type="submit" id="GuardarCatedratico" name="GuardarCatedratico" value="Guardar" class="btn btn-primary" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

