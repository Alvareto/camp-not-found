using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using CampNotFound.Data;

namespace CampNotFound.Web.Models
{
    public class TimelineViewModel
    {
        public List<Event> Events { get; set; }
    }
}