FROM biscarch/ghc-7.8.3
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install zlib1g-dev libssl-dev -y
RUN apt-get install git -y
RUN apt-get install libpq-dev postgresql-client -y
RUN apt-get install socat -y
ENV LANG en_US.utf8
