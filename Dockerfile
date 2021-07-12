FROM postgis/postgis:13-master

RUN apt-get update && apt-get install -y git wget
RUN git clone https://github.com/ldocao/nyc-taxi-data.git
RUN chmod +x nyc-taxi-data/*.sh