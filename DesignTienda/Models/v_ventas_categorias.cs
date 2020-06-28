using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DesignTienda.Models
{
    public class v_ventas_categorias
    {
        public string categoria { get; set; }
        public Decimal total_venta { get; set; }

    }
}
