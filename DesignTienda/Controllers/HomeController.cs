using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using DesignTienda.Models;
using DesignTienda.Helper;
using System.Net.Http;
using Newtonsoft.Json;
using System.Data;
using System.ComponentModel;
using Microsoft.AspNetCore.Authorization;

namespace DesignTienda.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        inv_categoria_prodAPI _api = new inv_categoria_prodAPI();
        v_ventas_categoriasAPI _api2 = new v_ventas_categoriasAPI();

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public async Task<IActionResult> Index()
        {
            List<inv_categoria_prod> categorias = new List<inv_categoria_prod>();
            HttpClient client = _api.Initial();
            HttpResponseMessage res = await client.GetAsync("api/inv_categoria_prod");
            if (res.IsSuccessStatusCode)
            {
                var results = res.Content.ReadAsStringAsync().Result;
                categorias = JsonConvert.DeserializeObject<List<inv_categoria_prod>>(results);
            }
            return View(categorias);
        }

        public async Task<IActionResult> ChartCategoria()
        {
            List<v_ventas_categorias> categorias = new List<v_ventas_categorias>();
            HttpClient client = _api2.Initial();
            HttpResponseMessage res = await client.GetAsync("api/v_ventas_categorias");
            if (res.IsSuccessStatusCode)
            {
                var results = res.Content.ReadAsStringAsync().Result;
                categorias = JsonConvert.DeserializeObject<List<v_ventas_categorias>>(results);
            }
            return View(categorias);

        }

        public async Task<IActionResult> Details(int Id)
        {
            var categoria = new inv_categoria_prod();
            HttpClient client = _api.Initial();
            HttpResponseMessage res = await client.GetAsync($"api/inv_categoria_prod/{Id}");
            if (res.IsSuccessStatusCode)
            {
                var results = res.Content.ReadAsStringAsync().Result;
                categoria = JsonConvert.DeserializeObject<inv_categoria_prod>(results);
            }
            return View(categoria);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(inv_categoria_prod inv_categoria_prod)
        {
            HttpClient client = _api.Initial();

            //HTTP POST
            var postTask = client.PostAsJsonAsync<inv_categoria_prod>("api/inv_categoria_prod", inv_categoria_prod);
            postTask.Wait();

            var result = postTask.Result;
            if (result.IsSuccessStatusCode)
            {
                return RedirectToAction("Index");

            }
            return View();
        }

        public async Task<ActionResult> Delete(int Id)
        {
            var categorias = new inv_categoria_prod();
            HttpClient client = _api.Initial();
            HttpResponseMessage res = await client.DeleteAsync($"api/inv_categoria_prod¨/{Id}");
            return RedirectToAction("Index");
        }


        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}