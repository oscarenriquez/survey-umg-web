$(document).ready(function () {
    var colores = ['#FF0F00', '#FF6600', '#FF9E01', '#FCD202', '#F8FF01', '#B0DE09', '#04D215', '#0D8ECF', '#0D52D1', '#2A0CD0', '#8A0CCF', '#CD0D74', '#CD0E74', '#CD0D81'];
    var dayFin = new Date();    
    var endDate = dayFin.format("dd/mm/yyyy");    
    $('#Fecha').val(endDate);
    $('#Fecha').datepicker().on('changeDate', function (ev) {
        if ($('.datepicker-days').is(':visible')) {
            $(this).datepicker('hide');
        }
    });
    
    var cambiaCurso = function (e) {
        e.stopPropagation();
        e.preventDefault();

        $.getJSON("Dashboard.aspx?GetCatedraticos=true&ID_CURSO=" + e.target.value, function (data) {
            $("#Catedratico").html("");
            $("#Catedratico").append("<option value=''> Seleccione una opcion </option>");
            $.each(data, function (item, value) {
                $("#Catedratico").append("<option value='" + value.ID + "'> " + value.DESCRIPCION + " </option>");
            });
            //$("#Catedratico").on("change", cambiaCarrera);
        });
    };

    var cambiaCarrera = function (e) {
        e.stopPropagation();
        e.preventDefault();
        
        $.getJSON("Dashboard.aspx?GetCursos=true&ID_CARRERA=" + e.target.value, function (data) {
            $("#Curso").html("");
            $("#Catedratico").html("");
            $("#Curso").append("<option value=''> Seleccione una opcion </option>");
            $.each(data, function (item, value) {
                $("#Curso").append("<option value='" + value.ID + "'> " + value.DESCRIPCION + " </option>");
            });
            $("#Curso").on("change", cambiaCurso);
        });
    };

    $.getJSON("Dashboard.aspx?GetCarreras=true").then(function (resultado) {
        $("#Carrera").append("<option value=''> Seleccione una opcion </option>");
        $.each(resultado, function (item, value) {
            $("#Carrera").append("<option value='" + value.ID + "'> " + value.DESCRIPCION + " </option>");
        });
        $("#Carrera").on("change", cambiaCarrera);
    });

    $("#Generar").on("click", function (e) {
        var ID_CURSO = $("#Curso").val();
        var ID_CATEDRATICO = $("#Catedratico").val();
        var IGNORAR = $("#IgnorarFecha").is(":checked");
        var FECHA = $("#Fecha").val();
        if (ID_CURSO && ID_CATEDRATICO) {
            var url = "Dashboard.aspx?GetGrafica=true&ID_CURSO=" + ID_CURSO + "&ID_CATEDRATICO=" + ID_CATEDRATICO + "&IGNORAR=" + IGNORAR + "&FECHA=" + FECHA;
            $.getJSON(url).then(function (data) {
                var provider = [];
                $.each(data, function (index, value) {
                    try {
                        value.color = colores[index];
                        provider.push(value);
                    } catch (e) {
                    }
                });
                if (provider.length == 0) {
                    alert("¡No Existe Información!");
                }
                var chart = AmCharts.makeChart("chartdiv", {
                    "type": "serial",
                    "theme": "light",
                    "marginRight": 70,
                    "dataProvider": provider,
                    "valueAxes": [{
                        "axisAlpha": 0,
                        "position": "left",
                        "title": "Evaluación Promedio Por Sección"
                    }],
                    "startDuration": 1,
                    "graphs": [{
                        "balloonText": "<b>[[category]]: [[value]]</b>",
                        "fillColorsField": "color",
                        "fillAlphas": 0.9,
                        "lineAlpha": 0.2,
                        "type": "column",
                        "valueField": "promedio"
                    }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "seccion",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "labelRotation": 45
                    },
                    "export": {
                        "enabled": true
                    }
                });

                setTimeout(function () {
                    $("a[href='http://www.amcharts.com/javascript-charts/']").remove();
                }, 500);
            });
        }               
    });    
});