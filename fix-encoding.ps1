$staffArticles = @(
    "best-free-tools-for-gamers.html",
    "best-gaming-headsets-under-50.html",
    "how-to-monitor-pc-temperature-while-gaming.html",
    "how-to-reduce-input-lag-on-any-monitor.html",
    "how-to-speed-up-your-pc-for-gaming.html"
)
$emdash = [char]0x2014
$bad  = "editorial team " + [char]0x00E2 + [char]0x20AC + [char]0x201D + " honest"
$good = "editorial team " + $emdash + " honest"
foreach ($f in $staffArticles) {
    $path = "C:\Users\Workplace\techgamehq.com\articles\$f"
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $newContent = $content.Replace($bad, $good)
    if ($newContent -ne $content) {
        [System.IO.File]::WriteAllText($path, $newContent, (New-Object System.Text.UTF8Encoding $false))
        Write-Host "Fixed: $f"
    } else {
        Write-Host "No match: $f"
    }
}
