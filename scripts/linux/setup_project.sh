sudo apt update && sudo apt full-upgrade -y;
sudo apt install git clang clang-format postgresql-all libhiredis-dev musl-tools gcc g++ cmake libjsoncpp-dev uuid-dev zlib1g-dev openssl libssl-dev -y;
git clone https://github.com/drogonframework/drogon;
cd drogon;
git submodule update --init;
mkdir build;
cd build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=musl-gcc -DCMAKE_CXX_COMPILER=clang++;
make && make install;