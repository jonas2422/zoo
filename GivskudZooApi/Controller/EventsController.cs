using GivskudZooApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using Umbraco.Core.Models;
using Umbraco.Core.Services;
using Umbraco.Web.WebApi;

namespace GivskudZooApi.Controller
{
    public class EventsController : UmbracoApiController
    {
        [HttpGet]
        public List<NewsItems> All()
        {
            IContentService cs = Services.ContentService;
            var home = cs.GetById(1268);
            var AllItems = home.Children();

            List<NewsItems> result = new List<NewsItems>();

            foreach (var item in AllItems)
            {
                NewsItems news = new NewsItems();
                news.id = item.Id;
                news.EventHeadline = item.GetValue<string>("eventTitle");
                news.EventDescription = item.GetValue<string>("descriptionConten");
                news.EventTime = item.GetValue<DateTime>("event");
                result.Add(news);
            }
            return result;
        }

    }
}
