@echo off

:: Navigate to the project root (assuming format.bat is in scripts/windows/)
cd /d "%~dp0..\.." || (
    echo Failed to navigate to project root
    exit /b 1
)

:: Format src and tests directories
call :DoFormat "src"
call :DoFormat "tests"

EXIT /B %ERRORLEVEL%

:DoFormat
    echo Formatting %~1
    pushd "%~1" || (
        echo Directory "%~1" not found
        exit /b 1
    )
    for /f "delims=" %%f in ('dir /b/s *.cpp *.cc *.h 2^>nul') do (
        clang-format -i "%%f"
    )
    popd
    exit /B 0
