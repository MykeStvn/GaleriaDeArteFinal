using System;
using System.Web.UI;
using GaleriaDeArte.AppCode;

namespace GaleriaDeArte
{
    public partial class VerArtista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArtista();
            }
        }

        private void CargarArtista()
        {
            if (int.TryParse(Request.QueryString["id"], out int artistaId))
            {
                ArtistaDAL artistaDAL = new ArtistaDAL();
                Artista artista = artistaDAL.ObtenerArtistaPorId(artistaId);
                if (artista != null)
                {
                    txtNombre.Text = artista.Nombres;
                    txtBiografía.Text = artista.Biografia;
                    txtNacionalidad.Text = artista.Nacionalidad;
                    txtFechaNacimiento.Text = artista.FechaNacimiento.ToString("yyyy-MM-dd");
                    txtFoto.Text = artista.Foto;
                    imgArtista.ImageUrl = artista.Foto;
                }
                else
                {
                    // Manejar el caso en que no se encuentre el artista
                    lblMensaje.Text = "Artista no encontrado.";
                }
            }
            else
            {
                // Manejar el caso en que el ID no sea válido
                lblMensaje.Text = "ID de artista no válido.";
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MostrarObras.aspx");
        }
    }
}
