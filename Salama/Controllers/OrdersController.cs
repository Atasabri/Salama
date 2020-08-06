using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Salama.Models;

namespace Salama.Controllers
{
    [Authorize]
    public class OrdersController : Controller
    {
        private DB db = new DB();

        // GET: Orders
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.User);
            return View(orders.ToList());
        }
        [HttpPost]
        public ActionResult FindResults(DateTime Date)
        {
            return View("Index", db.Orders.Where(x => x.Date.CompareTo(Date) == 0).Include(o => o.User));
        }
        // GET: Orders/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // GET: Orders/Create
        public ActionResult Create()
        {
            if(Session["Products"]!=null)
            {
                Session.Remove("Products");
            }
            if (Session["Services"] != null)
            {
                Session.Remove("Services");
            }
            return View();
        }

        // POST: Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Date,C_Number")] Order order,[Bind(Include ="ID,Name,Phone,Car_Num")]User user)
        {
            try
            {
                if (user.ID > 0)
                {
                    order.User_ID = user.ID;
                }
                else
                {
                    order.User = user;
                }
                if (Session["Products"] != null)
                {
                    List<Product> List = Session["Products"] as List<Product>;
                    foreach (var item in List)
                    {
                        order.Order_Details.Add(new Order_Details { Product_ID = item.ID });
                    }
                }
                if (Session["Services"] != null)
                {
                    List<Service> List = Session["Services"] as List<Service>;
                    foreach (var item in List)
                    {
                        order.order_Service.Add(new order_Service { Service_ID = item.ID });
                    }
                }
                db.Orders.Add(order);
                db.SaveChanges();
                ViewBag.Add = "تم اضافة الطلب بنجاح";
                return View();
            }
            catch
            {
                ViewBag.error = "خطأ في الحفظ";
                return View(order);
            }
        }

        // GET: Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["Products"] != null)
            {
                Session.Remove("Products");
            }
            if (Session["Services"] != null)
            {
                Session.Remove("Services");
            }
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Date,C_Number,User_ID")] Order order)
        {
            if (ModelState.IsValid)
            {
                if (Session["Products"] != null)
                {
                    List<Product> List = Session["Products"] as List<Product>;
                    foreach (var item in List)
                    {
                        db.Order_Details.Add(new Order_Details { Product_ID = item.ID,Order_ID=order.ID });
                    }
                }
                if (Session["Services"] != null)
                {
                    List<Service> List = Session["Services"] as List<Service>;
                    foreach (var item in List)
                    {
                        db.order_Service.Add(new order_Service { Service_ID = item.ID,Order_ID=order.ID });
                    }
                }
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(order);
        }

        // GET: Orders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            return View(order);
        }

        // POST: Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order order = db.Orders.Find(id);
            db.Orders.Remove(order);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public JsonResult UserFind(string number)
        {
            var user = db.Users.Where(x => x.Car_Num == number)
                .Select(x=>new {x.ID, x.Name,x.Phone }).FirstOrDefault();
            if(user!=null)
            {
                return Json(user);
            }
            else
            {
                return Json("nodata");
            }
        }
        public JsonResult AddProduct(int Product_ID)
        {
            Product product = db.Products.Find(Product_ID);
            if(Session["Products"]!=null)
            {
                List<Product> List = Session["Products"] as List<Product>;
                if(List.Any(x=>x.ID==Product_ID))
                {
                    return Json(null);
                }
                List.Add(product);
                Session["Products"] = List;
            }
            else
            {
                List<Product> List = new List<Product>();
                List.Add(product);
                Session["Products"] = List;
            }
            return Json(new {product.ID,product.Name });
        }
        public JsonResult AddService(int Service_ID)
        {
            Service service = db.Services.Find(Service_ID);
            if (Session["Services"] != null)
            {
                List<Service> List = Session["Services"] as List<Service>;
                if (List.Any(x=>x.ID== Service_ID))
                {
                    return Json(null);
                }
                List.Add(service);
                Session["Services"] = List;
            }
            else
            {
                List<Service> List = new List<Service>();
                List.Add(service);
                Session["Services"] = List;
            }
            return Json(new {service.ID,service.Name });
        }
        public JsonResult ProdDelete(int Product_ID)
        {
            List<Product> List = Session["Products"] as List<Product>;
            Product product = List.Where(x => x.ID == Product_ID).FirstOrDefault();
            List.Remove(product);
            Session["Products"] = List;
            return Json(Product_ID);
        }
        public JsonResult ServiceDelete(int Service_ID)
        {
            List<Service> List = Session["Services"] as List<Service>;
            Service Service = List.Where(x => x.ID == Service_ID).FirstOrDefault();
            List.Remove(Service);
            Session["Services"] = List;
            return Json(Service_ID);
        }




        public ActionResult DeleteProduct(int id)
        {
            Order_Details data = db.Order_Details.Find(id);
            db.Order_Details.Remove(data);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.AbsolutePath);
        }
        public ActionResult DeleteService(int id)
        {
            order_Service data = db.order_Service.Find(id);
            db.order_Service.Remove(data);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.AbsolutePath);
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
