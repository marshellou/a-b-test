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
    public class inv_categoria_prodController : Controller
    {
        private readonly AppDbContext context;

        public inv_categoria_prodController(AppDbContext context)
        {
            this.context = context;
        }


        // GET: api/<controller>
        [HttpGet]
        public IEnumerable<inv_categoria_prod> Get()
        {
            return context.inv_categoria_prod.ToList();
        }

        // GET api/<controller>/5
        [HttpGet("{id}")]
        public inv_categoria_prod Get(int id)
        {
            var categoria = context.inv_categoria_prod.Where(p => p.id_categoria == id).SingleOrDefault();
            return categoria;
        }

        // POST api/<controller>
        [HttpPost]
        public IActionResult Post([FromBody]inv_categoria_prod inv_categoria_prod)
        {   
                if (!ModelState.IsValid)
                return BadRequest(ModelState);

                    context.inv_categoria_prod.Add(inv_categoria_prod);                    
                    context.SaveChanges();
                    return Created($"/api/inv_categoria_prod/{inv_categoria_prod.id_categoria}", inv_categoria_prod);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody]inv_categoria_prod inv_categoria_prod)
        {   
            if (ModelState.IsValid)
            {
                var categoria_prod = context.inv_categoria_prod.FirstOrDefault(p => p.id_categoria == id);
                context.inv_categoria_prod.Update(categoria_prod);
                context.SaveChanges();
                return Ok();
            }
            return BadRequest(ModelState);
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(int id)

        {
            var categoria = await context.inv_categoria_prod.FindAsync(id);
            if (categoria == null)
            {
                return NotFound();
            }
            context.Remove(categoria);
            await context.SaveChangesAsync();
            return NoContent(); 
        }
    }
}