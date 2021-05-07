FROM oogasawa/singularity-in-docker:latest
MAINTAINER Osamu Ogasawara <oogasawa@nig.ac.jp>

USER user01

COPY setup01.sh $HOME
RUN bash setup01.sh


