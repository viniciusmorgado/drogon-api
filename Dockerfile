FROM ubuntu AS build

RUN apt update && apt full-upgrade -y; \
    apt install git clang musl-tools gcc g++ libjsoncpp-dev libjson-c-dev cmake uuid-dev zlib1g-dev openssl libssl-dev -y;

RUN git clone https://github.com/drogonframework/drogon; \
    cd drogon; \
    git submodule update --init; \
    mkdir build; \
    cd build; \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=musl-gcc -DCMAKE_CXX_COMPILER=clang++ ..; \
    make && make install;

COPY . .

RUN cd build; \
    cmake .. -DCMAKE_ENABLE_EXPORTS=on; \
    make;

ENTRYPOINT ["tail", "-f", "/dev/null"]
