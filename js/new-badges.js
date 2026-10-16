/* TechGameHQ "New" labels.
   Anything with data-added="<ISO date>" counts as new for 30 days.
   - <time data-added> shows the date and time in the reader's own time zone.
   - .new-badge and the home "Just added" row ship hidden and are only shown
     while the article is new, so an old label can never get stuck on the page. */
(function () {
  var NEW_FOR_DAYS = 30;
  var now = Date.now();
  function isNew(iso) {
    var t = Date.parse(iso);
    return !isNaN(t) && t <= now + 864e5 && now - t < NEW_FOR_DAYS * 864e5;
  }
  document.querySelectorAll('time[data-added]').forEach(function (el) {
    var d = new Date(el.getAttribute('data-added'));
    if (isNaN(d)) return;
    try {
      el.textContent = d.toLocaleString(undefined, { dateStyle: 'medium', timeStyle: 'short' });
    } catch (e) {
      el.textContent = d.toLocaleString();
    }
  });
  document.querySelectorAll('.new-badge[data-added], .ja-card[data-added]').forEach(function (el) {
    if (isNew(el.getAttribute('data-added'))) el.hidden = false;
  });
  document.querySelectorAll('.just-added').forEach(function (sec) {
    if (sec.querySelector('.ja-card:not([hidden])')) sec.hidden = false;
  });
})();
