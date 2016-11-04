<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Views_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeader" Runat="Server">
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
                <a class="navbar-brand" style="padding: 0; margin-top: 12px; margin-right: 5px;">
                    <img src="../img/logo.jpg" width="70">
                </a>
                <a class="navbar-brand" href="#">SML</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-pro1-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown active"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Asignaciones <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="asignacionBloques.html">Asignacion de bloques</a>
                            </li>
                            <li class="active"><a href="personalDisponible.html">Disponibilidad de Personal</a>
                            </li>
                            <li><a href="bloquesParaLectura.html">Bloques Asignados para Lectura</a>
                            </li>
                            <li><a href="consultaAsignaciones.html">Consulta de Asignaciones</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Jornadas <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Abrir siguiente Jornada</a>
                            </li>
                            <li><a href="#">Cerrar jornada</a>
                            </li>
                            <li><a href="#">Avance jornada</a>
                            </li>
                            <li><a href="#">Carga de bloque a PlanLect</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Ordenes de trabajo <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Generar ordenes de trabajo</a>
                            </li>
                            <li><a href="#">Anular ordenes de trabajo</a>
                            </li>
                            <li><a href="#">Administracion de ordenes de trabajo</a>
                            </li>
                            <li><a href="#">Emulador de Facturacion</a>
                            </li>
                        </ul>
                    </li>
                    <li><a href="consultas.html"><i class="icon-search"></i> Consultas</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Opciones <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Nombre Usuario</a>
                            </li>
                            <li>
                                <div class="row text-center">
                                    <div class="col-md-12">
                                        <img data-src="../img/anonymous.jpg/100x100" class="img-thumbnail" alt="" src="../img/anonymous.jpg">
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="icon-sun"></i> Menu Principal</a>
                            </li>
                            <li><a href="#"><i class="icon-off"></i> Cerrar Sesi&oacute;n</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMain" Runat="Server">
</asp:Content>

