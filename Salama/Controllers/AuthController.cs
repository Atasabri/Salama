using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Salama.Models;
using System.Web.Security;

namespace Salama.Controllers
{
    public class AuthController : Controller
    {
        DB db = new DB();
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string UserName,string Password,string ReturnUrl=null)
        {
            Admin admin = db.Admins.SingleOrDefault(x => x.UserName == UserName && x.Password == Password);
            if(admin==null)
            {
                ViewBag.error = "خطأ في عملية التسجيل !!";
                return View(admin);
            }
            FormsAuthentication.SetAuthCookie(admin.ID.ToString(), false);
            if(ReturnUrl!=null)
            {
                if(Url.IsLocalUrl(ReturnUrl))
                {
                    return Redirect(ReturnUrl);
                }
            }
            return RedirectToAction("Index", "Admins");
        }

        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}