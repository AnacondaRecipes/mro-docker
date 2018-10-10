#!/usr/bin/env bash

echo "#############"
echo "# Hardening #"
echo "#############"
echo ""
./hardening-check /usr/lib/R/bin/exec/R

echo "####################"
echo "# R-benchmark-25.R #"
echo "####################"
echo
Rscript --vanilla R-benchmark-25.R

echo "#############"
echo "# MASS-ex.R #"
echo "#############"
echo ""
time -p R --vanilla CMD BATCH MASS-ex.R /dev/null
