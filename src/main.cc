#include <drogon/drogon.h>
#include "../include/api/controllers/products_controller.h"

int main() {
    drogon::app().loadConfigFile("/app/config.json");

    auto controller = std::make_shared<api::controllers::ProductsController>();

    // Manually define the route
    drogon::app().registerHandler("/api/products",
        [controller](const drogon::HttpRequestPtr& req, std::function<void (const drogon::HttpResponsePtr &)> &&callback) {
            controller->get_products(req, std::move(callback));
        },
        {drogon::Get} // This ensures it's a GET route
    );

    LOG_INFO << "Running....";
    drogon::app().run();
    return 0;
}
