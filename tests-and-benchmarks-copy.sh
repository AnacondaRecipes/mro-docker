#!/usr/bin/env bash

RS="mro-3.5.1 r-3.5.1 cran-3.5.1"
# RS="cran-3.5.1"
# RS="mro-3.5.1"

[[ -d tests-and-benchmarks ]] || exit 1

# NOCACHE="--no-cache"

for R in ${RS}; do
  cp -Rf tests-and-benchmarks/* ${R}
  git add ${R}
  pushd ${R}
    docker build ${NOCACHE} -f ./Dockerfile -t ${R} .
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
  docker run ${R} 2>&1 | tee tests-and-benchmarks/${R}.benchmark
done
