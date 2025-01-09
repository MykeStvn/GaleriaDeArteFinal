using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GaleriaDeArte.AppCode
{
    public class Exposiciones
    {
        public int IdExposicion { get; set; }
        public string DescripcionExposicion { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public List<Obra> Obras { get; set; }

        public Exposiciones()
        {
            Obras = new List<Obra>();
        }
    }
}