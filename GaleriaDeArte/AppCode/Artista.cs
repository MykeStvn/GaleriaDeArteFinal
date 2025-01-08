using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GaleriaDeArte.AppCode
{
    public class Artista
    {
        public int Id { get; set; }
        public string Dni { get; set; }
        public string Nombres { get; set; }
        public string Biografia { get; set; }
        public string Nacionalidad { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Foto { get; set; }
        public int AdministradorId { get; set; }
    }
}