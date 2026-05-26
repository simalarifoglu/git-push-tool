@echo off
chcp 65001 >nul
echo ==========================================
echo   GIT PUSH SCRIPT
echo ==========================================
echo.

git rev-parse --is-inside-work-tree >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Bu dizin bir Git reposu degil.
    exit /b 1
)

for /f "tokens=*" %%i in ('git status -s') do set CHANGES=%%i
if "%CHANGES%"=="" (
    echo [INFO] No changes to commit.
    exit /b 0
)

echo [STATUS] Current changes:
git status -s
echo.

echo [DIFF] Changes summary:
git diff --stat
echo.

echo [ADD] Adding all changes...
git add .
echo [OK] All changes added
echo.

set /p commit_message="[COMMIT] Enter your commit message: "

if "%commit_message%"=="" (
    echo [ERROR] Commit message cannot be empty.
    exit /b 1
)

echo.
echo [COMMIT] Creating commit...
git commit -m "%commit_message%"

if %errorlevel% equ 0 (
    echo [OK] Commit created successfully
) else (
    echo [ERROR] Commit failed
    exit /b 1
)

echo.
echo [PUSH] Pushing to remote...
git push

if %errorlevel% equ 0 (
    echo.
    echo ==========================================
    echo   [OK] PUSH SUCCESSFUL!
    echo ==========================================
) else (
    echo.
    echo ==========================================
    echo   [ERROR] PUSH FAILED!
    echo ==========================================
    exit /b 1
)
