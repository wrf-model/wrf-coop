#
FROM kkeene44/wrf-coop:version16
MAINTAINER Kelly Werner <kkeene@ucar.edu>

RUN git clone --recurse-submodule _FORK_/_REPO_.git WRF \
  && cd WRF \
  && git checkout _BRANCH_ \
  && cd ..

RUN git clone https://github.com/wrf-model/SCRIPTS.git SCRIPTS \
  && cp SCRIPTS/rd_l2_norm.py . && chmod 755 rd_l2_norm.py \
  && cp SCRIPTS/script.csh .    && chmod 755 script.csh    \
  && ln -sf SCRIPTS/Namelists . 

RUN git clone https://github.com/wrf-model/wrf_feature_testing.git wrf_feature_testing \
  && cd wrf_feature_testing && mv * .. && cd ..

VOLUME /wrf
CMD ["/bin/tcsh"]
