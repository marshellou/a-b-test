using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
namespace API_REST_CRUD.Entities
{
    public class ventas_det
    {
        public ventas_det()
        {
            fecha_insert = DateTime.Now;
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_ventas_det { get; set; }

        public int id_ventas_mst { get; set; }
        public int id_producto { get; set; }

        [Display(Name = "Fecha de insersión")]
        public DateTime fecha_insert { get; set; }
    }
}

