# 要监听的进程名
$processName = "collie.exe"

# 循环监听进程状态
while ($true) {
  # 检查进程状态
  if (Get-Process $processName -ErrorAction SilentlyContinue) {
    Write-Host "Process $processName is running"
  } else {
    Write-Host "Process $processName is not running, exiting script"
    exit 0
  }
  # 等待 3 秒后再次检查进程状态
  Start-Sleep -Seconds 3
}