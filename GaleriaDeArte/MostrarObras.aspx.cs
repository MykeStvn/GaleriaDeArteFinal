using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GaleriaDeArte
{
    public partial class MostrarObras : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadObras();
            }
        }

        private void LoadObras()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("sp_ObtenerObrasMostrar", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable obrasTable = new DataTable();
                    adapter.Fill(obrasTable);

                    obrasRepeater.DataSource = obrasTable;
                    obrasRepeater.DataBind();
                }
            }
        }

        protected void obrasRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "VerArtista")
            {
                string artistaId = e.CommandArgument.ToString();
                Response.Redirect($"VerArtista.aspx?id={artistaId}");
            }

        }
    }
}