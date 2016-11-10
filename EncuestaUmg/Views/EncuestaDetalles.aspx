<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="EncuestaDetalles.aspx.vb" Inherits="Views_EncuestaDetalles" %>

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
                <div class="form-horizontal">
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
                        <asp:GridView ID="gvEncuestas" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="table table-condensed" DataSourceID="EncuestaSDS">
                            <Columns>
                                <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE" />
                                <asp:BoundField DataField="CARNET" HeaderText="CARNET" SortExpression="CARNET" />
                                <asp:BoundField DataField="CATEDRATICO" HeaderText="CATEDRATICO" SortExpression="CATEDRATICO" />
                                <asp:BoundField DataField="CURSO" HeaderText="CURSO" SortExpression="CURSO" />
                                <asp:BoundField DataField="TOTAL" HeaderText="TOTAL" SortExpression="TOTAL" />
                                <asp:BoundField DataField="OBSERVACIONES" HeaderText="OBSERVACIONES" SortExpression="OBSERVACIONES" />
                                <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="EncuestaSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT DISTINCT C.NOMBRE, C.CARNET, E.NOMBRE AS CATEDRATICO, F.NOMBRE AS CURSO, A.TOTAL,  A.OBSERVACIONES, A.FECHA FROM ENCUESTA A 
INNER JOIN ENCUESTA_DETALLE B ON (B.ID_ENCUESTA = A.ID)
INNER JOIN ESTUDIANTE C ON (A.ID_ESTUDIANTE = C.ID)
INNER JOIN CATEDRATICO_CURSO D ON (A.ID_CATED_CURSO = D.ID)
INNER JOIN CATEDRATICO E ON (D.ID_CATEDRATICO = E.ID)
INNER JOIN CURSO F ON (D.ID_CURSO = F.ID)
WHERE F.ID_CARRERA = @ID_CARRERA">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ListaCarreras" DefaultValue="0" Name="ID_CARRERA" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

