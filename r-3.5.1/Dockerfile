FROM continuumio/miniconda3:latest

## (Based on https://github.com/rocker-org/rocker/blob/master/r-base/Dockerfile)
## Set a default user. Available via runtime flag `--user docker`
## Add user to 'staff' group, granting them write privileges to /usr/local/lib/R/site.library
## User should also have & own a home directory (e.g. for linked volumes to work properly).
RUN apt-get update && apt-get install -y binutils
RUN . /opt/conda/bin/activate
RUN conda update -y --all
RUN conda install -y -c r -c https://repo.anaconda.com/pkgs/main r=3.5.1 r-suppdists || true

# Add demo script
COPY demo.R demo.R

# Add hardening-check script
COPY hardening-check hardening-check

# Add benchmarking script from http://r.research.att.com/benchmarks/R-benchmark-25.R
COPY R-benchmark-25.R R-benchmark-25.R

# And another one
COPY MASS-ex.R MASS-ex.R

COPY anaconda-tests.sh anaconda-tests.sh

# Add image metadata
LABEL org.label-schema.license="https://mran.microsoft.com/faq/#licensing" \
    org.label-schema.vendor="Microsoft Corporation, Dockerfile provided by Daniel Nüst" \
	org.label-schema.name="Microsoft R Open" \
	org.label-schema.description="Docker images of Microsoft R Open (MRO) with the Intel® Math Kernel Libraries (MKL)." \ 
	org.label-schema.vcs-url=$VCS_URL \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.schema-version="rc1" \
	maintainer="Daniel Nüst <daniel.nuest@uni-muenster.de>"

CMD ["/bin/bash", "./anaconda-tests.sh"]
