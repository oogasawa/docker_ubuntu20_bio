FROM oogasawa/singularity-in-docker:latest
MAINTAINER Osamu Ogasawara <oogasawa@nig.ac.jp>

USER user01

ENV LD_LIBRARY_PATH=$HOME/local/lib/R/lib:$LD_LIBRARY_PATH
COPY setup*.sh $HOME
COPY init_env.sh $HOME
RUN bash setup_all.sh


