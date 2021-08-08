FROM oogasawa/singularity_in_docker:latest
MAINTAINER Osamu Ogasawara <oogasawa@nig.ac.jp>

USER user01

ENV LD_LIBRARY_PATH=$HOME/local/lib/R/lib:$LD_LIBRARY_PATH
RUN  mkdir -p $HOME/local/src
COPY setup*.sh $HOME/local/src/
COPY init_env.sh $HOME
WORKDIR $HOME/local/src
RUN bash setup_all.sh


