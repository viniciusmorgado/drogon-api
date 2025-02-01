#include <drogon/HttpController.h>

using namespace drogon;

namespace api::controllers {
    class ProductsController : public drogon::ControllerBase<ProductsController>  {
    private:
        /* data */
    public:
        // static constexpr const char* pathPrefix() { return "/api"; }

        // METHOD_LIST_BEGIN
        // METHOD_ADD(ProductsController::get_products, "/products", Get);
        // METHOD_LIST_END

        void get_products(const HttpRequestPtr& request, std::function<void (const HttpResponsePtr &)> &&callback);
      
    };
}
