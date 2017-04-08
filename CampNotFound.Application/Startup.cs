using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CampNotFound.Application.Startup))]
namespace CampNotFound.Application
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
