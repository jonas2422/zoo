using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GivskudZooApi.Models
{
    public class NewsItems
    {
        public int id { get; set; }
        public string EventHeadline { get; set; }
        public DateTime EventTime { get; set; }
        public string EventDescription { get; set; }
    }
}
