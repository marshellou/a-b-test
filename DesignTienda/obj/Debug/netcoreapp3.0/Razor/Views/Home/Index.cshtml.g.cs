#pragma checksum "C:\Users\HP PC\source\repos\abtest\DesignTienda\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7c4208f4476b487a60a2a2c9a72e3c5cdf8d58c7"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\HP PC\source\repos\abtest\DesignTienda\Views\_ViewImports.cshtml"
using DesignTienda;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "C:\Users\HP PC\source\repos\abtest\DesignTienda\Views\_ViewImports.cshtml"
using DesignTienda.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"7c4208f4476b487a60a2a2c9a72e3c5cdf8d58c7", @"/Views/Home/Index.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"d6e68fa44edb2f80b6a85e65b0c7a6c6fd731e0e", @"/Views/_ViewImports.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 2 "C:\Users\HP PC\source\repos\abtest\DesignTienda\Views\Home\Index.cshtml"
  
    ViewBag.Title = "Home Page";

#line default
#line hidden
#nullable disable
            WriteLiteral(@"
<div class=""jumbotron"">
    <h1>Tienda en línea</h1>
    <p class=""lead"">Dashboard de ventas de productos</p>
    <p><a href=""#"" class=""btn btn-primary btn-lg"">Learn more &raquo;</a></p>
</div>

<div class=""row"">
    <div class=""col-md-4"">
        <h2>Categorías</h2>
        <p>
            Monitorea las categorías de tus productos con mejores ventas.
        </p>
        <p><a class=""btn btn-default"" href=""https://go.microsoft.com/fwlink/?LinkId=301865"">Learn more &raquo;</a></p>
    </div>
    <div class=""col-md-4"">
        <h2>Ventas</h2>
        <p>Total de venta del día</p>
        <div id=""piechart"" style=""width: 450px; height: 250px;""></div>
        <p><a class=""btn btn-default"" href=""https://go.microsoft.com/fwlink/?LinkId=301866"">Learn more &raquo;</a></p>
    </div>
    <div class=""col-md-4"">
        <h2>Productos</h2>
        <p>Total de productos vendidos</p>
        <p><a class=""btn btn-default"" href=""https://go.microsoft.com/fwlink/?LinkId=301867"">Learn more &raquo;</a><");
            WriteLiteral("/p>\r\n    </div>\r\n</div>");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
