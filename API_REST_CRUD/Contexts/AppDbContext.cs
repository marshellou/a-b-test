using API_REST_CRUD.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API_REST_CRUD.Contexts
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options):base(options)
        {

        }

        public DbSet<inv_categoria_prod> inv_categoria_prod { get; set; }
        public DbSet<tiendas> tiendas { get; set; }
        public DbSet<inv_productos> inv_productos { get; set; }
        public DbSet<ventas_det> ventas_det { get; set; }
        public DbSet<ventas_mst> ventas_mst { get; set; }
        public DbSet<v_ventas_categorias> v_ventas_categorias { get; set; }       

    }
}
