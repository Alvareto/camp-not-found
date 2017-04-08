using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using CampNotFound.Database;

namespace CampNotFound.Application.Controllers
{
    public class AlbumController : Controller
    {
        private ModelContainer db = new ModelContainer();

        // GET: Album
        public ActionResult Index()
        {
            var albumSet = db.AlbumSet.Include(a => a.Event);
            return View(albumSet.ToList());
        }

        // GET: Album/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Album album = db.AlbumSet.Find(id);
            if (album == null)
            {
                return HttpNotFound();
            }
            return View(album);
        }

        // GET: Album/Create
        public ActionResult Create()
        {
            ViewBag.Id = new SelectList(db.EventSet, "Id", "Id");
            return View();
        }

        // POST: Album/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id")] Album album)
        {
            if (ModelState.IsValid)
            {
                db.AlbumSet.Add(album);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id = new SelectList(db.EventSet, "Id", "Id", album.Id);
            return View(album);
        }

        // GET: Album/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Album album = db.AlbumSet.Find(id);
            if (album == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id = new SelectList(db.EventSet, "Id", "Id", album.Id);
            return View(album);
        }

        // POST: Album/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id")] Album album)
        {
            if (ModelState.IsValid)
            {
                db.Entry(album).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id = new SelectList(db.EventSet, "Id", "Id", album.Id);
            return View(album);
        }

        // GET: Album/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Album album = db.AlbumSet.Find(id);
            if (album == null)
            {
                return HttpNotFound();
            }
            return View(album);
        }

        // POST: Album/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Album album = db.AlbumSet.Find(id);
            db.AlbumSet.Remove(album);
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
