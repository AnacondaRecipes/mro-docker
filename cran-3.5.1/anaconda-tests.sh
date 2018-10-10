#!/usr/bin/env bash

[[ -d /opt/conda ]] && . /opt/conda/bin/activate
[[ -f /opt/conda/lib/R/bin/exec/R ]] && REXE=/opt/conda/lib/R/bin/exec/R
[[ -f /opt/microsoft/ropen/3.5.1/lib64/R/bin/exec/R ]] && REXE=/opt/microsoft/ropen/3.5.1/lib64/R/bin/exec/R
[[ -f /usr/lib/R/bin/exec/R ]] && REXE=/usr/lib/R/bin/exec/R

echo "#############"
echo "# Hardening #"
echo "#############"
echo ""
./hardening-check ${REXE}

echo ""
echo "####################"
echo "# R-benchmark-25.R #"
echo "####################"
echo ""
Rscript --vanilla R-benchmark-25.R

echo "#############"
echo "# MASS-ex.R #"
echo "#############"
echo ""
time -p R --vanilla CMD BATCH MASS-ex.R /dev/null
