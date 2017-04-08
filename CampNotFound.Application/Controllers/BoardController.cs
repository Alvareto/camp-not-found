using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using CampNotFound.Database;

namespace CampNotFound.Application.Controllers
{
    public class BoardController : Controller
    {
        private ModelContainer db = new ModelContainer();

        // GET: Board
        public ActionResult Index()
        {
            var boardSet = db.BoardSet.Include(b => b.Event);
            return View(boardSet.ToList());
        }

        // GET: Board/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Board board = db.BoardSet.Find(id);
            if (board == null)
            {
                return HttpNotFound();
            }
            return View(board);
        }

        // GET: Board/Create
        public ActionResult Create()
        {
            ViewBag.Id = new SelectList(db.EventSet, "Id", "Id");
            return View();
        }

        // POST: Board/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] Board board)
        {
            if (ModelState.IsValid)
            {
                db.BoardSet.Add(board);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id = new SelectList(db.EventSet, "Id", "Id", board.Id);
            return View(board);
        }

        // GET: Board/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Board board = db.BoardSet.Find(id);
            if (board == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id = new SelectList(db.EventSet, "Id", "Id", board.Id);
            return View(board);
        }

        // POST: Board/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] Board board)
        {
            if (ModelState.IsValid)
            {
                db.Entry(board).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id = new SelectList(db.EventSet, "Id", "Id", board.Id);
            return View(board);
        }

        // GET: Board/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Board board = db.BoardSet.Find(id);
            if (board == null)
            {
                return HttpNotFound();
            }
            return View(board);
        }

        // POST: Board/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Board board = db.BoardSet.Find(id);
            db.BoardSet.Remove(board);
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
