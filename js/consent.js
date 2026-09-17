/* TechGameHQ cookie consent.
   Google Analytics is NOT loaded until the visitor clicks "Accept".
   The choice is remembered in this browser for 6 months and can be changed
   any time through the "Cookie Settings" link in the footer. */
(function () {
  var GA_ID = 'G-DSMM3RVX3F';
  var KEY = 'tghq-consent';
  var MAX_AGE = 1000 * 60 * 60 * 24 * 182;
  var gaLoaded = false;

  function read() {
    try {
      var v = JSON.parse(localStorage.getItem(KEY));
      if (v && v.choice && Date.now() - v.at < MAX_AGE) return v.choice;
    } catch (e) {}
    return null;
  }
  function save(choice) {
    try { localStorage.setItem(KEY, JSON.stringify({ choice: choice, at: Date.now() })); } catch (e) {}
  }

  window.dataLayer = window.dataLayer || [];
  function gtag() { window.dataLayer.push(arguments); }

  function loadAnalytics() {
    if (gaLoaded) return;
    gaLoaded = true;
    gtag('consent', 'default', {
      analytics_storage: 'granted',
      ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied'
    });
    gtag('js', new Date());
    gtag('config', GA_ID);
    var s = document.createElement('script');
    s.async = true;
    s.src = 'https://www.googletagmanager.com/gtag/js?id=' + GA_ID;
    document.head.appendChild(s);
  }

  function clearAnalyticsCookies() {
    document.cookie.split(';').forEach(function (c) {
      var name = c.split('=')[0].trim();
      if (name.indexOf('_ga') === 0) {
        var host = location.hostname;
        ['', '; domain=' + host, '; domain=.' + host].forEach(function (d) {
          document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/' + d;
        });
      }
    });
  }

  function closeBanner() {
    var b = document.getElementById('tghq-consent');
    if (b) b.parentNode.removeChild(b);
  }

  function showBanner() {
    if (document.getElementById('tghq-consent')) return;
    var css = document.createElement('style');
    css.textContent =
      '#tghq-consent{position:fixed;left:0;right:0;bottom:0;z-index:9999;background:#1a1917;color:#fff;' +
      'font-family:"Source Sans 3",system-ui,sans-serif;font-size:0.95rem;line-height:1.5;' +
      'box-shadow:0 -4px 24px rgba(0,0,0,.25);border-top:3px solid #2563eb}' +
      '#tghq-consent .tc-in{max-width:1100px;margin:0 auto;padding:1rem 1.5rem;display:flex;gap:1.25rem;align-items:center;flex-wrap:wrap}' +
      '#tghq-consent p{margin:0;flex:1 1 320px;color:rgba(255,255,255,.85)}' +
      '#tghq-consent a{color:#fff;text-decoration:underline}' +
      '#tghq-consent .tc-btns{display:flex;gap:.6rem;flex:0 0 auto}' +
      '#tghq-consent button{font:inherit;font-weight:600;padding:.55rem 1.25rem;border-radius:4px;cursor:pointer;' +
      'border:1px solid #fff;background:transparent;color:#fff}' +
      '#tghq-consent button.tc-yes{background:#fff;color:#1a1917}' +
      '#tghq-consent button:hover{opacity:.85}' +
      '#tghq-consent button:focus-visible{outline:2px solid #f97316;outline-offset:2px}' +
      '@media(max-width:600px){#tghq-consent .tc-btns{width:100%}#tghq-consent button{flex:1}}';
    document.head.appendChild(css);

    var b = document.createElement('div');
    b.id = 'tghq-consent';
    b.setAttribute('role', 'dialog');
    b.setAttribute('aria-label', 'Cookie consent');
    b.innerHTML =
      '<div class="tc-in"><p>We use cookies for anonymous visitor statistics (Google Analytics). ' +
      'They are only set if you accept. See our <a href="/privacy-policy.html#cookies">Privacy Policy</a>.</p>' +
      '<div class="tc-btns"><button type="button" class="tc-no">Reject</button>' +
      '<button type="button" class="tc-yes">Accept</button></div></div>';
    document.body.appendChild(b);

    b.querySelector('.tc-yes').addEventListener('click', function () {
      save('granted'); closeBanner(); loadAnalytics();
    });
    b.querySelector('.tc-no').addEventListener('click', function () {
      var had = gaLoaded;
      save('denied'); closeBanner(); clearAnalyticsCookies();
      if (had) location.reload();
    });
  }

  function init() {
    var choice = read();
    if (choice === 'granted') loadAnalytics();
    else if (choice !== 'denied') showBanner();

    var links = document.querySelectorAll('[data-cookie-settings]');
    for (var i = 0; i < links.length; i++) {
      links[i].addEventListener('click', function (e) { e.preventDefault(); showBanner(); });
    }
  }

  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
