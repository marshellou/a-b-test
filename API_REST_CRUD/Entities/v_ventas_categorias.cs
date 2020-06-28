using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API_REST_CRUD.Entities
{
    
    public class v_ventas_categorias
    {
        [Key]
        public int id_categoria { get; set; }
        public string categoria { get; set; }
        public Decimal total_venta { get; set; }
    }
}
