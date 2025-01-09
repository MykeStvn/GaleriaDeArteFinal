using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GaleriaDeArte.AppCode;

namespace GaleriaDeArte
{
    public partial class MostrarExposiciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarExposicionesConObras();
            }
        }

        private void CargarExposicionesConObras()
        {
            ExposicionesDAL exposicionesDAL = new ExposicionesDAL();
            List<Exposiciones> exposiciones = exposicionesDAL.ObtenerExposicionesConObras();
            GridViewExposiciones.DataSource = exposiciones;
            GridViewExposiciones.DataBind();
        }

        
    }
}