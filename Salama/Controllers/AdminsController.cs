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
    public class AdminsController : Controller
    {
        private DB db = new DB();

        // GET: Admins
        public ActionResult Index()
        {
            return View(db.Admins.ToList());
        }

        // GET: Admins/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Admin admin = db.Admins.Find(id);
            if (admin == null)
            {
                return HttpNotFound();
            }
            bool AdminType = db.Admins.Find(int.Parse(User.Identity.Name)).IsManager;
            if(!AdminType)
            {
                return RedirectToAction("Index");
            }
            return View(admin);
        }

        // GET: Admins/Create
        public ActionResult Create()
        {
            bool AdminType = db.Admins.Find(int.Parse(User.Identity.Name)).IsManager;
            if (!AdminType)
            {
                return RedirectToAction("Index");
            }
            return View();
        }

        // POST: Admins/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,UserName,Password,IsManager")] Admin admin,HttpPostedFileBase Photo)
        {
            try
            {
                if (ModelState.IsValid && Photo != null)
                {
                    db.Admins.Add(admin);
                    db.SaveChanges();
                    Photo.SaveAs(Server.MapPath("~/Uploads/Admins/" + admin.ID + ".jpg"));
                    return RedirectToAction("Index");
                }

                return View(admin);
            }
            catch
            {
                ViewBag.error = "حدث خطأ في اضافة المدير قد يكون الاسم موجود مسبقا";
                return View(admin);
            }
        }

        // GET: Admins/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Admin admin = db.Admins.Find(id);
            if (admin == null)
            {
                return HttpNotFound();
            }
            bool AdminType = db.Admins.Find(int.Parse(User.Identity.Name)).IsManager;
            if (!AdminType)
            {
                return RedirectToAction("Index");
            }
            return View(admin);
        }

        // POST: Admins/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserName,Password,IsManager")] Admin admin, HttpPostedFileBase Photo)
        {
            try { 
            if (ModelState.IsValid)
            {
                db.Entry(admin).State = EntityState.Modified;
                db.SaveChanges();
                if (Photo != null)
                {
                    Photo.SaveAs(Server.MapPath("~/Uploads/Admins/" + admin.ID + ".jpg"));
                }
                if(admin.ID==int.Parse(User.Identity.Name))
                {
                    return RedirectToAction("Login", "Auth");
                }
                return RedirectToAction("Index");
            }
            return View(admin);
           }
            catch
            {
                ViewBag.error = "حدث خطأ في اضافة المدير قد يكون الاسم موجود مسبقا";
                return View(admin);
             }
         }

        // GET: Admins/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }
            Admin admin = db.Admins.Find(id);
            if (admin == null)
            {
                return HttpNotFound();
            }
            bool AdminType = db.Admins.Find(int.Parse(User.Identity.Name)).IsManager;
            if (!AdminType)
            {
                return RedirectToAction("Index");
            }
            return View(admin);
        }

        // POST: Admins/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Admin admin = db.Admins.Find(id);
            db.Admins.Remove(admin);
            db.SaveChanges();
            FileInfo F = new FileInfo(Server.MapPath("~/Uploads/Admins/" + id + ".jpg"));
            if(F.Exists)
            {
                F.Delete();
            }
            return RedirectToAction("Index");
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
