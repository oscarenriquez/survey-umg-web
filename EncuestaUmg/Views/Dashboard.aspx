<%@ Page Title="" Language="VB" MasterPageFile="~/Mantenimientos.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="Views_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Charts/export.css" rel="stylesheet" />
    <link href="../Styles/Dashboard.css" rel="stylesheet" />
    <link href="../Styles/datepicker.css" rel="stylesheet" />
    <link href="../Styles/datepickerBootstrap.css" rel="stylesheet" />
    <link href="../Styles/datetimepicker.min.css" rel="stylesheet" />
    <script src="../Scripts/Charts/amcharts.js"></script>
    <script src="../Scripts/Charts/serial.js"></script>
    <script src="../Scripts/Charts/export.min.js"></script>
    <script src="../Scripts/Charts/export/libs/FileSaver.js/FileSaver.min.js"></script>
    <script src="../Scripts/Charts/export/libs/fabric.js/fabric.min.js"></script>
    <script src="../Scripts/Charts/export/libs/blob.js/blob.js"></script>
    <script src="../Scripts/Charts/export/libs/jszip/jszip.min.js"></script>
    <script src="../Scripts/Charts/export/libs/pdfmake/pdfmake.min.js"></script>
    <script src="../Scripts/Charts/export/libs/xlsx/xlsx.min.js"></script>
    <script src="../Scripts/Charts/light.js"></script>  
    <script src="../Scripts/bootstrap-datepicker.js"></script>  
    <script src="../Scripts/prototype.js"></script>
    <script src="../Scripts/Dashboard.js"></script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" Runat="Server">
    <form id="form1" runat="server" class="form-horizontal">
        <div class="well">            
            <div class="row">
                <label class="control-label col-sm-1">Fecha:</label>
                <div style="padding: 0;" class="col-sm-2">
                    <input class="form-control" data-date="" data-date-format="dd/mm/yyyy" type="text" name="Fecha" id="Fecha" />
                </div>
                <label class="control-label col-sm-1">Carrera:</label>
                <div style="padding: 0;" class="col-sm-2">
                    <select class="form-control" id="Carrera">

                    </select>
                </div>
                <label class="control-label col-sm-1">Curso:</label>
                <div style="padding: 0;" class="col-sm-2">
                    <select class="form-control" id="Curso">

                    </select>
                </div>
                <label class="control-label col-sm-1">Cated:</label>
                <div style="padding: 0;" class="col-sm-2">
                    <select class="form-control" id="Catedratico">

                    </select>
                </div>
            </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col-sm-3">
                    <label>
                        <input type="checkbox" id="IgnorarFecha" />  
                            Ignorar Fecha
                    </label>
                </div>
                <div class="col-sm-9 text-right">
                    <button type="button" class="btn btn-primary" id="Generar">Generar</button>
                </div>
            </div>                
        </div>
        <div id="chartdiv"></div>
    </form>    
</asp:Content>

