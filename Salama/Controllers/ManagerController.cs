using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Salama.Models;
using System.Configuration;

namespace Salama.Controllers
{
    public class ManagerController : ApiController
    {
        DB db = new DB();
        string Domain = ConfigurationManager.AppSettings["Domain"].ToString();

        [HttpGet]
        public IHttpActionResult GetAllTypes()
        {
            var data = db.Types.Select(x => new
            {
                x.ID,
                x.Name,
                Photo = Domain + "/Uploads/Types/" + x.ID + ".jpg"
            });
            return Ok(data);
        }

        [HttpGet]
        public IHttpActionResult GetAllProducts()
        {
            return Ok(db.Products.Select(x => new
            {
                x.ID,
                x.Name,
                TypeName = x.Type.Name,
                x.KMNumber,
                x.Price,
                x.Description,
                Photo = Domain + "/Uploads/Products/" + x.ID + ".jpg"
            }));
        }

        [HttpGet]
        public IHttpActionResult GetProducts(int ID)
        {
                return Ok(db.Products.Where(x=>x.Type_ID==ID).Select(x => new
                {
                    x.ID,
                    x.Name,
                    TypeName = x.Type.Name,
                    x.KMNumber,
                    x.Price,
                    x.Description,
                    Photo = Domain + "/Uploads/Products/" + x.ID + ".jpg"
                }));
        }

        [HttpGet]
        public IHttpActionResult GetSingleProduct(int ID)
        {
           var product= db.Products.Where(x => x.ID == ID).Select(x => new
            {
                x.ID,
                x.Name,
                TypeName = x.Type.Name,
                x.KMNumber,
                x.Price,
                x.Description,
                Photo = Domain + "/Uploads/Products/" + x.ID + ".jpg",
            }).FirstOrDefault();

            if(product!=null)
            {
                return Ok(product);
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpGet]
        public IHttpActionResult UserInfo(string Number)
        {           
            if(Number.Any(x=>char.IsLetter(x)))
            {
                var UserData = db.Users.Where(x=>x.Car_Num==Number).Select(x => new
                {
                    x.ID,
                    x.Name,
                    x.Phone,
                    Orders= x.Orders.Select(y => new
                    {
                       y.ID,
                       y.Date,
                       y.C_Number,
                       Products = y.Order_Details.Select(D =>new
                        {
                           D.Product.Name
                        }),
                        Services = y.order_Service.Select(s =>new
                        {
                            s.Service.Name,
                        })
                    }).OrderByDescending(d=>d.Date)
                }).FirstOrDefault();
                if(UserData!=null)
                {
                    return Ok(UserData);
                }
                else
                {
                    return BadRequest("This Car Number Not Found !!");
                }
            }
            else
            {
                var UserData = db.Users.Where(x => x.Phone == Number).Select(x => new
                {
                    x.ID,
                    x.Name,
                    x.Phone,
                    Orders = x.Orders.Select(y => new
                    {
                        y.ID,
                        y.Date,
                        y.C_Number,
                        Products = y.Order_Details.Select(D => new
                        {
                            D.Product.Name
                        })
                    }).OrderByDescending(d=>d.Date)
                }).FirstOrDefault();
                if (UserData != null)
                {
                    return Ok(UserData);
                }
                else
                {
                    return BadRequest("This Phone Number Not Found !!");
                }
            }
        }

        [HttpGet]
        public IHttpActionResult GetOffers()
        {
            return Ok(db.Offers.Select(x => new
            {
                x.ID,
                x.Name,
                Photo=Domain+"/Uploads/Offers/"+x.ID+".jpg"
            }));
        }

        [HttpGet]
        public IHttpActionResult Photos()
        {
            var Data = db.Photos.Select(x =>new
            {
                Photo=Domain+"/Uploads/Photos/"+x.ID+".jpg"
            });
            return Ok(Data);
        }

    }
}
