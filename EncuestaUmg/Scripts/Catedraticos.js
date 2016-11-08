$(document).ready(function () {
    function cambiaCarrera(e) {
        e.stopPropagation();
        e.preventDefault();
        Curso
        $.getJSON("Catedraticos.aspx?GetCursos=true&ID_CARRERA=" + e.target.value, function (data) {
            $("#Curso").html("");
            $("#Curso").append("<option value=''> Seleccione una opcion </option>");
            $.each(data, function (item, value) {
                $("#Curso").append("<option value='" + value.ID + "'> " + value.DESCRIPCION + " </option>");
            });
        });
    }
    $.when($.getJSON("Catedraticos.aspx?GetCarreras=true")).then(function(resultado) {        
        $("#Carrera").append("<option value=''> Seleccione una opcion </option>");
        $.each(resultado, function (item, value) {
            $("#Carrera").append("<option value='" + value.ID + "'> " + value.DESCRIPCION + " </option>");
        });
        $("#Carrera").on("change", cambiaCarrera);
    });
});