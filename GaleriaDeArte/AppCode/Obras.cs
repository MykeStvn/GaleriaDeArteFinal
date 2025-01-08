using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GaleriaDeArte.AppCode
{
    public class Obra
    {
        public int Id { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string Foto { get; set; }
        public int ArtistaId { get; set; }
        public string NombreArtista { get; set; }
    }
}