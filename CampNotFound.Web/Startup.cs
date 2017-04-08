using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CampNotFound.Web.Startup))]
namespace CampNotFound.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
