using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API_REST_CRUD.Entities
{
    public class tiendas
    {
        public tiendas()
        {
            fecha_insert = DateTime.Now;
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id_tienda { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        [Display(Name = "Código de tienda")]
        public string codigo_tienda { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        [Display(Name = "Direccion")]
        public string direccion { get; set; }

        
        [Display(Name = "Fecha de insersión")]
        public DateTime fecha_insert { get; set; }
    }
}

