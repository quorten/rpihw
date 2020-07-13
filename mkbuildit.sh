#! /bin/sh
# Basically, all we need to do is concatenate `pinouts.pdf` onto the
# end of `rpihw.pdf`.  That is, generate `pinouts.pdf` from
# `pinouts.svg`, and generate the plotted PDF schematic from the KiCad
# Eeschema schematics.  `pinouts.svg` is a summary of only the pinout
# information from the datasheets.  Altogether, this provides us with
# a more schematic approach to perfboard wiring.

# We use Ghostscript simply because it is available everywhere on
# Unix, though `pdftk` or the like would be a better approach.
gs -q -dBATCH -sNOPAUSE -dSAFER -sDEVICE=pdfwrite -sPaperSize=a4 -sOutputFile=buildit.pdf rpihw.pdf pinouts.pdf
