#!/usr/bin/env bash

[[ -d tests-and-benchmarks ]] || exit 1

for R in 3.2.5 3.4.4 3.5.1; do
  cp -Rf tests-and-benchmarks/* mro-${R}
  git add mro-${R}
done
