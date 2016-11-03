<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DatosEstudiante.aspx.vb" Inherits="Views_DatosEstudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Administracion General</title>
    <link href="../Styles/boostrap.css" rel="stylesheet" />
    <link href="../Styles/font-awesome.css" rel="stylesheet" />
    <link href="../Styles/offcanvas.css" rel="stylesheet" />
    <link href="../Styles/login.css" rel="stylesheet" />
    <style>
        a {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="content">
        <form id="formEstudiante" runat="server" class="form-horizontal">
            <h3 class="title">Datos del Estudiante</h3>            
            <div class="form-group">
                <label class="control-label col-sm-2">Carnet: </label>
                <div class="col-sm-10">
                    <p class="form-control-static">5190-15-3653</p>
                </div>
            </div>
            <div class="form-group">
                <label for="txtNombre" class="control-label col-sm-2">Nombre: </label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="Ciclo" class="control-label col-sm-2">Ciclo: </label>
                <div class="col-sm-10">
                    <select id="Ciclo" name="Ciclo" class="form-control" required="required">
                        <%--<option></option>--%>

                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="listCarreras" class="control-label col-sm-2">Carrera: </label>
                <div class="col-sm-10">
                    <asp:DropDownList ID="listCarreras" runat="server" CssClass="form-control" required="required"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label for="txtSeccion" class="control-label col-sm-2">Secci&oacute;n: </label>
                <div class="col-sm-10">
                    <asp:TextBox ID="txtSeccion" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                </div>
            </div>
            <div class="form-group text-center">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-danger" NavigateUrl="../Default.aspx">Cancelar</asp:HyperLink>
                <input id="Submit1" type="submit" class="btn btn-primary" value="Continuar" />
            </div>
        </form>
    </div>
    <script src="../Scripts/jquery.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</body>
</html>
