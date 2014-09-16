FROM biscarch/ghc-7.8.3
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install zlib1g-dev libssl-dev -y
RUN apt-get install git -y
RUN apt-get install libpq-dev postgresql-client -y
RUN apt-get install socat -y
RUN apt-get install syslinux -y
RUN cabal update
ENV LANG en_US.utf8
RUN git clone https://github.com/dbp/migrate /dep/migrate
RUN cd /dep/migrate && cabal sandbox init && cabal install
RUN cp /dep/migrate/.cabal-sandbox/bin/migrate /usr/bin/migrate
RUN rm -rf /dep/migrate
RUN git clone https://github.com/dbp/rivet /dep/rivet
RUN cd /dep/rivet && cabal sandbox init && cabal install --force-reinstalls
RUN cp /dep/rivet/.cabal-sandbox/bin/rivet /usr/bin/rivet
RUN rm -rf /dep/rivet
