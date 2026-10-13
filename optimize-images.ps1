# Simple helper to convert images/profile.jpg to WebP if cwebp is installed
# Usage: .\optimize-images.ps1

$src = "images\profile.jpg"
$dstWebP = "images\profile.webp"

if (Test-Path $src) {
  if (Get-Command cwebp -ErrorAction SilentlyContinue) {
    Write-Host "Converting $src -> $dstWebP using cwebp"
    & cwebp -q 80 $src -o $dstWebP
    if ($LASTEXITCODE -eq 0) { Write-Host "Created $dstWebP" } else { Write-Host "cwebp failed with exit $LASTEXITCODE" }
  } else {
    Write-Host "cwebp not found. Install libwebp (cwebp) or use an image tool like ImageMagick to create profile.webp"
  }
} else {
  Write-Host "$src not found"
}
