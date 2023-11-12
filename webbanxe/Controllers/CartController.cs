using Microsoft.AspNetCore.Mvc;
using webbanxe.Data;
using webbanxe.Help;
using webbanxe.Models;

namespace webbanxe.Controllers
{
    public class CartController : Controller
    {

        private readonly DataContext _context;

        public CartController(DataContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            if (HttpContext.Session.GetString("idUser") != null)
            {
                var listCart = from cart in _context.Carts join 
                               user in _context.Users on cart.IdUser equals user.IdUser
                               join 
                               bike in _context.Bike on cart.IdBike equals bike.IdBike
                               where cart.IdUser == Int32.Parse(HttpContext.Session.GetString("idUser")) select new
                               {
                                   Cart = cart,
                                   User = user,
                                   Bike= bike
                               };
        
                ViewBag.listCart= listCart;
            }
         
            return View();
        }

        [Route("/add-to-cart/{idBike:int}.html")]
        public IActionResult actionResult([FromRoute] int idBike)
        {
            if (HttpContext.Session.GetString("idUser") != null)
            {
                Cart cart= new Cart();
                cart.IdUser = Int32.Parse(HttpContext.Session.GetString("idUser"));
                cart.QuantityPurchased = 1;
                cart.IdBike = idBike;
                _context.Carts.Add(cart);
                _context.SaveChanges();
                return RedirectToAction("Index", "Cart");
            }
            else
            {
                return RedirectToAction("login", "Account");
            }
        }
    }
}
