using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AI_Peg_Solitaire.Startup))]
namespace AI_Peg_Solitaire
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
