<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DatosEncuesta2.aspx.vb" Inherits="Views_DatosEncuesta2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Styles/encuesta.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpHeader" runat="Server">
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
        <div class="well text-center">
            <h3><%= Session("NOMBRE") %></h3>
            <h4><%= Session("CARRERA") %></h4>
            <h4><%= Session("CATEDRATICO") %> - <%= Session("CURSO") %></h4>
        </div>
        <div class="text-center">
            <b>ESTIMADOS ALUMNOS:
								Con base en su criterio formal y objetivo,
								le solicitamos exprese su opición acerca del
                            <br />
                desempleño de sus docente, utilizando la escala de indicadores: Ex = Excelente, MB = Muy bueno, 
								B = Bueno,
                            <br />
                NM = Necesita Mejorar.
            </b>
        </div>  
        <asp:GridView ID="gvPreguntas" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed" DataSourceID="PreguntasSDS" DataKeyNames="ID">
            <Columns>
                <asp:BoundField DataField="ID"  HeaderText="ID" InsertVisible="true" ReadOnly="true" SortExpression="ORDEN" />
                <asp:BoundField DataField="ORDEN" HeaderText="ORDEN" SortExpression="PREGUNTA" />
                <asp:BoundField DataField="PREGUNTA" HeaderText="PREGUNTA" SortExpression="PREGUNTA" />
                <asp:TemplateField HeaderText="VALORACION">
                    <ItemTemplate>
                        <asp:DropDownList ID='listaRespuesta' runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccione una opcion" Value="" />
                            <asp:ListItem Text="EX" Value="4" />
                            <asp:ListItem Text="MB" Value="3" />
                            <asp:ListItem Text="B" Value="2" />
                            <asp:ListItem Text="NM" Value="1" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="listaRespuesta" runat="server" ErrorMessage="Seleccione una opcion"></asp:RequiredFieldValidator>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#107DC8" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="PreguntasSDS" runat="server" ConnectionString="<%$ ConnectionStrings:connStr %>" SelectCommand="SELECT [ID], [ORDEN], [PREGUNTA] FROM [PREGUNTA] WHERE ([ID_CARRERA] = @ID_CARRERA)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_CARRERA" SessionField="ID_CARRERA" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="form-group">
            <div class="col-sm-12">
                <label class="control-label">Observaciones </label>                
                <asp:TextBox ID="Observaciones"  class="form-control" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="form-group text-center">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary btn-lg" />
        </div>
    </form>
</asp:Content>

