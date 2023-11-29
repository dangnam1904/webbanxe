using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using webbanxe.Data;
using webbanxe.Models;
using webbanxe.Models.ModelView;

namespace webbanxe.Controllers
{
    public class OrdersController : Controller
    {
        private readonly DataContext _context;

        private const int STATUS_ORDER_SUCCESS = 0;
        private const int STATUS_CANCEL = 3;
        private const int STATUS_PAYMENT = 2;
        private const int STATUS_APPROVE = 1;

        public OrdersController(DataContext context)
        {
            _context = context;
        }

        // GET: Orders
        public async Task<IActionResult> Index()
        {
            //return _context.Order != null ? 
            //            View(await _context.Order.ToListAsync()) :
            //            Problem("Entity set 'DataContext.Order'  is null.");

            var result = from o in _context.Order join c in _context.Carts on o.idCart equals c.IdCart
                         join b in _context.Bike on c.IdBike equals b.IdBike
                         join u in _context.Users on c.IdUser equals u.IdUser
                         where c.IdUser == Int32.Parse(HttpContext.Session.GetString("idUser"))
                         select new
                         {
                             Order = o,
                             Cart = c,
                             Bike = b,
                             User= u
                         };
            List<ViewOrder> listViewOrder = new List<ViewOrder>();
            if (result != null)
            {
                foreach (var i in result)
                {
                    ViewOrder viewCart = new ViewOrder();
                    viewCart.Cart = i.Cart;
                    viewCart.User = i.User;
                    viewCart.Bike = i.Bike;
                    viewCart.Order = i.Order;
                    listViewOrder.Add(viewCart);
                }
            }
            return View(listViewOrder);
        }


        [HttpGet("Orders/Cancal-Order/{id:int}")]
        public async Task<IActionResult> Cancal_Order(int? id)
        {
            if (id == null || _context.Order == null)
            {
                return NotFound();
            }

            var order = await _context.Order
                .FirstOrDefaultAsync(m => m.IdOrder == id);
                
            if (order == null)
            {
                return NotFound();
            }
            else
            {
                order.OrderStatus = STATUS_CANCEL;
                _context.Order.Update(order);
                _context.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        [HttpGet("Orders/Payment-Order/{id:int}")]
        public async Task<IActionResult> Payment_Order(int? id)
        {
            if (id == null || _context.Order == null)
            {
                return NotFound();
            }

            var order = await _context.Order
                .FirstOrDefaultAsync(m => m.IdOrder == id);

            if (order == null)
            {
                return NotFound();
            }
            else
            {
                order.OrderStatus = STATUS_PAYMENT;
                _context.Order.Update(order);
                _context.SaveChanges();
            }

            return RedirectToAction("Index");
        }


        // GET: Orders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Order == null)
            {
                return NotFound();
            }

            var order = await _context.Order
                .FirstOrDefaultAsync(m => m.IdOrder == id);
            if (order == null)
            {
                return NotFound();
            }

            return View(order);
        }

        // GET: Orders/Create
        [HttpGet("Orders/Create/{idCart:int}")]
        public async Task<IActionResult> Create(int idCart)
        {
            if(HttpContext.Session.GetString("idUser") != null)
            {
                if (idCart != 0 || idCart != null)
                {
                    User user = await _context.Users.FirstOrDefaultAsync(m => m.IdUser == Int32.Parse(HttpContext.Session.GetString("idUser")));
                    Cart cart = await _context.Carts.FirstOrDefaultAsync(m => m.IdCart == idCart);
                    Order order = new Order();
                    order.idCart = idCart;
                    order.OrderStatus = STATUS_ORDER_SUCCESS;
                    order.Address = "";
                    order.NumberPhone = user.Phone;
                    return View(order);
                 }
            }
            return View();
        }

        // POST: Orders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdOrder,NumberPhone,Address,OrderStatus,idCart")] Order order)
        {
            if (ModelState.IsValid)
            {
                _context.Add(order);
                var cart = await _context.Carts.FindAsync(order.idCart);
             
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(order);
        }

        // GET: Orders/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Order == null)
            {
                return NotFound();
            }

            var order = await _context.Order.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }
            return View(order);
        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdOrder,NumberPhone,Address,OrderStatus,idCart")] Order order)
        {
            if (id != order.IdOrder)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(order);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderExists(order.IdOrder))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(order);
        }

        // GET: Orders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Order == null)
            {
                return NotFound();
            }

            var order = await _context.Order
                .FirstOrDefaultAsync(m => m.IdOrder == id);
            if (order == null)
            {
                return NotFound();
            }

            return View(order);
        }

        // POST: Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Order == null)
            {
                return Problem("Entity set 'DataContext.Order'  is null.");
            }
            var order = await _context.Order.FindAsync(id);
            if (order != null)
            {
                _context.Order.Remove(order);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool OrderExists(int id)
        {
          return (_context.Order?.Any(e => e.IdOrder == id)).GetValueOrDefault();
        }
    }
}
