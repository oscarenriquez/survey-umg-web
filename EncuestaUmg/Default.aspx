<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="view_Index" %>

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
        <img id="Logo" alt="Logo" src="../Images/umg.edu.png" />
        <form id="formStudent" runat="server" class="form-horizontal" role="form" action="/Views/Valida.aspx">
            <h3 class="title">ENCUESTA</h3>            
            <div class="form-group">
                <div class="alert alert-danger" role="alert" id="alert-carnet" style="display:none;">
                    <strong>Error!</strong> No has ingresado un Carnet valido, sigue el siguiente formato NNNN-YY-NNNNNN.
                </div>
            </div>
            <div class="form-group">
                <div class="text-center subtitle"><span>Carnet</span> </div>
                <div class="col-xs-4">
                    <div class="form-group">
                        <asp:TextBox ID="txtCarnet1" runat="server" CssClass="form-control input-lg text-center" placeholder="NNNN" ToolTip="Carrera" CausesValidation="True" MaxLength="4" TextMode="Number" required="required"></asp:TextBox>
                    </div>
                </div>
                <div class="col-xs-4">
                    <asp:TextBox ID="txtCarnet2" runat="server" CssClass="form-control input-lg text-center" placeholder="YY" ToolTip="Carnet" CausesValidation="True" MaxLength="2" TextMode="Number" required="required"></asp:TextBox>
                </div>
                <div class="col-xs-4">
                    <div class="form-group">
                        <asp:TextBox ID="txtCarnet3" runat="server" CssClass="form-control input-lg text-center" placeholder="NNNN" ToolTip="Carnet" CausesValidation="True" MaxLength="8" TextMode="Number" required="required"></asp:TextBox>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <input id="Submit1" class="btn btn-primary btn-block btn-lg" type="submit" value="Entrar" />
            </div>
            <div class="form-group">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-success btn-block btn-lg" NavigateUrl="/Views/Login.aspx" ToolTip="Iniciar Sesion">Iniciar Sesión</asp:HyperLink>
            </div>
        </form>
    </div>
    <script src="../Scripts/jquery.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>    
</body>
</html>
