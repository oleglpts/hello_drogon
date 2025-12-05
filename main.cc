#include <drogon/drogon.h>
#include <trantor/utils/Logger.h>
#include <nlohmann/json.hpp>

using namespace std;
using namespace drogon;

int main() {
    app().registerHandler(
            "/",
            [](const HttpRequestPtr &request,
               std::function<void(const HttpResponsePtr &)> &&callback) {
                json m;
                m["text"] = "connected: " + string(request->connected() ? "true" : "false");
                JLOG_INFO(m);
                auto resp = HttpResponse::newHttpResponse();
                resp->setBody("Hello, World!");
                callback(resp);
            },
            {Get});
    app().addListener("0.0.0.0", 5555).run();
    return 0;
}
