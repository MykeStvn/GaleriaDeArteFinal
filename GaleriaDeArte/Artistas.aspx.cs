using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GaleriaDeArte.AppCode;

namespace GaleriaDeArte
{ 

    public partial class Artistas : System.Web.UI.Page
    {
        private ArtistaDAL artistaDAL = new ArtistaDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarArtistas();
            }
        }
        protected void btnNuevoArtista_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearArtista.aspx");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void CargarArtistas()
        {
            List<Artista> artistas = artistaDAL.ObtenerArtistas();
            gvArtistas.DataSource = artistas;
            gvArtistas.DataBind();
        }

        


    }
}