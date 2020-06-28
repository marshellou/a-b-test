using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API_REST_CRUD.Contexts;
using Microsoft.AspNetCore.Mvc;
using API_REST_CRUD.Entities;
using Microsoft.EntityFrameworkCore;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API_REST_CRUD.Controllers
{
    [Route("api/[controller]")]
    public class v_ventas_categoriasController : Controller
    {
        private readonly AppDbContext context;

        public v_ventas_categoriasController(AppDbContext context)
        {
            this.context = context;
        }
        
        // GET: api/<controller> Obteniendo los datos para la gráfica
        [HttpGet]
        public IEnumerable<v_ventas_categorias> Get()
        {
            return context.v_ventas_categorias.ToList();
        }

    }
}
