#include "../include/api/controllers/products_controller.h"
#include <drogon/HttpResponse.h>

namespace api::controllers {
    // Implementation of the get_products method
    void ProductsController::get_products(const drogon::HttpRequestPtr& request, std::function<void(const drogon::HttpResponsePtr&)>&& callback) {
        // Create a new HTTP response object
        auto response = drogon::HttpResponse::newHttpResponse();
        
        // Set the HTTP status code to 200 (OK)
        response->setStatusCode(drogon::k200OK);
        
        // Set the content type of the response to plain text
        response->setContentTypeCode(drogon::CT_TEXT_PLAIN);

        // Set the response body to the desired string
        response->setBody("This is a list of products");

        // Pass the response to the callback function
        // This sends the response back to the client
        callback(response);
    }
}
