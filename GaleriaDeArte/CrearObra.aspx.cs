using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GaleriaDeArte.AppCode;

namespace GaleriaDeArte
{
    public partial class CrearObra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarAutores();
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

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Obra nuevaObra = new Obra
            {
                Titulo = txtTitulo.Text,
                Descripcion = txtDescripcion.Text,
                Precio = decimal.Parse(txtPrecio.Text),
                FechaCreacion = DateTime.Parse(txtFechaCreacion.Text),
                Foto = txtFoto.Text,
                ArtistaId = int.Parse(ddlAutor.SelectedValue)
            };

            ObrasDAL obrasDAL = new ObrasDAL();
            obrasDAL.InsertarObra(nuevaObra);

            // Redirigir a la página de listado de obras o mostrar un mensaje de éxito
            Response.Redirect("Obras.aspx");
        }
    }
}