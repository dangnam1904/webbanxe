using Microsoft.AspNetCore.Mvc;
using webbanxe.Data;
using webbanxe.Help;
using webbanxe.Models;
using webbanxe.Models.ModelView;

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
                var listCart2 = from cart in _context.Carts
                               join
                              user in _context.Users on cart.IdUser equals user.IdUser
                               join
                               bike in _context.Bike on cart.IdBike equals bike.IdBike
                               where cart.IdUser == Int32.Parse(HttpContext.Session.GetString("idUser"))
                               select new
                               {
                                   Cart = cart,
                                   User = user,
                                   Bike = bike
                               };

                List<ViewCart> listViewCart = new List<ViewCart>();
                foreach (var i in listCart2)
                { 
                    ViewCart viewCart = new ViewCart();
                    viewCart.Cart = i.Cart;
                    viewCart.User = i.User;
                    viewCart.Bike = i.Bike;
                    listViewCart.Add(viewCart);
                }
                 
                return View(listViewCart);
            }
            else
            {
            return RedirectToAction("login", "Account");
            }
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

        [Route("/{id:int}.html"),HttpGet]
        public IActionResult Modify( int id)
        {
            if (HttpContext.Session.GetString("idUser") != null)
            {
                Cart cart = new Cart();
                cart.IdUser = Int32.Parse(HttpContext.Session.GetString("idUser"));
                cart.QuantityPurchased = 1;
                cart.IdBike = 1;
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
