<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Usuarios.Master" CodeBehind="Visualizacion.aspx.cs" Inherits="GaleriaDeArte.Visualizacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center">Bienvenido a la Galería de Arte Digital</h1>
    <p class="lead">Aqui podrás ver todas las obras de tus artistas favoritos</p>            
    <br />
    <br />

    <style>
        .card-img-top {
            object-fit: cover;
            width: 100%;
            height: 200px; /* Ajusta este valor según el tamaño deseado */
        }
    </style>

    <div class="row row-cols-1 row-cols-md-2 g-4">
        <div class="col">
            <div class="card">
                <img src="https://media.istockphoto.com/id/115202405/es/vector/pintura-xxxl.jpg?s=612x612&w=0&k=20&c=cRDvaGm9XgtMYDeA7ZrU7za-ma54sRF53N6QRbxwnfI=" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Obra 1</h5>
                    <p class="card-text">Creada en el año 2020 por el artista Juan Jimenez</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <img src="https://www.artmajeur.com/medias/standard/a/s/astropaint/artwork/6017173_IMG_1536_Web.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">Obra 2</h5>
<p class="card-text">Creada en el año 2025 por el artista Steve White</p>
                </div>
            </div>
        </div>                
    </div>
    <br />
    <div class="card w-50">
  <div class="card-body">
    <h5 class="card-title-center">¿Deseas ver más obras?</h5>
    <p class="card-text-center">Tenemos muchas obras de diferentes artistas</p>
    <a href="MostrarObras.aspx" class="btn btn-primary">Más Obras</a>
  </div>
</div>
</asp:Content>
