#include <drogon/drogon.h>

int main() {
  drogon::app().loadConfigFile("/app/config.json");
  LOG_INFO << "Running....";
  drogon::app().run();

  return 0;
}
