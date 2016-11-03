<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="view_Login" %>

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
        <form id="formLogin" runat="server">

            <asp:Login ID="Login1" runat="server" Height="100%" TextLayout="TextOnTop" Width="100%">
                <CheckBoxStyle Wrap="True" />
                <LoginButtonStyle CssClass="btn btn-primary btn-lg" />
                <TextBoxStyle CssClass="form-control input-lg" />
                <TitleTextStyle CssClass="title" />
            </asp:Login>

        </form>
    </div>
    <script src="../Scripts/jquery.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</body>
</html>
