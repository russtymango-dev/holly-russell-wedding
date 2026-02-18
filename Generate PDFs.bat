@echo off
echo Generating Wedding PDFs...
echo.

cd /d "F:\Documents\Wedding 2026"

echo Converting PRIORITY-PLAN.md...
md-to-pdf PRIORITY-PLAN.md
echo Done!

echo Converting COORDINATION-NOTES.md...
md-to-pdf COORDINATION-NOTES.md
echo Done!

echo.
echo All PDFs generated successfully!
echo Check the Wedding 2026 folder for the PDF files.
echo.
pause

