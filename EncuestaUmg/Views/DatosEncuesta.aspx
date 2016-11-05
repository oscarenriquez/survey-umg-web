<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DatosEncuesta.aspx.vb" Inherits="Views_DatosEncuesta" %>

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
    <form id="form1" runat="server">
        <table class="table">
            <thead>
                <tr>
                    <td colspan="5" class="text-center"><b>ESTIMADOS ALUMNOS:
								Con base en su criterio formal y objetivo,
								le solicitamos exprese su opición acerca del
                            <br />
                        desempleño de sus docente, utilizando la escala de indicadores: Ex = Excelente, MB = Muy bueno, 
								B = Bueno,
                            <br />
                        NM = Necesita Mejorar.
                    </b></td>
                </tr>
                <tr>
                    <td class="td2">ASPECTOS</td>
                    <td class="td2">EX</td>
                    <td class="td2">MB</td>
                    <td class="td2">B</td>
                    <td class="td2">NM</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="td1">Asistencia y puntualidad a su clase</td>
                    <td class="td">
                        <input type="radio" name="pregunta1" id="1" value="4" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta1" id="2" value="3" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta1" id="3" value="2" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta1" id="4" value="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">Conocomiento y dominio de los temas</td>
                    <td class="td">
                        <input type="radio" name="pregunta2" id="5" value="4" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta2" id="6" value="3" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta2" id="7" value="2" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta2" id="8" value="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">Presentación dosificación curso al inicio del semestre</td>
                    <td class="td">
                        <input type="radio" name="pregunta3" id="9" value="4" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta3" id="10" value="3" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta3" id="11" value="2" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta3" id="12" value="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">Utiliza las herramientas tecnologicas provistas en el aula</td>
                    <td class="td">
                        <input type="radio" name="pregunta4" value="4" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta4" value="3" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta4" value="2" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta4" value="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">Utilización plataforma virtual para gestionar su curso</td>
                    <td class="td">
                        <input type="radio" name="pregunta5" id="13" value="4" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta5" id="14" value="3" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta5" id="15" value="2" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta5" id="16" value="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td1">Evaluación de actividades académicas en orden y con equidad</td>
                    <td class="td">
                        <input type="radio" name="pregunta6" id="17" value="4" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta6" id="18" value="3" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta6" id="19" value="2" />
                    </td>
                    <td class="td">
                        <input type="radio" name="pregunta6" id="uno" value="1" />
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="form-group">
            <div class="col-sm-12">
                <label class="control-label">Observaciones </label>
                <textarea name="observaciones" rows="3" cols="70" class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group text-center">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" />
        </div>
    </form>
</asp:Content>

