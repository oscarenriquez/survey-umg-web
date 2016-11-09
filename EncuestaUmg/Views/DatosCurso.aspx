<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DatosCurso.aspx.vb" Inherits="Views_DatosCurso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/encuesta.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeader" runat="server">
    <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-pro1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="padding: 0; margin-right: 5px;">
                    <img src="../Images/172.png" width="50" />
                </a>
                <a class="navbar-brand" href="/Views/Valida.aspx">ENCUESTA</a>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMain" runat="Server">
    <form id="form1" runat="server" class="form-horizontal">
        <asp:HiddenField ID="ID_CARRERA_HIDDEN" runat="server" />
        <h3 class="title">Datos del Curso a Evaluar</h3>
        <div class="form-group">
            <label for="ListaCursos" class="control-label col-sm-3">Curso: </label>
            <div class="col-sm-9">
                <asp:DropDownList ID="ListaCursos" runat="server" CssClass="form-control" required="required" DataSourceID="DrowDownCurso" DataTextField="NOMBRE" DataValueField="ID" AppendDataBoundItems="True" AutoPostBack="True">
                    <asp:ListItem Value="" Text="Seleccione un Curso" />
                </asp:DropDownList>

                <asp:SqlDataSource ID="DrowDownCurso" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT ID, NOMBRE FROM [CURSO] WHERE ([ID_CARRERA] = CAST(@ID_CARRERA AS BIGINT)) 
AND ID NOT IN (select b.id_curso from encuesta as a 
inner join catedratico_curso as b on (b.id = a.id_cated_curso)
where a.id_estudiante = @ID_ESTUDIANTE)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ID_CARRERA_HIDDEN" DefaultValue="0" Name="ID_CARRERA" PropertyName="Value" Type="Int64" />
                        <asp:SessionParameter DefaultValue="0" Name="ID_ESTUDIANTE" SessionField="ID_ESTUDIANTE" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="form-group">

            <label for="ListaCatedraticos" class="control-label col-sm-3">Catedr&aacute;tico: </label>
            <div class="col-sm-9">
                <asp:DropDownList ID="ListaCatedraticos" runat="server" CssClass="form-control" DataSourceID="DropDrownCatedratico" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                <asp:SqlDataSource ID="DropDrownCatedratico" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT A.ID, CONCAT(B.NOMBRE, '-',  A.SECCION) AS NOMBRE FROM [CATEDRATICO_CURSO] AS A INNER JOIN [CATEDRATICO] AS B ON (A.ID_CATEDRATICO = B.ID) WHERE A.ID_CURSO = @ID_CURSO">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListaCursos" DefaultValue="0" Name="ID_CURSO" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

        </div>
        <div class="form-group text-center">
            <asp:HyperLink ID="btnCancelar2" runat="server" CssClass="btn btn-danger" NavigateUrl="../Default.aspx">Cancelar</asp:HyperLink>
            <asp:Button ID="btnContinuar2" runat="server" Text="Continuar" CssClass="btn btn-primary" />
        </div>
    </form>
</asp:Content>

