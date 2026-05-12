$base = "C:\Users\Workplace\techgamehq.com\articles"

$fernandoArticles = @(
    "best-browser-for-gaminhg-in-2026.html",
    "best-free-games-for-low-end-pcs.html",
    "best-gaming-mice-under-30.html",
    "how-to-get-better-at-fps-games.html",
    "ssd-vs-hdd-for-gaming.html",
    "top-10-indie-games-worth-your-time.html"
)

$cssToAdd = @'

  /* AUTHOR BIO */
  .author-bio { display: flex; gap: 1.25rem; align-items: flex-start; border: 1px solid var(--border); border-top: 4px solid var(--accent); padding: 1.5rem; margin: 2.5rem 0; background: var(--off-white); }
  .author-bio img { width: 72px; height: 72px; border-radius: 50%; object-fit: cover; flex-shrink: 0; }
  .author-avatar { width: 72px; height: 72px; border-radius: 50%; background: var(--accent); display: flex; align-items: center; justify-content: center; font-family: 'Playfair Display', serif; font-size: 1.4rem; font-weight: 900; color: #fff; flex-shrink: 0; }
  .bio-content { flex: 1; }
  .bio-label { font-size: 0.72rem; font-weight: 700; letter-spacing: 0.1em; text-transform: uppercase; color: var(--muted); display: block; margin-bottom: 0.25rem; }
  .bio-name { font-family: 'Playfair Display', serif; font-size: 1.1rem; font-weight: 700; display: block; margin-bottom: 0.35rem; }
  .bio-text { font-size: 0.9rem; color: var(--muted); margin: 0 0 0.5rem; line-height: 1.5; }
  .bio-links a { font-size: 0.82rem; font-weight: 600; color: var(--accent); text-decoration: none; margin-right: 1rem; }
  .bio-links a:hover { text-decoration: underline; }

  /* READ NEXT */
  .read-next { margin: 3rem 0 0; }
  .read-next > h2 { font-family: 'Playfair Display', serif; font-size: 1.4rem; font-weight: 700; margin-bottom: 1.25rem; letter-spacing: -0.01em; }
  .read-next-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 1.25rem; }
  .read-next-card { border: 1px solid var(--border); text-decoration: none; color: var(--text); display: block; transition: border-color 0.2s; }
  .read-next-card:hover { border-color: var(--accent); }
  .read-next-card img { width: 100%; height: 130px; object-fit: cover; display: block; }
  .rn-body { padding: 0.85rem 1rem; }
  .rn-tag { font-size: 0.68rem; font-weight: 700; letter-spacing: 0.08em; text-transform: uppercase; color: var(--accent); display: block; margin-bottom: 0.35rem; }
  .rn-title { font-family: 'Playfair Display', serif; font-size: 0.95rem; font-weight: 700; line-height: 1.3; margin-bottom: 0.4rem; color: var(--text); }
  .rn-time { font-size: 0.78rem; color: var(--muted); }
'@

$fernandoBio = @'
<div class="author-bio">
  <img src="../images/me.jpg" alt="Fernando Oliveira">
  <div class="bio-content">
    <span class="bio-label">Written by</span>
    <span class="bio-name">Fernando Oliveira</span>
    <p class="bio-text">3rd year Computer Science student in Ireland. Gamer and tech enthusiast since childhood.</p>
    <div class="bio-links">
      <a href="https://github.com/ferdnandow" target="_blank" rel="noopener">GitHub</a>
      <a href="../about.html">About TechGameHQ</a>
    </div>
  </div>
</div>
'@

$staffBio = @'
<div class="author-bio">
  <div class="author-avatar">TG</div>
  <div class="bio-content">
    <span class="bio-label">Written by</span>
    <span class="bio-name">TechGameHQ Staff</span>
    <p class="bio-text">The TechGameHQ editorial team — honest guides, real testing, and budget-friendly picks for gamers and tech enthusiasts.</p>
    <div class="bio-links">
      <a href="../about.html">About TechGameHQ</a>
    </div>
  </div>
</div>
'@

$readNext = @'
<div class="read-next">
  <h2>Keep Reading</h2>
  <div class="read-next-grid" id="readNextGrid"></div>
</div>
<script>
var allArticles = [
  { title: "Best Browser for Gaming in 2026", url: "/articles/best-browser-for-gaminhg-in-2026.html", tag: "Tech Guide", time: "7 min read", img: "/images/thumb-tools.jpg" },
  { title: "Best Free Games for Low-End PCs in 2026", url: "/articles/best-free-games-for-low-end-pcs.html", tag: "Gaming", time: "7 min read", img: "/images/thumb-freegames.jpg" },
  { title: "Best Free Tools Every Gamer Should Install in 2026", url: "/articles/best-free-tools-for-gamers.html", tag: "Tech Guide", time: "5 min read", img: "/images/thumb-tools.jpg" },
  { title: "Best Gaming Headsets Under $50 in 2026", url: "/articles/best-gaming-headsets-under-50.html", tag: "Review", time: "6 min read", img: "/images/thumb-headset.jpg" },
  { title: "Best Gaming Mice Under $30 in 2026", url: "/articles/best-gaming-mice-under-30.html", tag: "Review", time: "6 min read", img: "/images/thumb-mice.jpg" },
  { title: "How to Get Better at FPS Games", url: "/articles/how-to-get-better-at-fps-games.html", tag: "Gaming Guide", time: "8 min read", img: "/images/thumb-fps.jpg" },
  { title: "How to Monitor Your PC Temperature While Gaming", url: "/articles/how-to-monitor-pc-temperature-while-gaming.html", tag: "Tech Guide", time: "6 min read", img: "/images/thumb-temp.jpg" },
  { title: "How to Reduce Input Lag on Any Monitor", url: "/articles/how-to-reduce-input-lag-on-any-monitor.html", tag: "Tech Guide", time: "6 min read", img: "/images/thumb-monitor.jpg" },
  { title: "How to Speed Up Your PC for Gaming", url: "/articles/how-to-speed-up-your-pc-for-gaming.html", tag: "Tech Guide", time: "8 min read", img: "/images/thumb-speed.jpg" },
  { title: "SSD vs HDD for Gaming: Does It Actually Matter?", url: "/articles/ssd-vs-hdd-for-gaming.html", tag: "Tech", time: "6 min read", img: "/images/thumb-ssd.jpg" },
  { title: "Top 10 Indie Games Worth Your Time in 2026", url: "/articles/top-10-indie-games-worth-your-time.html", tag: "Gaming", time: "7 min read", img: "/images/thumb-indie.jpg" }
];
(function() {
  var current = window.location.pathname.split('/').pop();
  var others = allArticles.filter(function(a) { return a.url.split('/').pop() !== current; });
  for (var i = others.length - 1; i > 0; i--) { var j = Math.floor(Math.random() * (i + 1)); var tmp = others[i]; others[i] = others[j]; others[j] = tmp; }
  var picks = others.slice(0, 3);
  var grid = document.getElementById('readNextGrid');
  if (grid) {
    grid.innerHTML = picks.map(function(a) {
      return '<a href="' + a.url + '" class="read-next-card"><img src="' + a.img + '" alt="' + a.title + '"><div class="rn-body"><span class="rn-tag">' + a.tag + '</span><div class="rn-title">' + a.title + '</div><span class="rn-time">' + a.time + '</span></div></a>';
    }).join('');
  }
})();
</script>
'@

$files = Get-ChildItem $base -Filter "*.html"

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $isFernando = $fernandoArticles -contains $file.Name

    # 1. Add CSS before </style>
    $cssAnchor = "  footer a { color: var(--accent); text-decoration: none; }"
    $content = $content.Replace($cssAnchor + "`r`n</style>", $cssAnchor + $cssToAdd + "`r`n</style>")
    $content = $content.Replace($cssAnchor + "`n</style>", $cssAnchor + $cssToAdd + "`n</style>")

    # 2. Add author span at start of article-meta
    $metaAnchor = '<div class="article-meta">'
    if ($isFernando) {
        $content = $content.Replace($metaAnchor, $metaAnchor + "`n    <span>By Fernando Oliveira</span>")
    } else {
        $content = $content.Replace($metaAnchor, $metaAnchor + "`n    <span>By TechGameHQ Staff</span>")
    }

    # 3. Add bio + read next before </article>
    $articleEnd = "</article>"
    if ($isFernando) {
        $content = $content.Replace($articleEnd, $fernandoBio + "`n" + $readNext + "`n" + $articleEnd)
    } else {
        $content = $content.Replace($articleEnd, $staffBio + "`n" + $readNext + "`n" + $articleEnd)
    }

    [System.IO.File]::WriteAllText($file.FullName, $content, (New-Object System.Text.UTF8Encoding $false))
    Write-Host "Updated: $($file.Name)"
}

Write-Host "`nDone! All 11 articles updated."
