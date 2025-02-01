#include <drogon/HttpController.h>

using namespace drogon;

namespace api::controllers {
    class ProductsController : public drogon::HttpController<ProductsController>  {
    private:
        /* data */
    public:
        // products_controller(/* args */);
        // ~products_controller();

        // METHOD_LIST_BEGIN and METHOD_LIST_END macros are used to define the routes
        METHOD_LIST_BEGIN
        // Add the route to the method get_products, in the url /producst, of HTTP method GET.
        METHOD_ADD(ProductsController::get_products, "/products", Get);
        METHOD_LIST_END

        // Declare the method that will actually answers the the route declare in the METHOD_LIST_BEGIN and METHOD_LIST_END macros.

        // Handler for the GET /products endpoint
        // - req: The HTTP request object (unused in this example)
        // - callback: A callback function to send the HTTP response back to the client
        void get_products(const HttpRequestPtr& request, std::function<void (const HttpResponsePtr &)> &&callback);
    };

    // products_controller::products_controller(/* args */)
    // {
    // }

    // products_controller::~products_controller()
    // {
    // }
}
