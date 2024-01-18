@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
  echo Quyen quan tri da duoc xac nhan.
) else (
  echo Quyen hien tai khong du.
)

pause