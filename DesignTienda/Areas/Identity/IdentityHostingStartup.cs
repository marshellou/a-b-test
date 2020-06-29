using System;
using DesignTienda.Areas.Identity.Data;
using DesignTienda.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

[assembly: HostingStartup(typeof(DesignTienda.Areas.Identity.IdentityHostingStartup))]
namespace DesignTienda.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((context, services) => {
                services.AddDbContext<AuthDbContext>(options =>
                    options.UseSqlServer(
                        context.Configuration.GetConnectionString("AuthDbContextConnection")));

                //services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
                //    .AddEntityFrameworkStores<AuthDbContext>();

//services.AddDefaultIdentity<ApplicationUser>(options => {
//                options.Password.RequireLowercase = false;
//                options.Password.RequireUppercase = false;
//                options.SignIn.RequireConfirmedAccount = false;
//            })
//                .AddEntityFrameworkStores<AuthDbContext>();


        });
            

            


        }
    }
}