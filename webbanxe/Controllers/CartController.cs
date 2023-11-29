using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
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
                //var idUser = Int32.Parse(HttpContext.Session.GetString("idUser"));
                //var listCarrt=  _context.Carts.FromSql($"select * FROM Carts c join Bike b on c.IdBike= b.IdBike join Users u on u.IdUser = c.IdUser WHERE c.IdUser = {idUser} and  IdCart NOT IN (SELECT idCart  FROM [Order] )").ToList();
               
                var listCart2 = from cart in _context.Carts
                               join
                              user in _context.Users on cart.IdUser equals user.IdUser
                               join
                               bike in _context.Bike on cart.IdBike equals bike.IdBike
                               where (cart.IdUser == Int32.Parse(HttpContext.Session.GetString("idUser"))
                               
                               )
                               select new
                               {
                                   Cart = cart,
                                   User = user,
                                   Bike = bike
                               };
                var listOrder = from i in _context.Order.ToList() select i;
                List<ViewCart> listViewCart = new List<ViewCart>();
          
                if (listCart2 != null)
                {
                 foreach (var i in listCart2)
                    {
                        ViewCart viewCart = new ViewCart();
                        viewCart.Cart = i.Cart;
                        viewCart.User = i.User;
                        viewCart.Bike = i.Bike;
                        listViewCart.Add(viewCart);

                        foreach (var item in listOrder)
                        {
                            
                            if (i.Cart.IdCart == item.idCart)
                            {
                                listViewCart.Remove(viewCart);
                                break;
                            }
                        }
                    }
                    
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

        [HttpGet("/cart/update/{id:int}")]
        public async Task<IActionResult> Modify( int id)
        {
            
            if (HttpContext.Session.GetString("idUser") != null)
            {
               
                var oldCart = await _context.Carts.FindAsync(id);
                if(oldCart != null)
                {
                    var bike = await _context.Bike.FindAsync(oldCart.IdBike);
                      ViewBag.Bike=bike;
                }

                return View(oldCart);
            }
            else
            {
                return RedirectToAction("login", "Account");
            }
        }

        [HttpPost("/cart/update")]
        public IActionResult UpdateCart(Cart cart)
        {

            if (HttpContext.Session.GetString("idUser") != null)
            {
              
                _context.Carts.Update(cart);
                _context.SaveChanges();
                return RedirectToAction("Index", "Cart");
            }
            else
            {
                return RedirectToAction("login", "Account");
            }
        }


        [HttpGet("/cart/delete/{id:int}")]
        public async Task<IActionResult> DeleteCart(int id)
        {
            if (HttpContext.Session.GetString("idUser") != null)
            {

                var oldCart = await _context.Carts.FindAsync(id);
                if(oldCart != null)
                {
                    _context.Carts.Remove(oldCart);
                }
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", "Cart");
            }
            else
            {
                return RedirectToAction("login", "Account");
            }
        }
    }
}
