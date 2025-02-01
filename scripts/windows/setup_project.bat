cd $WORK_PATH;
git clone https://github.com/drogonframework/drogon;
cd drogon;
git submodule update --init;

mkdir build;
cd build;
conan profile detect --force;
conan install .. -s compiler="msvc" -s compiler.version=193  -s compiler.cppstd=17 -s build_type=Debug  --output-folder . --build=missing;
