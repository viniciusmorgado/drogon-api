#include "../include/api/controllers/products_controller.h"
#include <drogon/HttpResponse.h>
#include <json/json.h>

using Callback = std::function<void (const HttpResponsePtr &)>;

namespace api::controllers {
    void ProductsController::get_products(const HttpRequestPtr& request, std::function<void (const HttpResponsePtr &)> &&callback) {
        Json::Value jsonObject;
        jsonObject["message"] = "This is a list of products";
        jsonObject["status"] = "success";

        auto response = HttpResponse::newHttpJsonResponse(jsonObject);

        callback(response);
    }
}
