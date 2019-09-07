# Files ------------------------------------------------------------------------

# LaTeX files
SLIDES     = slides.pdf
TEX-THEME := $(wildcard *.sty) $(wildcard img/aau/*.pdf)
TEX-INPUT := $(wildcard incl/*tex)

# R script and output files
R-IMG     := $(wildcard scripts/img/*.R)
ROUT-IMG  := $(R-IMG:.R=.Rout)
ROUT-ALL   = $(ROUT-IMG)

# Figures
IMG-GEN   := $(wildcard img/gen/*.pdf)
IMG-OTHER := $(wildcard img/*.pdf)
IMG-ALL    = $(IMG-GEN) $(IMG-OTHER)

# Rules ------------------------------------------------------------------------

# Main output
$(SLIDES): %.pdf: %.tex $(TEX-INPUT) $(TEX-THEME) $(IMG-ALL) $(ROUT-ALL)
	@echo "Compiling $@"
	@latexmk -quiet && touch $@

# Script output
%.Rout: %.R
	@echo "Running $<"
	@Rscript $< > $@ 2>&1

# Subdirectories
$(ROUT-IMG): | img/gen
img/gen:
	mkdir -p $@

# Cleanup rules
clean-tex:
	latexmk -c

clean-rimg:
	rm -f $(ROUT-IMG)
	rm -f $(IMG-GEN)

clean: clean-tex clean-rimg

.PHONY: clean clean-tex clean-rimg
