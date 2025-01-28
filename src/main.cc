#include <drogon/drogon.h>

int main() {
    drogon::app().loadConfigFile("/app/config.yaml");
    LOG_INFO << "Running....";
    drogon::app().run();
    
    return 0;
}
