using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace API_REST_CRUD.Entities
{
    public class inv_productos
    {
        public inv_productos()
        {
            fecha_insert = DateTime.Now;
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Display(Name = "Código")]
        public int id_productos { get; set; }

        [Required]
        [StringLength(50, MinimumLength = 3)]
        [Display(Name = "Nombre")]
        public string nombre { get; set; }

        [Required]        
        [Display(Name = "Cod. Categoria")]
        public int id_categoria { get; set; }
        
        [Display(Name = "Fecha de insersión")]
        public DateTime fecha_insert { get; set; }
    }
}
