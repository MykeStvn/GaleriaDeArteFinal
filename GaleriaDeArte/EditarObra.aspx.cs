using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web.UI;
using GaleriaDeArte.AppCode;

namespace GaleriaDeArte
{
    public partial class EditarObra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarAutores();
                CargarObra();
            }
        }

        private void CargarAutores()
        {
            // Cargar la lista de autores (artistas) en el DropDownList
            ArtistaDAL artistaDAL = new ArtistaDAL();
            List<Artista> artistas = artistaDAL.ObtenerArtistas();
            ddlAutor.DataSource = artistas;
            ddlAutor.DataTextField = "Nombres";
            ddlAutor.DataValueField = "Id";
            ddlAutor.DataBind();
        }

        private void CargarObra()
        {
            int obraId = int.Parse(Request.QueryString["id"]);
            ObrasDAL obrasDAL = new ObrasDAL();
            Obra obra = obrasDAL.ObtenerObraPorId(obraId);

            if (obra != null)
            {
                txtTitulo.Text = obra.Titulo;
                txtDescripcion.Text = obra.Descripcion;
                txtPrecio.Text = obra.Precio.ToString("F2", CultureInfo.InvariantCulture);
                txtFechaCreacion.Text = obra.FechaCreacion.ToString("yyyy-MM-dd");
                txtFoto.Text = obra.Foto;
                imgObra.ImageUrl = obra.Foto;
                ddlAutor.SelectedValue = obra.ArtistaId.ToString();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            decimal precio;
            if (!decimal.TryParse(txtPrecio.Text, NumberStyles.Currency, CultureInfo.InvariantCulture, out precio))
            {
                // Manejar el error de conversión
                // Mostrar un mensaje de error al usuario
                return;
            }

            Obra obraActualizada = new Obra
            {
                Id = int.Parse(Request.QueryString["id"]),
                Titulo = txtTitulo.Text,
                Descripcion = txtDescripcion.Text,
                Precio = precio,
                FechaCreacion = DateTime.Parse(txtFechaCreacion.Text),
                Foto = txtFoto.Text,
                ArtistaId = int.Parse(ddlAutor.SelectedValue)
            };

            ObrasDAL obrasDAL = new ObrasDAL();
            obrasDAL.ActualizarObra(obraActualizada);

            // Redirigir a la página de listado de obras o mostrar un mensaje de éxito
            Response.Redirect("Obras.aspx");
        }
    }
}

