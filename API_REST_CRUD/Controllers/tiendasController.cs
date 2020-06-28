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


    public class tiendasController : Controller
    {
        private readonly AppDbContext context;

        public tiendasController(AppDbContext context)
        {
            this.context = context;
        }

        // GET: api/<controller>
        [HttpGet]
        public IEnumerable<tiendas> Get()
        {
            return context.tiendas.ToList();
        }


        // GET api/<controller>/5
        [HttpGet("{id}")]
        public tiendas Get(int id)
        {
            var tiendas = context.tiendas.Where(p => p.id_tienda == id).SingleOrDefault();
            return tiendas;
        }

        // POST api/<controller>
        [HttpPost]
        public IActionResult Post([FromBody] tiendas tiendas)
        {

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            context.tiendas.Add(tiendas);
            context.SaveChanges();
            return Created($"/api/tiendas/{tiendas.id_tienda}", tiendas);

        }


        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] tiendas tiendas)
        {
            if (ModelState.IsValid)
            {
                var tienda = context.tiendas.FirstOrDefault(p => p.id_tienda == id);
                context.tiendas.Update(tiendas);
                context.SaveChanges();
                return Ok();
            }
            return BadRequest(ModelState);
        }


        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)

        {
            var tienda = await context.tiendas.FindAsync(id);
            if (tienda == null)
            {
                return NotFound();
            }
            context.Remove(tienda);
            await context.SaveChangesAsync();
            return NoContent();
        }
    }
}
