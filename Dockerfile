FROM oogasawa/singularity-in-docker:latest
MAINTAINER Osamu Ogasawara <oogasawa@nig.ac.jp>

USER user01

ENV LD_LIBRARY_PATH=$HOME/local/lib/R/lib:$LD_LIBRARY_PATH
RUN  mkdir -p $HOME/local/src
COPY setup_all.sh $HOME/local/src/
COPY init_env.sh $HOME/local/src/
RUN cd $HOME/local/src && bash setup_all.sh


