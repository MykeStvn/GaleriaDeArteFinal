using System;
using System.Linq;
using GaleriaDeArte.AppCode;

namespace GaleriaDeArte
{
    public partial class CrearArtista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                DateTime fechaNacimiento;
                bool fechaValida = DateTime.TryParseExact(txtFechaNacimiento.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out fechaNacimiento);

                if (!fechaValida)
                {
                    // Manejar el error de fecha no válida
                    cvFechaNacimiento.IsValid = false;
                    cvFechaNacimiento.ErrorMessage = "La fecha de nacimiento no es válida.";
                    return;
                }

                // Crear el nuevo usuario
                Usuario nuevoUsuario = new Usuario
                {
                    NombreUsuario = txtUsuario.Text,
                    Email = txtEmail.Text,
                    Contrasena = txtContrasena.Text,
                    Rol = "ADMINISTRADOR"
                };

                UsuarioDAL usuarioDAL = new UsuarioDAL();
                int usuarioId = usuarioDAL.InsertarUsuario(nuevoUsuario);

                // Crear el nuevo artista
                Artista nuevoArtista = new Artista
                {
                    Dni = txtDni.Text,
                    Nombres = txtNombres.Text,
                    Biografia = txtBiografia.Text,
                    Nacionalidad = txtNacionalidad.Text,
                    FechaNacimiento = fechaNacimiento,
                    Foto = txtFoto.Text,
                    AdministradorId = usuarioId // Asignar el ID del usuario recién creado
                };

                ArtistaDAL artistaDAL = new ArtistaDAL();
                artistaDAL.InsertarArtista(nuevoArtista);

                // Redirigir a una página de confirmación o mostrar un mensaje de éxito
                Response.Redirect("Artistas.aspx");
            }
        }

        protected void cvDniUnico_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            ArtistaDAL artistaDAL = new ArtistaDAL();
            var artistas = artistaDAL.ObtenerArtistas();
            args.IsValid = !artistas.Any(a => a.Dni == txtDni.Text);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Artistas.aspx");
        }
    }
}

