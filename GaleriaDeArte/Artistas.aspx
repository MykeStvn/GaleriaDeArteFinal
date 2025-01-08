<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Artistas.aspx.cs" Inherits="GaleriaDeArte.Artistas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>LISTADO DE ARTISTAS</title>
    <!-- Incluir Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Estilos básicos de la tabla */
        .table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        .table th, .table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .table th {
            background-color: #4CAF50;
            color: white;
            font-size: 18px;
        }

        .table td {
            font-size: 16px;
        }

        .table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .table tr:hover {
            background-color: #ddd;
        }

        /* Estilo para las imágenes */
        .table img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }

        /* Estilo para las celdas de texto largo */
        .table .long-text {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        /* Estilo para las celdas de texto largo (cuando es más largo) */
        .table td.long-text {
            word-wrap: break-word;
            white-space: normal;
        }

        /* Estilo para los encabezados */
        .table th {
            text-align: center;
        }

        /* Estilos adicionales */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        form {
            padding: 20px;
        }
    </style>
</head>
<body>
    <h1 style="text-align:center">Artistas Registrados dentro del Sistema de Galería Digital</h1>              
    <form id="form1" runat="server">
        <div class="d-flex justify-content-start mb-3">
           <asp:Button ID="btnRegresar" CssClass="btn btn-danger" runat="server" Text="Regresar" OnClick="btnRegresar_Click" />
        </div>
        <div class="d-flex justify-content-end mb-3">
         <asp:Button ID="btnNuevoArtista" CssClass="btn btn-success" runat="server" Text="Nuevo Artista" OnClick="btnNuevoArtista_Click" />
        </div>
        <div>
            <asp:GridView ID="gvArtistas" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Dni" HeaderText="DNI" />
                    <asp:BoundField DataField="Nombres" HeaderText="Nombres" />
                    <asp:BoundField DataField="Biografia" HeaderText="Biografía" ItemStyle-CssClass="long-text" />
                    <asp:BoundField DataField="Nacionalidad" HeaderText="Nacionalidad" />
                    <asp:BoundField DataField="FechaNacimiento" HeaderText="Fecha de Nacimiento" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:ImageField DataImageUrlField="Foto" HeaderText="Foto">
                        <ItemStyle Width="50px" Height="50px" />
                    </asp:ImageField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <!-- Incluir Bootstrap JS y dependencias -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
