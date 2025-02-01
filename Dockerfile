FROM ubuntu AS build

RUN apt update && apt full-upgrade -y; \
    apt install git clang clang-format postgresql-all libhiredis-dev musl-tools gcc g++ cmake libjsoncpp-dev uuid-dev zlib1g-dev openssl libssl-dev -y;

RUN git clone https://github.com/drogonframework/drogon; \
    cd drogon; \
    git submodule update --init; \
    mkdir build; \
    cd build; \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=musl-gcc -DCMAKE_CXX_COMPILER=clang++; \
    make && make install;

COPY . . 

RUN ./scripts/linux/formatter.sh; \
    mkdir -p build && \
    cd build && \
    cmake .. -DCMAKE_ENABLE_EXPORTS=on -DCMAKE_C_COMPILER=musl-gcc -DCMAKE_CXX_COMPILER=clang++ && \
    make;

FROM ubuntu

RUN apt update && apt full-upgrade -y; \
    apt install libjsoncpp-dev -y;

COPY --from=build  /config.json /app/config.json
COPY --from=build /build/drogon_api /app/drogon_api

EXPOSE 5555
CMD ["./app/drogon_api"]

# ENTRYPOINT ["tail", "-f", "/dev/null"]