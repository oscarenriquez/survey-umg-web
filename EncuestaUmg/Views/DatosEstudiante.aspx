<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DatosEstudiante.aspx.vb" Inherits="Views_DatosEstudiante" %>

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
                <a class="navbar-brand" href="#">ENCUESTA</a>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

    <form id="form1" runat="server" class="form-horizontal">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <h3 class="title">Datos del Estudiante</h3>
                <div class="form-group">
                    <label class="control-label col-sm-3">Carnet: </label>
                    <div class="col-sm-9">
                        <p class="form-control-static">5190-15-3653</p>
                    </div>
                </div>
                <div class="form-group">
                    <label for="listCarreras" class="control-label col-sm-3">Carrera: </label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="listCarreras" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtNombre" class="control-label col-sm-3">Nombre: </label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="Ciclo" class="control-label col-sm-3">Ciclo: </label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="Ciclo" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group text-center">
                    <asp:HyperLink ID="btnCancelar" runat="server" CssClass="btn btn-danger" NavigateUrl="../Default.aspx">Cancelar</asp:HyperLink>
                    <asp:Button ID="btnContinuar" runat="server" Text="Continuar" CssClass="btn btn-primary"
                        CommandArgument="View2"
                        CommandName="SwitchViewByID" />
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <h3 class="title">Datos del Curso a Evaluar</h3>
                <div class="form-group">
                    <label for="ListaCursos" class="control-label col-sm-3">Curso: </label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ListaCursos" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ListaCatedraticos" class="control-label col-sm-3">Catedr&aacute;tico: </label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ListaCatedraticos" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="ListaSecciones" class="control-label col-sm-3">Secci&oacute;n: </label>
                    <div class="col-sm-9">
                        <asp:DropDownList ID="ListaSecciones" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                    </div>
                </div>
                <div class="form-group text-center">
                    <asp:HyperLink ID="btnCancelar2" runat="server" CssClass="btn btn-danger" NavigateUrl="../Default.aspx">Cancelar</asp:HyperLink>
                    <asp:Button ID="btnContinuar2" runat="server" Text="Continuar" CssClass="btn btn-primary"
                        CommandArgument="View3"
                        CommandName="SwitchViewByID" />
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
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
                            <td class="td1">Utilización plataforma virtual para gestionar su curso</td>
                            <td class="td">
                                <input type="radio" name="pregunta4" id="13" value="4" />
                            </td>
                            <td class="td">
                                <input type="radio" name="pregunta4" id="14" value="3" />
                            </td>
                            <td class="td">
                                <input type="radio" name="pregunta4" id="15" value="2" />
                            </td>
                            <td class="td">
                                <input type="radio" name="pregunta4" id="16" value="1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td1">Evaluación de actividades académicas en orden y con equidad</td>
                            <td class="td">
                                <input type="radio" name="pregunta5" id="17" value="4" />
                            </td>
                            <td class="td">
                                <input type="radio" name="pregunta5" id="18" value="3" />
                            </td>
                            <td class="td">
                                <input type="radio" name="pregunta5" id="19" value="2" />
                            </td>
                            <td class="td">
                                <input type="radio" name="pregunta5" id="uno" value="1" />
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
            </asp:View>
        </asp:MultiView>
        <!---->
    </form>    
</asp:Content>

