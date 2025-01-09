using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using GaleriaDeArte.AppCode;

namespace GaleriaDeArte.AppCode
{
    public class ExposicionesDAL
    {
        private string connectionString;
        public ExposicionesDAL()
        {
            connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        }

        public List<Exposiciones> ObtenerExposicionesConObras()
        {
            List<Exposiciones> exposiciones = new List<Exposiciones>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("MostrarExposicionesConObras", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            int idExposicion = reader.GetInt32(reader.GetOrdinal("IdExposicion"));
                            Exposiciones exposicion = exposiciones.FirstOrDefault(e => e.IdExposicion == idExposicion);

                            if (exposicion == null)
                            {
                                exposicion = new Exposiciones
                                {
                                    IdExposicion = idExposicion,
                                    DescripcionExposicion = reader.GetString(reader.GetOrdinal("DescripcionExposicion")),
                                    FechaInicio = reader.GetDateTime(reader.GetOrdinal("FechaInicio")),
                                    FechaFin = reader.GetDateTime(reader.GetOrdinal("FechaFin"))
                                };
                                exposiciones.Add(exposicion);
                            }

                            if (!reader.IsDBNull(reader.GetOrdinal("IdObra")))
                            {
                                Obra obra = new Obra
                                {
                                    Id = reader.GetInt32(reader.GetOrdinal("IdObra")),
                                    Titulo = reader.GetString(reader.GetOrdinal("TituloObra")),
                                    Descripcion = reader.GetString(reader.GetOrdinal("DescripcionObra")),
                                    Precio = reader.GetDecimal(reader.GetOrdinal("PrecioObra")),
                                    ArtistaId = reader.GetInt32(reader.GetOrdinal("IdArtista")),
                                    NombreArtista = reader.GetString(reader.GetOrdinal("NombreArtista"))                                    
                                };
                                exposicion.Obras.Add(obra);
                            }
                        }
                    }
                }
            }

            return exposiciones;


        }
    }
}