using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PopeyeMarinaWebApp.Startup))]
namespace PopeyeMarinaWebApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
