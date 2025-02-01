#include <drogon/drogon.h>
#include "../include/api/controllers/products_controller.h"

int main() {
  drogon::app().loadConfigFile("/app/config.json");
  LOG_INFO << "Running....";
  drogon::app().run();

  return 0;
}
