using System.Net;
using System.Threading.Tasks;
using Nancy;

namespace service01.Modules
{
    public class HelloWorldModule:NancyModule
    {
        public HelloWorldModule()
        {
            Get("/", async _ => await GetData());
        }

        private Task<object> GetData()
        {
            return Task.FromResult<object>($"hello world from: {Dns.GetHostName()}");
        }
    }
}