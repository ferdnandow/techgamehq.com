$base = "C:\Users\Workplace\techgamehq.com\articles"

$newEntries = @'
,
    { title: "How to Upgrade Your RAM for Gaming", url: "/articles/how-to-upgrade-your-ram-for-gaming.html", tag: "Tech Guide", time: "7 min read", img: "/images/thumb-ram.jpg" },
    { title: "Wi-Fi vs Ethernet for Gaming", url: "/articles/wifi-vs-ethernet-for-gaming.html", tag: "Tech Guide", time: "6 min read", img: "/images/thumb-wifi.jpg" },
    { title: "How to Clean Your PC Without Breaking It", url: "/articles/how-to-clean-your-pc.html", tag: "Tech Guide", time: "6 min read", img: "/images/thumb-clean.jpg" }
'@

$oldFiles = @(
    "best-browser-for-gaminhg-in-2026.html",
    "best-free-games-for-low-end-pcs.html",
    "best-free-tools-for-gamers.html",
    "best-gaming-headsets-under-50.html",
    "best-gaming-mice-under-30.html",
    "how-to-get-better-at-fps-games.html",
    "how-to-monitor-pc-temperature-while-gaming.html",
    "how-to-reduce-input-lag-on-any-monitor.html",
    "how-to-speed-up-your-pc-for-gaming.html",
    "ssd-vs-hdd-for-gaming.html",
    "top-10-indie-games-worth-your-time.html"
)

$anchor = '{ title: "Top 10 Indie Games Worth Your Time in 2026", url: "/articles/top-10-indie-games-worth-your-time.html", tag: "Gaming", time: "7 min read", img: "/images/thumb-indie.jpg" }'

foreach ($f in $oldFiles) {
    $path = Join-Path $base $f
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    if ($content.Contains($anchor)) {
        $newContent = $content.Replace($anchor, $anchor + $newEntries)
        [System.IO.File]::WriteAllText($path, $newContent, (New-Object System.Text.UTF8Encoding $false))
        Write-Host "Updated: $f"
    } else {
        Write-Host "Skipped (anchor not found): $f"
    }
}
