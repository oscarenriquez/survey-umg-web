<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DatosEstudiante.aspx.vb" Inherits="Views_DatosEstudiante" EnableEventValidation="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/encuesta.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpHeader" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

    <form id="form1" runat="server" class="form-horizontal">        

        <h3 class="title">Datos del Estudiante</h3>
        <div class="form-group">
            <label class="control-label col-sm-3">Carnet: </label>
            <div class="col-sm-9">
                <p class="form-control-static">
                    <asp:Label ID="lbCarnet" runat="server" Text="Label"></asp:Label>
                </p>
            </div>
        </div>
        <div class="form-group">
            <label for="listCarreras" class="control-label col-sm-3">Carrera: </label>
            <div class="col-sm-9">
                <asp:DropDownList ID="listCarreras" runat="server" CssClass="form-control" required="required" DataSourceID="DropDownCarrera" DataTextField="NOMBRE" DataValueField="ID"></asp:DropDownList>
                <asp:SqlDataSource ID="DropDownCarrera" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT * FROM [CARRERA]"></asp:SqlDataSource>
            </div>
        </div>
        <div class="form-group">
            <label for="txtNombre" class="control-label col-sm-3">Nombre: </label>
            <div class="col-sm-9">
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required="required"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label for="LIstCiclo" class="control-label col-sm-3">Ciclo: </label>
            <div class="col-sm-9">
                <asp:DropDownList ID="LIstCiclo" runat="server" CssClass="form-control" required="required">
                    <asp:ListItem Value="1">CICLO 1</asp:ListItem>
                    <asp:ListItem Value="2">CICLO 2</asp:ListItem>
                    <asp:ListItem Value="3">CICLO 3</asp:ListItem>
                    <asp:ListItem Value="4">CICLO 4</asp:ListItem>
                    <asp:ListItem Value="5">CICLO 5</asp:ListItem>
                    <asp:ListItem Value="6">CICLO 6</asp:ListItem>
                    <asp:ListItem Value="7">CICLO 7</asp:ListItem>
                    <asp:ListItem Value="8">CICLO 8</asp:ListItem>
                    <asp:ListItem Value="9">CICLO 9</asp:ListItem>
                    <asp:ListItem Value="10">CICLO 10</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group text-center">
            <asp:HyperLink ID="btnCancelar" runat="server" CssClass="btn btn-danger" NavigateUrl="../Default.aspx">Cancelar</asp:HyperLink>
            <asp:Button ID="btnContinuar" runat="server" Text="Continuar" CssClass="btn btn-primary" />
        </div>
    </form>
</asp:Content>

