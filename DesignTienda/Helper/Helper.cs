using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace DesignTienda.Helper
{
    public class inv_categoria_prodAPI 
    {
        public HttpClient Initial()
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri("https://localhost:44334/");
            return client;
        }
    }

    public class v_ventas_categoriasAPI
    {
        public HttpClient Initial()
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri("https://localhost:44334/");
            return client;
        }

    }
 
}