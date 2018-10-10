#!/usr/bin/env bash

[[ -d tests-and-benchmarks ]] || exit 1

RS="mro-3.5.1 r-3.5.1 cran-3.5.1"
# for R in mro-3.2.5 mro-3.4.4 mro-3.5.1 r-3.5.1 cran-3.5.1; do
for R in ${RS}; do
  cp -Rf tests-and-benchmarks/* ${R}
  git add ${R}
  pushd ${R}
    docker build -f ./Dockerfile -t ${R} .
  popd
done

for R in ${RS}; do
  echo "*********************************"
  echo "*********************************"
  echo "** Running benchmarks for ${R} **"
  echo "*********************************"
  echo "*********************************"
  echo ""
  echo ""
  docker run ${R} 2>&1 | tee ~/gd.cio/r-language/${R}.benchmark
done
