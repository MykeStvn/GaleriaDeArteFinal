<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Usuarios.Master" CodeBehind="MostrarObras.aspx.cs" Inherits="GaleriaDeArte.MostrarObras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center">Listado de Obras Disponibles</h1>
    <br />
    <br />

    <style>
        .card-img-top {
            object-fit: cover;
            width: 100%;
            height: 200px; /* Ajusta este valor según el tamaño deseado */
            cursor: pointer; /* Cambia el cursor al pasar sobre la imagen */
        }
    </style>

    <div class="row row-cols-1 row-cols-md-2 g-4">
        <asp:Repeater ID="obrasRepeater" runat="server" OnItemCommand="obrasRepeater_ItemCommand">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src='<%# Eval("foto_obra") %>' class="card-img-top" alt="..." data-toggle="modal" data-target="#imageModal" data-src='<%# Eval("foto_obra") %>' />
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("titulo_obra") %></h5>
                            <p class="card-text"><%# Eval("descripcion_obra") %></p>
                            <p class="card-text"><strong>Precio:</strong> <%# Eval("precio_obra", "{0:C}") %></p>
                            <p class="card-text"><strong>Fecha de Creación:</strong> <%# Eval("fecha_creacion_obra", "{0:dd/MM/yyyy}") %></p>
                            <p class="card-text"><strong>Artista:</strong> <%# Eval("NombreArtista") %></p>
                            
                            <a href="#" class="btn btn-success">Comprar</a>                            
                            <asp:Button ID="btnVerArtista" runat="server" Text="Ver Artista" CommandName="VerArtista" CommandArgument='<%# Eval("fk_id_art") %>' CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>    

    <!-- Modal para mostrar la imagen ampliada -->
    <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="imageModalLabel">Imagen Ampliada</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <img id="modalImage" src="" class="img-fluid" alt="Imagen Ampliada" />
                </div>
            </div>
        </div>
    </div>

    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Script para cambiar la imagen del modal al hacer clic en la imagen de la tarjeta
        $('#imageModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Botón que activó el modal
            var src = button.data('src'); // Extraer la información de los datos
            var modal = $(this);
            modal.find('.modal-body #modalImage').attr('src', src);
        });
    </script>
</asp:Content>

