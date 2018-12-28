using GivskudZooApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using Umbraco.Core.Services;
using Umbraco.Web.WebApi;

namespace GivskudZooApi.Controller
{
    class EventsController : UmbracoApiController
    {
        [HttpGet]
        public List<NewsItems> All() {
            IContentService cs = Services.ContentService;
            var home = cs.GetById();
        }
    }
}
