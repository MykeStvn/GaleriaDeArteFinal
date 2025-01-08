using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using GaleriaDeArte.AppCode;

public class ArtistaDAL
{
    private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

    public List<Artista> ObtenerArtistas()
    {
        var artistas = new List<Artista>();
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            using (SqlCommand cmd = new SqlCommand("sp_ObtenerArtistas", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure; // Usar procedimiento almacenado

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        artistas.Add(new Artista
                        {
                            Id = (int)reader["id_art"],
                            Dni = reader["dni_art"].ToString(),
                            Nombres = reader["nombres_art"].ToString(),
                            Biografia = reader["biografía_art"].ToString(),
                            Nacionalidad = reader["nacionalidad_art"].ToString(),
                            FechaNacimiento = (DateTime)reader["fecha_nacimiento_art"],
                            Foto = reader["foto_art"].ToString(),
                            AdministradorId = (int)reader["fk_id_usu"]
                        });
                    }
                }
            }
        }
        return artistas;
    }

    // Métodos para Insertar, Actualizar y Eliminar se implementarán aquí con procedimientos almacenados

    // Método para Insertar un nuevo artista
    public void InsertarArtista(Artista artista)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            using (SqlCommand cmd = new SqlCommand("sp_InsertarArtista", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Dni", artista.Dni);
                cmd.Parameters.AddWithValue("@Nombres", artista.Nombres);
                cmd.Parameters.AddWithValue("@Biografia", artista.Biografia);
                cmd.Parameters.AddWithValue("@Nacionalidad", artista.Nacionalidad);
                cmd.Parameters.AddWithValue("@FechaNacimiento", artista.FechaNacimiento);
                cmd.Parameters.AddWithValue("@Foto", artista.Foto);
                cmd.Parameters.AddWithValue("@AdministradorId", artista.AdministradorId);

                cmd.ExecuteNonQuery();
            }
        }
    }

    // Método para actualizar un artista
    public void ActualizarArtista(Artista artista)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            using (SqlCommand cmd = new SqlCommand("sp_ActualizarArtista", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", artista.Id);
                cmd.Parameters.AddWithValue("@Dni", artista.Dni);
                cmd.Parameters.AddWithValue("@Nombres", artista.Nombres);
                cmd.Parameters.AddWithValue("@Biografia", artista.Biografia);
                cmd.Parameters.AddWithValue("@Nacionalidad", artista.Nacionalidad);
                cmd.Parameters.AddWithValue("@FechaNacimiento", artista.FechaNacimiento);
                cmd.Parameters.AddWithValue("@Foto", artista.Foto);

                cmd.ExecuteNonQuery();
            }
        }
    }

    // Método para eliminar un artista
    public void EliminarArtista(int id)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            using (SqlCommand cmd = new SqlCommand("sp_EliminarArtista", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", id);

                cmd.ExecuteNonQuery();
            }
        }
    }


}
