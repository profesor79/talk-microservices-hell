using System;
using Microsoft.AspNetCore.Mvc;

namespace authService.IdentityServer.Controllers
{
  [Route("auth/[controller]")]
  public class TestController: ControllerBase
  {
    // POST api/values
    [HttpPost]
    public void Post([FromBody] string value)
    {
      Console.WriteLine( value);
    }
    
    [HttpGet]
    public void Get()
    {
      Console.WriteLine( "Up and running");
    }
  }
}