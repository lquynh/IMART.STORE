using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Script.Serialization;
namespace shop0903.Controllers
{
    public class ShopController : ApiController
    {
        //productdao
        //php13,java
        [HttpGet]
        public string getListProductByNew()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listpro = db.products.Where(x => x.@new == (byte)1).ToList();
            List<product> Listkq = new List<product>();
            foreach (product k in Listpro)
            {
                product p = new product();
                p.id = k.id;
                p.id_type = k.id_type;
                p.name = k.name;
                p.price = k.price;
                p.image = k.image;
                p.promotion_price = k.promotion_price;
                Listkq.Add(p);
            }
            return Listkq.ParserJSon();
        }
        //java
        [HttpGet]
        public string getListProductBySpecial()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listprosp = db.products.Where(x => x.status == (byte)1).ToList();
            List<product> Listkqsp = new List<product>();
            foreach (product k in Listprosp)
            {
                product p = new product();
                p.name = k.name;
                p.image = k.image;
                p.price = k.price;
                p.promotion_price = k.promotion_price;
                p.id = k.id;
                Listkqsp.Add(p);
            }
            return Listkqsp.ParserJSon();
        }
        //java
        [HttpGet]
        public string getListProductByPromotionPrice()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listpropr = db.products.Where(x => x.promotion_price > 0).ToList();
            List<product> Listkqpr = new List<product>();
            foreach (product k in Listpropr)
            {
                product p = new product();
                p.name = k.name;
                p.image = k.image;
                p.price = k.price;
                p.promotion_price = k.promotion_price;
                p.id = k.id;
                Listkqpr.Add(p);
            }
            return Listkqpr.ParserJSon();
        }
        //php1,java
        [HttpGet]
        public string getProduct(int id)
        {
            DBShopDataContext db = new DBShopDataContext();
            product pro = db.products.FirstOrDefault(x => x.id == id);
            product prokq = new product();
            prokq.name = pro.name;
            prokq.image = pro.image;
            prokq.price = pro.price;
            prokq.promotion_price = pro.promotion_price;
            prokq.promotion = pro.promotion;
            prokq.detail = pro.detail;
            prokq.id_type = pro.id_type;
            prokq.@new = pro.@new;
            return prokq.ParserJSon();
        }
        //php21,java
        [HttpGet]
        public string getListProductByRelated(int id_type)
        {
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listprore = db.products.Where(x => x.id_type == id_type).ToList();
            List<product> Listkqre = new List<product>();
            foreach (product k in Listprore)
            {
                product p = new product();
                p.name = k.name;
                p.image = k.image;
                p.price = k.price;
                p.promotion_price = k.promotion_price;
                p.id = k.id;
                Listkqre.Add(p);
            }
            return Listkqre.ParserJSon();
        }
        //php14,java
        [HttpGet]
        public string getListProductBySearch(string keyword)
        {
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listprobs = db.products.Where(x => x.name.Contains(keyword) == true).ToList();//so sánh chuỗi keyword có hiện diện trong name k
            List<product> Listkqbs = new List<product>();
            foreach (product k in Listprobs)
            {
                product p = new product();
                p.name = k.name;
                p.image = k.image;
                p.price = k.price;
                p.promotion_price = k.promotion_price;
                p.id = k.id;
                p.id_type = k.id_type;
                Listkqbs.Add(p);
            }
            return Listkqbs.ParserJSon();
        }
        //java
        [HttpGet]
        public bool checkMailExist(string email)
        {
            try
            {
                DBShopDataContext db = new DBShopDataContext();
                List<customer> Listuser = db.customers.ToList();
                foreach (customer k in Listuser)
                {
                    if (String.Compare(k.email, email, true) == 0)//so sánh 2 chuỗi không phân biệt hoa thường
                        return true;
                    else
                        return false;
                }
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        //java
        [HttpGet]
        public string login(string email, string password)
        {
            customer us = new customer();
            DBShopDataContext db = new DBShopDataContext();
            List<customer> Listus = db.customers.ToList();
            foreach (customer k in Listus)
            {
                if (String.Compare(k.email, email, true) == 0 && String.Compare(k.password, password, true) == 0)
                {
                    us.id = k.id;
                    us.password = k.password;
                    us.email = k.email;
                }
            }
            return us.ParserJSon();
        }
        //java
        [HttpGet]
        public string getMenu()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<category> Listcate = db.categories.Where(x => x.id_parent == null).ToList();
            List<category> Listcatekq = new List<category>();
            foreach (category k in Listcate)
            {
                category p = new category();
                p.name = k.name;
                Listcatekq.Add(p);
            }

            return Listcatekq.ParserJSon();
        }
        //PHP2,java 
        [HttpPost]
        public bool saveCustomer(string Json)
        {
            try
            {
                JavaScriptSerializer jss = new JavaScriptSerializer();
                customer customer = jss.Deserialize<customer>(Json);
                DBShopDataContext db = new DBShopDataContext();
                db.customers.InsertOnSubmit(customer);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        //php4,java
        [HttpPost]
        public bool saveBill(string Json)
        {
            try
            {
                JavaScriptSerializer jss = new JavaScriptSerializer();
                bill bill = jss.Deserialize<bill>(Json);
                DBShopDataContext db = new DBShopDataContext();
                db.bills.InsertOnSubmit(bill);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        //php6,java
        [HttpPost]
        public bool saveBillDetail(string Json)
        {
            try
            {
                JavaScriptSerializer jss = new JavaScriptSerializer();
                bill_detail billdt = jss.Deserialize<bill_detail>(Json);
                DBShopDataContext db = new DBShopDataContext();
                db.bill_details.InsertOnSubmit(billdt);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        //php16
        [HttpGet]
        public string selectUrlByUrl(string url)
        {
            DBShopDataContext db = new DBShopDataContext();
            page_url pageurl = db.page_urls.FirstOrDefault(x => x.url.Equals(url));
            return pageurl.id.ParserJSon();
        }
        //php9
        [HttpGet]
        public string selectProductByType(int id_type, int id)
        {
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listprokq = new List<product>();
            List<product> Listpro = db.products.Where(x => x.id_type == id_type).ToList();
            foreach (product k in Listpro)
            {
                if (k.id != id)
                {
                    product p = new product();
                    p = k;
                    p.page_url = null;
                    p.category = null;
                    p.bill_details.Clear();
                    Listprokq.Add(p);
                }
            }
            return Listprokq.ParserJSon();
        }
        //php18
        [HttpGet]
        public string getNameType(string url)
        {
            DBShopDataContext db = new DBShopDataContext();
            category cate = new category();
            page_url pageurl = db.page_urls.FirstOrDefault(x => Equals(x.url, url));
            List<category> Listcate = db.categories.ToList();
            foreach (category k in Listcate)
            {
                if (pageurl.id == k.id_url)
                {
                    cate = k;
                }
            }
            cate.products.Clear();
            cate.page_url = null;
            return cate.ParserJSon();
        }
        //php10
        [HttpGet]
        public string selectFeaturedProduct()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listpro = db.products.Where(x => x.status == 1).ToList();
            List<product> Listprokq = new List<product>();
            foreach (product k in Listpro)
            {
                k.category = null;
                k.bill_details.Clear();
                k.page_url = null;
                Listprokq.Add(k);
            }
            return Listprokq.ParserJSon();
        }
        //php22
        [HttpGet]
        public string selectUrlByIdPro(int id)
        {
            DBShopDataContext db = new DBShopDataContext();
            product pro = db.products.FirstOrDefault(x => x.id == id);
            page_url pageurl = db.page_urls.FirstOrDefault(x => x.id == pro.id_url);
            string url = pageurl.url;
            return url;
        }
        //php7
        [HttpGet]
        public string GetAllCate()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<category> Listcate = db.categories.Where(x => x.id_parent == null).ToList();
            foreach (category k in Listcate)
            {

                k.products.Clear();
                k.page_url = null;
            }
            return Listcate.ParserJSon();
        }
        //php24
        [HttpGet]
        public string countProductByCate(int id_cate)
        {
            int count = 0;
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listpro = db.products.Where(x => x.id_type == id_cate).ToList();
            foreach (product k in Listpro)
            {
                count++;
            }
            return count.ParserJSon();
        }
        //php23
        [HttpGet]
        public string selectUrlByIdCate(int id_cate)
        {
            DBShopDataContext db = new DBShopDataContext();
            category cate = db.categories.FirstOrDefault(x => x.id == id_cate);
            page_url pageurl = db.page_urls.FirstOrDefault(x => x.id == cate.id_url);
            string url = pageurl.url;
            return url;
        }
        //php19
        [HttpGet]
        public string selectproductlevel1(int cate_id)
        {
            DBShopDataContext db = new DBShopDataContext();
            List<category> Listcate = db.categories.Where(x => x.id_parent == cate_id).ToList();
            List<product> Listpro = db.products.ToList();
            List<product> Listprokq = new List<product>();
            if (Listcate != null)
            {
                foreach (category k in Listcate)
                {
                    foreach (product p in Listpro)
                    {
                        if (k.id == p.id_type)
                        {
                            p.bill_details.Clear();
                            p.category = null;
                            p.page_url = null;
                            Listprokq.Add(p);
                        }
                    }
                }
            }
            foreach (product p in Listpro)
            {
                if (cate_id == p.id_type)
                {
                    p.bill_details.Clear();
                    p.category = null;
                    p.page_url = null;
                    Listprokq.Add(p);
                }
            }
            return Listprokq.ParserJSon();
        }
        //php8
        [HttpGet]
        public string GetIdTypeByIdPro(int idpro)
        {
            DBShopDataContext db = new DBShopDataContext();
            product pro = db.products.FirstOrDefault(x => x.id == idpro);
            int kq = (int)pro.id_type;
            return kq.ParserJSon();
        }
        //php17
        [HttpGet]
        public string GetCateByUrl(int id_url)
        {
            DBShopDataContext db = new DBShopDataContext();
            category cate = db.categories.FirstOrDefault(x => x.id_url == id_url);
            cate.page_url = null;
            cate.products.Clear();
            return cate.ParserJSon();

        }
        //php11
        [HttpGet]
        public string getSelectSlide()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<slide> Listslide = db.slides.Where(x => x.status == 1).ToList();
            return Listslide.ParserJSon();
        }
        //php12
        [HttpGet]
        public string selectBestSellerProduct()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<product> Listpro = db.products.Where(x => (x.status == 1) && (x.@new == 1)).ToList();
            List<product> Listprokq = new List<product>();
            foreach (product k in Listpro)
            {
                k.category = null;
                k.bill_details.Clear();
                k.page_url = null;
                Listprokq.Add(k);
            }
            return Listprokq.ParserJSon();
        }
        //php3
        [HttpGet]
        public string GetCusByMail(string email)
        {
            DBShopDataContext db = new DBShopDataContext();
            customer cus = db.customers.FirstOrDefault(x => x.email.Equals(email));
            cus.bills.Clear();
            return cus.ParserJSon();
        }
        //php5
        [HttpGet]
        public string GetBillByToken(string token)
        {
            DBShopDataContext db = new DBShopDataContext();
            bill bill = db.bills.FirstOrDefault(x => x.token.Equals(token));
            bill.bill_details.Clear();
            bill.customer = null;
            return bill.ParserJSon();
        }
        //php15
        [HttpGet]
        public string GetAllCateGories(int id_url)
        {
            DBShopDataContext db = new DBShopDataContext();
            List<category> Listcate = db.categories.Where(x => x.id_url == id_url).ToList();
            foreach (category k in Listcate)
            {
                k.products.Clear();
                k.page_url = null;
            }
            return Listcate.ParserJSon();
        }
        //php20
        [HttpGet]
        public string GetAllCateGories()
        {
            DBShopDataContext db = new DBShopDataContext();
            List<category> Listcate = db.categories.Where(x => x.id_parent != null).ToList();
            foreach (category k in Listcate)
            {
                k.products.Clear();
                k.page_url = null;
            }
            return Listcate.ParserJSon();
        }

    }
}
