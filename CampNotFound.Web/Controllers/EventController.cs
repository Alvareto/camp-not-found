using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CampNotFound.Data;
using Microsoft.AspNet.Identity;

namespace CampNotFound.Web.Controllers
{
    public class EventController : Controller
    {
        private CampModelContainer db = new CampModelContainer();

        // GET: Event
        public ActionResult Index()
        {
            return View(db.EventSet.ToList());
        }

        // GET: Event
        public ActionResult List()
        {
            return View(db.EventSet.ToList());
        }

        // GET: Event/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.EventSet.Find(id);
            if (@event == null)
            {
                return HttpNotFound();
            }
            return View(@event);
        }

        // GET: Event/Create
        public ActionResult Create()
        {
            ViewBag.SelectCurrencyOptions = GetCurrenciesDropdown();
            ViewBag.SelectCategoryOptions = GetCategoriesDropdown();
            ViewBag.SelectParentEventOptions = GetParentEventDropdown();
            return View();
        }

        // POST: Event/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description,Price,StartDate,EndDate,User_Id,CreatedBy,LastModifiedBy,CreatedDate,LastModifiedDate,Currency,Camp")] Event @event, int currencyId, int categoryId, int parentEventId)
        {
            @event.Camp = db.CampSet.FirstOrDefault();
            @event.Currency = db.CurrencySet.Find(currencyId);
            @event.Category = db.CategorySet.Find(categoryId);
            @event.ParentEvent = db.EventSet.Find(parentEventId);

            var userId = GetCurrentUserId();
            @event.User_Id = userId;
            @event.CreatedBy = userId;
            @event.LastModifiedBy = userId;
            var moment = DateTime.Now;
            @event.CreatedDate = moment;
            @event.LastModifiedDate = moment;

            if (ModelState.IsValid)
            {
                db.EventSet.Add(@event);
                db.SaveChanges();
                return RedirectToAction("Index");
            }


            return View(@event);
        }

        private SelectList GetCurrenciesDropdown() => new SelectList(db.CurrencySet.ToList(), "Id", "ISOCode");
        private SelectList GetCategoriesDropdown() => new SelectList(db.CategorySet.ToList(), "Id", "Name");
        private SelectList GetParentEventDropdown() => new SelectList(db.EventSet.ToList(), "Id", "Name");
        private String GetCurrentUserId() => User.Identity.GetUserId();

        // GET: Event/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.EventSet.Find(id);
            if (@event == null)
            {
                return HttpNotFound();
            }
            return View(@event);
        }

        // POST: Event/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Price,StartDate,EndDate,User_Id,CreatedBy,LastModifiedBy,CreatedDate,LastModifiedDate")] Event @event)
        {
            if (ModelState.IsValid)
            {
                db.Entry(@event).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(@event);
        }

        // GET: Event/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event @event = db.EventSet.Find(id);
            if (@event == null)
            {
                return HttpNotFound();
            }
            return View(@event);
        }

        // POST: Event/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Event @event = db.EventSet.Find(id);
            db.EventSet.Remove(@event);
            db.SaveChanges();
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
