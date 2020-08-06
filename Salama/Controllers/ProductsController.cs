using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Salama.Models;
using System.IO;

namespace Salama.Controllers
{
    [Authorize]
    public class ProductsController : Controller
    {
        private DB db = new DB();

        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Type);
            return View(products.ToList());
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.Type_ID = new SelectList(db.Types, "ID", "Name");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Name,Price,Description,KMNumber,Type_ID")] Product product,HttpPostedFileBase Photo)
        {
            if (ModelState.IsValid&&Photo!=null)
            {
                db.Products.Add(product);
                db.SaveChanges();
                Photo.SaveAs(Server.MapPath("~/Uploads/Products/" + product.ID + ".jpg"));
                return RedirectToAction("Index");                
            }

            ViewBag.Type_ID = new SelectList(db.Types, "ID", "Name", product.Type_ID);
            return View(product);
        }

        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.Type_ID = new SelectList(db.Types, "ID", "Name", product.Type_ID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Name,Price,Description,KMNumber,Type_ID")] Product product, HttpPostedFileBase Photo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                if(Photo!=null)
                {
                    Photo.SaveAs(Server.MapPath("~/Uploads/Products/" + product.ID + ".jpg"));
                }
                return RedirectToAction("Index");
            }
            ViewBag.Type_ID = new SelectList(db.Types, "ID", "Name", product.Type_ID);
            return View(product);
        }

        // GET: Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            FileInfo F = new FileInfo(Server.MapPath("~/Uploads/Products/" + product.ID + ".jpg"));
            if(F.Exists)
            {
                F.Delete();
            }
            return RedirectToAction("Index");
        }


        [HttpPost]
        public ActionResult Search(string key)
        {
            var Data = db.Products.Where(x => x.Name.Contains(key)).Select(x => new {

                x.ID,
                x.Name,
                x.Price,
                x.KMNumber,
                TypeName=x.Type.Name
            });               
            return Json(Data);
        }
        [HttpPost]
        public ActionResult SearchByTypeName(int Type_ID)
        {
            var Data = db.Products.Where(x => x.Type_ID==Type_ID).Select(x => new {

                x.ID,
                x.Name,
                x.Price,
                x.KMNumber,
                TypeName = x.Type.Name
            });
            return Json(Data);
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
