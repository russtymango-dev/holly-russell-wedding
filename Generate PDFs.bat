@echo off
cd /d "F:\Documents\Wedding 2026"

set LOGFILE=pdf-generation-log.txt
echo PDF Generation Log - %date% %time% > "%LOGFILE%"
echo ================================ >> "%LOGFILE%"

echo ================================================
echo  Holly ^& Russell Wedding - PDF Generator
echo ================================================
echo.

echo [1/4] PRIORITY-PLAN.md...
echo [1/4] PRIORITY-PLAN.md - started at %time% >> "%LOGFILE%"
md-to-pdf PRIORITY-PLAN.md >> "%LOGFILE%" 2>&1
echo [1/4] PRIORITY-PLAN.md - finished at %time% >> "%LOGFILE%"
echo       Done.

echo [2/4] LETTERS-NOTES.md (tracker)...
echo [2/4] LETTERS-NOTES.md - started at %time% >> "%LOGFILE%"
md-to-pdf LETTERS-NOTES.md >> "%LOGFILE%" 2>&1
echo [2/4] LETTERS-NOTES.md - finished at %time% >> "%LOGFILE%"
echo       Done.

echo [3/4] Letters\WEDDING-LETTERS.md (print letters)...
echo [3/4] WEDDING-LETTERS.md - started at %time% >> "%LOGFILE%"
md-to-pdf Letters\WEDDING-LETTERS.md --dest Letters >> "%LOGFILE%" 2>&1
echo [3/4] WEDDING-LETTERS.md - finished at %time% >> "%LOGFILE%"
echo       Done.

echo [4/4] COORDINATION-NOTES.md...
echo [4/4] COORDINATION-NOTES.md - started at %time% >> "%LOGFILE%"
md-to-pdf COORDINATION-NOTES.md >> "%LOGFILE%" 2>&1
echo [4/4] COORDINATION-NOTES.md - finished at %time% >> "%LOGFILE%"
echo       Done.

echo.
echo ================================================
echo  All done! PDFs should be in Wedding 2026 folder.
echo  Check pdf-generation-log.txt if anything looks wrong.
echo ================================================
echo.
echo Completed at %date% %time% >> "%LOGFILE%"
pause
