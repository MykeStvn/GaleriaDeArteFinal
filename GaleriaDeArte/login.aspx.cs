using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace GaleriaDeArte
{
    public partial class login : System.Web.UI.Page
    {
        // CADENA DE CONEXIÓN
        private string connectionString = "Data Source=LAPTOP-3UOE1S3S\\SQLEXPRESS;Initial Catalog=GaleriaDeArteDigital;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Cerrar la sesión activa si existe
            Session.Clear();      // Elimina todos los datos de la sesión
            Session.Abandon();    // Marca la sesión actual como abandonada
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1)); // Deshabilita el caché del navegador
            Response.Cache.SetCacheability(HttpCacheability.NoCache);  // Deshabilita almacenamiento en caché
            Response.Cache.SetNoStore();
            // Si el usuario ya está registrado, redirige a la página principal
            if (Session["UsuarioID"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string email = TextBoxEmail.Text.Trim();
            string password = TextBoxPassword.Text.Trim();

            // Validar usuario y obtener rol
            string userRole = ValidarUsuario(email, password);

            if (!string.IsNullOrEmpty(userRole))
            {
                Session["UsuarioID"] = email;
                Session["UsuarioRol"] = userRole; // Guardar el rol en la sesión

                // Redirigir según el rol del usuario
                if (userRole == "ADMINISTRADOR")
                {
                    Response.Redirect("Default.aspx");
                }
                else if (userRole == "CLIENTE")
                {
                    Response.Redirect("Visualizacion.aspx");
                }
            }
            else
            {
                // Mostrar mensaje de error
                LabelError.Visible = true;
                LabelError.Text = "Usuario o contraseña incorrectos."; // Mensaje que aparece cuando no encuentra al usuario
            }
        }

        // Método para validar el usuario en la BDD (procedimiento almacenado)
        private string ValidarUsuario(string email, string password)
        {
            string userRole = null; // Rol del usuario

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open(); // Abro la conexión 

                    using (SqlCommand cmd = new SqlCommand("ObtenerUsuarioPorEmailLogin", conn)) // Preparo para usar el procedimiento almacenado
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Agregar el parámetro @email_usu al comando
                        cmd.Parameters.AddWithValue("@email_usu", email.ToUpper());

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                string storedPassword = dr["contrasenia_usu"].ToString();

                                // Verificar si la contraseña coincide
                                if (password == storedPassword)
                                {
                                    userRole = dr["rol_usu"].ToString(); // Obtener el rol del usuario
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Mostrar error en la consola o manejar según sea necesario
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return userRole; // Retornar el rol del usuario o null si no es válido
        }
    }
}
