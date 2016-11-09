<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Resultado.aspx.vb" Inherits="Views_Resultado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeader" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMain" Runat="Server">
    <form id="form1" runat="server">
        <div class="jumbotron text-center">
            <h3><%= Session("NOMBRE") %></h3>
            <h4><%= Session("CARRERA") %></h4>
            <h4><%= Session("CATEDRATICO") %> - <%= Session("CURSO") %></h4>
            <p class="alert-success"> <b>Encuesta Creada</b>, pueden continuar evaluando.</p>
            <a href="../Views/DatosCurso.aspx" class="btn btn-primary btn-lg">Continuar</a>
        </div>
    </form>
</asp:Content>

