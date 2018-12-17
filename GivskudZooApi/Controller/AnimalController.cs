using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using Umbraco.Web.WebApi;
using GivskudZooApi.Models;
using Umbraco.Core.Services;
using Umbraco.Core.Models;


namespace GivskudZooApi.Controller
{
    public class AnimalController : UmbracoApiController 
    {
        [HttpGet]
        public List<AnimalItems> All()
        {
            IContentService cs = Services.ContentService;
            var home = cs.GetById(1183);
            var AllItems = home.Children();

            List<AnimalItems> result = new List<AnimalItems>();

            foreach(var item in AllItems)
            {
                AnimalItems animal = new AnimalItems();
                animal.Id = item.Id;
                animal.Title = item.GetValue<string>("animalName");
                animal.Description = item.GetValue<string>("shortDescription");
                animal.Content = item.GetValue<string>("animalDescription");
                result.Add(animal);
            }
            return result;
        }

    }
}
