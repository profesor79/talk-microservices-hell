// Copyright (c) Brock Allen & Dominick Baier. All rights reserved.
// Licensed under the Apache License, Version 2.0. See LICENSE in the project root for license information.


using System;
using System.Reflection;
using authService.IdentityServer.Data;
using authService.IdentityServer.Models;
using IdentityServer4.EntityFramework.DbContexts;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using pegasus.Common.Contracts.Configuration;


namespace authService.IdentityServer
{
  public class Startup
  {
    public IConfiguration Configuration { get; }
    public IHostingEnvironment Environment { get; }

    public Startup(IConfiguration configuration, IHostingEnvironment environment)
    {
      Configuration = configuration;
      Environment = environment;
    }

    public void ConfigureServices(IServiceCollection services)
    {
      services.Configure<ForwardedHeadersOptions>(options =>
      {
        options.ForwardedHeaders = ForwardedHeaders.XForwardedFor | ForwardedHeaders.XForwardedProto;
        options.RequireHeaderSymmetry = false;
        options.KnownNetworks.Clear();
        options.KnownProxies.Clear();
      });
      
      
      var sqlConf = new DockerAuthServiceConfiguration();
      var connectionString = sqlConf.CommandConnectionString;

      var migrationsAssembly = typeof(Startup).GetTypeInfo().Assembly.GetName().Name;
      Console.WriteLine($"migration assembly: {migrationsAssembly}");
      services.AddDbContext<ApplicationDbContext>(options =>
        options.UseSqlServer(connectionString));

      services.AddIdentity<ApplicationUser, IdentityRole>()
        .AddEntityFrameworkStores<ApplicationDbContext>()
        .AddDefaultTokenProviders();

      services.AddMvc().SetCompatibilityVersion(Microsoft.AspNetCore.Mvc.CompatibilityVersion.Version_2_1);


      var builder = services.AddIdentityServer(options =>
        {
          options.Events.RaiseErrorEvents = true;
          options.Events.RaiseInformationEvents = true;
          options.Events.RaiseFailureEvents = true;
          options.Events.RaiseSuccessEvents = true;
        })
        // this adds the config data from DB (clients, resources)
        .AddConfigurationStore(options =>
        {
          options.ConfigureDbContext = b =>
            b.UseSqlServer(connectionString,
              sql => sql.MigrationsAssembly(migrationsAssembly));
        })
        // this adds the operational data from DB (codes, tokens, consents)
        .AddOperationalStore(options =>
        {
          options.ConfigureDbContext = b =>
            b.UseSqlServer(connectionString,
              sql => sql.MigrationsAssembly(migrationsAssembly));

          // this enables automatic token cleanup. this is optional.
          options.EnableTokenCleanup = true;
        })
        .AddAspNetIdentity<ApplicationUser>();


      builder.AddCertificateFromFile();


      services.AddAuthentication()
        .AddGoogle(options =>
        {
          // register your IdentityServer with Google at https://console.developers.google.com
          // enable the Google+ API
          // set the redirect URI to http://localhost:5000/signin-google
          options.ClientId = "copy client ID from Google here";
          options.ClientSecret = "copy client secret from Google here";
        });
    }

 

    public void Configure(IApplicationBuilder app)
    {
      if (Environment.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
        app.UseDatabaseErrorPage();
      }
      else
      {
        app.UseExceptionHandler("/Home/Error");
      }
  
      app.UseForwardedHeaders();
      app.UseStaticFiles();
      app.UseIdentityServer();
      app.UseMvcWithDefaultRoute();
    }
  }
}