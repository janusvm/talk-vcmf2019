# .latexmkrc : settings for the Latexmk build system
# ------------------------------------------------------------------------------

$pdf_mode = 1;
$bibtex_use = 2;
$pdflatex = "pdflatex -synctex=1 -interaction=nonstopmode";
$clean_ext = "loa lol synctex.gz";

@default_files = ("slides.tex");
