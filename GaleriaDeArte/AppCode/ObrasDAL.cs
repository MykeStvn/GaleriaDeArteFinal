using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace GaleriaDeArte.AppCode
{
    public class ObrasDAL
    {
        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        // Método para obtener todas las obras
        public List<Obra> ObtenerObras()
        {
            var obras = new List<Obra>();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("sp_ObtenerObras", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            obras.Add(new Obra
                            {
                                Id = (int)reader["id_obra"],
                                Titulo = reader["titulo_obra"].ToString(),
                                Descripcion = reader["descripcion_obra"].ToString(),
                                Precio = reader.GetDecimal(reader.GetOrdinal("precio_obra")),
                                FechaCreacion = (DateTime)reader["fecha_creacion_obra"],
                                Foto = reader["foto_obra"].ToString(),
                                ArtistaId = (int)reader["fk_id_art"],
                                NombreArtista = reader["NombreArtista"].ToString() // Nueva propiedad
                            });
                        }
                    }
                }
            }
            return obras;
        }

        // Método para obtener una obra por su ID
        public Obra ObtenerObraPorId(int id)
        {
            Obra obra = null;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("sp_ObtenerObraPorId", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", id);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            obra = new Obra
                            {
                                Id = (int)reader["id_obra"],
                                Titulo = reader["titulo_obra"].ToString(),
                                Descripcion = reader["descripcion_obra"].ToString(),
                                Precio = reader.GetDecimal(reader.GetOrdinal("precio_obra")),
                                FechaCreacion = (DateTime)reader["fecha_creacion_obra"],
                                Foto = reader["foto_obra"].ToString(),
                                ArtistaId = (int)reader["fk_id_art"]
                            };
                        }
                    }
                }
            }
            return obra;
        }

        // Método para insertar una nueva obra
        public void InsertarObra(Obra obra)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("sp_InsertarObra", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Titulo", obra.Titulo);
                    cmd.Parameters.AddWithValue("@Descripcion", obra.Descripcion);
                    cmd.Parameters.AddWithValue("@Precio", obra.Precio);
                    cmd.Parameters.AddWithValue("@FechaCreacion", obra.FechaCreacion);
                    cmd.Parameters.AddWithValue("@Foto", obra.Foto);
                    cmd.Parameters.AddWithValue("@ArtistaId", obra.ArtistaId);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Método para actualizar una obra
        public void ActualizarObra(Obra obra)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("sp_ActualizarObra", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Id", obra.Id);
                    cmd.Parameters.AddWithValue("@Titulo", obra.Titulo);
                    cmd.Parameters.AddWithValue("@Descripcion", obra.Descripcion);
                    cmd.Parameters.AddWithValue("@Precio", obra.Precio);
                    cmd.Parameters.AddWithValue("@FechaCreacion", obra.FechaCreacion);
                    cmd.Parameters.AddWithValue("@Foto", obra.Foto);
                    cmd.Parameters.AddWithValue("@ArtistaId", obra.ArtistaId);

                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Método para eliminar una obra
        public void EliminarObra(int id)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("sp_EliminarObra", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Id", id);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}

