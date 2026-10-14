# wakeup.ps1
# Simulates a key press (F15 - rarely used, won't interfere with typing)
# at a regular interval to prevent Teams/Windows idle status.

Add-Type -AssemblyName System.Windows.Forms

$intervalSeconds = 60   # How often to send the keypress (adjust as needed)
$durationMinutes = 480  # Total runtime in minutes (e.g., 8-hour workday); set to -1 for indefinite

$endTime = if ($durationMinutes -gt 0) {
    (Get-Date).AddMinutes($durationMinutes)
} else {
    [datetime]::MaxValue
}

Write-Host "Starting activity simulation. Press Ctrl+C to stop."
Write-Host "Sending keypress every $intervalSeconds seconds until $endTime"

while ((Get-Date) -lt $endTime) {
    [System.Windows.Forms.SendKeys]::SendWait("{F15}")
    Start-Sleep -Seconds $intervalSeconds
}

Write-Host "wakeup.ps1 is stopped now."