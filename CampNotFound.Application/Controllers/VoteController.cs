using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using CampNotFound.Database;

namespace CampNotFound.Application.Controllers
{
    public class VoteController : Controller
    {
        private ModelContainer db = new ModelContainer();

        // GET: Vote
        public ActionResult Index()
        {
            return View(db.VoteSet.ToList());
        }

        // GET: Vote/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vote vote = db.VoteSet.Find(id);
            if (vote == null)
            {
                return HttpNotFound();
            }
            return View(vote);
        }

        // GET: Vote/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Vote/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,UserId")] Vote vote)
        {
            if (ModelState.IsValid)
            {
                db.VoteSet.Add(vote);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vote);
        }

        // GET: Vote/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vote vote = db.VoteSet.Find(id);
            if (vote == null)
            {
                return HttpNotFound();
            }
            return View(vote);
        }

        // POST: Vote/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,UserId")] Vote vote)
        {
            if (ModelState.IsValid)
            {
                db.Entry(vote).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(vote);
        }

        // GET: Vote/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Vote vote = db.VoteSet.Find(id);
            if (vote == null)
            {
                return HttpNotFound();
            }
            return View(vote);
        }

        // POST: Vote/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Vote vote = db.VoteSet.Find(id);
            db.VoteSet.Remove(vote);
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
