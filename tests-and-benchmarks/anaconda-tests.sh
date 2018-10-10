#!/usr/bin/env bash

echo #############
echo # Hardening #
echo #############
echo
./hardening-check /opt/microsoft/ropen/3.5.1/lib64/R/bin/exec/R

echo ####################
echo # R-benchmark-25.R #
echo ####################
echo
Rscript --vanilla R-benchmark-25.R

echo #############
echo # MASS-ex.R #
echo #############
echo
time -p R --vanilla CMD BATCH MASS-ex.R /dev/null
