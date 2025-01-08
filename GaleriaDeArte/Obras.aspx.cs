using System;
using System.Collections.Generic;
using System.Web.UI;
using GaleriaDeArte.AppCode;

namespace GaleriaDeArte
{
    public partial class Obras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarObras();
            }
        }

        private void CargarObras()
        {
            ObrasDAL obrasDAL = new ObrasDAL();
            List<Obra> obras = obrasDAL.ObtenerObras();
            gvObras.DataSource = obras;
            gvObras.DataBind();
        }

        protected void gvObras_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int obraId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Editar")
            {
                Response.Redirect($"EditarObra.aspx?id={obraId}");
            }
            else if (e.CommandName == "Eliminar")
            {
                ObrasDAL obrasDAL = new ObrasDAL();
                obrasDAL.EliminarObra(obraId);
                CargarObras();
            }
        }

        protected void btnCrearObra_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearObra.aspx");
        }
    }
}

