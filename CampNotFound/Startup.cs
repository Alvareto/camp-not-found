using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CampNotFound.Startup))]
namespace CampNotFound
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
