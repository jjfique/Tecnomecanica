using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Tecnomecanica.api;
using Tecnomecanica.api.Controllers;

namespace Tecnomecanica.api.Tests.Controllers
{
    [TestClass]
    public class HomeControllerTest
    {
        [TestMethod]
        public void Index()
        {
            // Disponer
            HomeController controller = new HomeController();

            // Actuar
            ViewResult result = controller.Index() as ViewResult;

            // Declarar
            Assert.IsNotNull(result);
            Assert.AreEqual("Home Page", result.ViewBag.Title);
        }
    }
}
