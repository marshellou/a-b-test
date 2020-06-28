using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
namespace API_REST_CRUD.Entities
{
    public class ventas_mst
    {
        public ventas_mst()
        {
            fecha_insert = DateTime.Now;
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_ventas_mst { get; set; }

        public int id_tienda { get; set; }

        public DateTime fecha_venta { get; set; }

        [Display(Name = "Fecha de insersión")]
        public DateTime fecha_insert { get; set; }
    }
}
