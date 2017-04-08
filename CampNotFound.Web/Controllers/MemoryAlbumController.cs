using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CampNotFound.Data;

namespace CampNotFound.Web.Controllers
{
    public class MemoryAlbumController : Controller
    {
        private CampModelContainer db = new CampModelContainer();

        // GET: MemoryAlbum
        public ActionResult Index()
        {
            return View(db.MemoryAlbumSet.ToList());
        }

        // GET: MemoryAlbum/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MemoryAlbum memoryAlbum = db.MemoryAlbumSet.Find(id);
            if (memoryAlbum == null)
            {
                return HttpNotFound();
            }
            return View(memoryAlbum);
        }

        // GET: MemoryAlbum/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MemoryAlbum/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,User_Id,CreatedBy,LastModifiedBy,CreatedDate,LastModifiedDate")] MemoryAlbum memoryAlbum)
        {
            if (ModelState.IsValid)
            {
                db.MemoryAlbumSet.Add(memoryAlbum);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(memoryAlbum);
        }

        // GET: MemoryAlbum/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MemoryAlbum memoryAlbum = db.MemoryAlbumSet.Find(id);
            if (memoryAlbum == null)
            {
                return HttpNotFound();
            }
            return View(memoryAlbum);
        }

        // POST: MemoryAlbum/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,User_Id,CreatedBy,LastModifiedBy,CreatedDate,LastModifiedDate")] MemoryAlbum memoryAlbum)
        {
            if (ModelState.IsValid)
            {
                db.Entry(memoryAlbum).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(memoryAlbum);
        }

        // GET: MemoryAlbum/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MemoryAlbum memoryAlbum = db.MemoryAlbumSet.Find(id);
            if (memoryAlbum == null)
            {
                return HttpNotFound();
            }
            return View(memoryAlbum);
        }

        // POST: MemoryAlbum/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MemoryAlbum memoryAlbum = db.MemoryAlbumSet.Find(id);
            db.MemoryAlbumSet.Remove(memoryAlbum);
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
