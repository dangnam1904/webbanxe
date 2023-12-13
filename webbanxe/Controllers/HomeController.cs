using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using webbanxe.Data;
using webbanxe.Models;
using webbanxe.Utilities;

namespace webbanxe.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly DataContext _context;

        public HomeController(ILogger<HomeController> logger, DataContext context)
        {
            _logger = logger;
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var listSlide = await _context.Slides.ToListAsync();
            return View(listSlide);
        }

        public IActionResult Privacy()
        {
            return View();
        }


        [Route("/post/{slug}-{id:long}.html", Name = "Details")]
        public IActionResult Details(long? id)
        {

            if (id == null)
            {
                return NotFound();
            }
            var post = _context.Posts
                .FirstOrDefault(m => (m.PostID == id) && (m.IsActive == true));
            if (post == null)
            {
                return NotFound();
            }
            return View(post);
        }

        [Route("/{slug}-{id:int}.html")]
        public IActionResult List(int? id, string slug, [FromQuery] string search)
        {
           
            if (id == null)
            {
                return NotFound();
            }
            if (slug.Equals("trang-chu"))
            {
                return RedirectToAction("Index");
            }
            if ( slug.Equals("cho-xe"))
            {
                if(search == null || search.Equals(""))
                {
                var listType= from m in _context.TypeBike select m;
                var listBike= from n in _context.Bike select n;
                ViewBag.ListType = listType;
                ViewBag.ListBike = listBike;
                }
                else
                {
                    var listType = from m in _context.TypeBike select m;
                    var listBike = from n in _context.Bike where n.NameBike.Contains(search) select n;
                    ViewBag.ListType = listType;
                    ViewBag.ListBike = listBike;
                }

            }

            if (slug.Equals("phu-kien"))
            {
                if (search == null || search.Equals(""))
                {
                   
                    var listAccessary = from n in _context.Accessaries select n;
                    ViewBag.ListAccessary = listAccessary;
                   
                }
                else
                {
                    var listType = from m in _context.TypeBike select m;
                    var listBike = from n in _context.Bike where n.NameBike.Contains(search) select n;
                    ViewBag.ListType = listType;
                    ViewBag.ListBike = listBike;
                }

            }
            var listType1 = from m in _context.TypeBike select m;
            foreach (var item in listType1)
            {
               
                if (slug.Equals(Functions.RemoveUnicode(item.NameType).ToLower().Replace(" ", "-")))
                {
                    var listType = from m in _context.TypeBike select m;
                    var listBike = from n in _context.Bike where n.TypeBike.IdType == (long)item.IdType select n;
                    ViewBag.ListType = listType;
                    ViewBag.ListBike = listBike;

                }
            }
            if (slug.Equals("tin-tuc"))
            {
                if (search == null || search.Equals(""))
                {
                    var listPost = from m in _context.Posts select m;
                    ViewBag.ListPost = listPost;
                }
                else
                {
                   
                    var listPost = from n in _context.Posts where n.Title.Contains(search) select n;
                    ViewBag.ListPost = listPost;
                    
                  
                }
                //var listPostCurent = (from n in _context.Posts orderby n.CreatedDate ascending select n).Take(3);
                //ViewBag.ListPostCurrent = listPostCurent;
            }
            var listPostCurent = (from n in _context.Posts orderby n.CreatedDate ascending select n).Take(3);
            ViewBag.ListPostCurrent = listPostCurent;
            return View();
        }

        [Route("/{id:int}/{slug}.html"),HttpGet]
        public IActionResult DetailBike(int? id, string slug)
        {
            
            Bike bike1 = new Bike();
            var bike = from m in _context.Bike where m.IdBike == id select m;

            foreach (var item in bike)
            {
                bike1.IdType  = item.IdType;
            }

            var listBikeRelate = from i in _context.Bike where i.IdType== bike1.IdType select i;

            ViewBag.ListBikeRelate = listBikeRelate;
            ViewBag.Bike = bike;

            return View();
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}