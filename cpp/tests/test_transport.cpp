#include "test_common.h"
#include "../src/transport.h"
#include "../src/discovery.h"
#include <stdexcept>

using namespace bmap;

#ifdef __APPLE__
TEST(macos_transport_throws) {
    bool threw = false;
    try {
        RfcommTransport transport("00:11:22:33:44:55", 2);
    } catch (const std::runtime_error& e) {
        threw = true;
        ASSERT_TRUE(std::string(e.what()).find("not supported on macOS") != std::string::npos);
    }
    ASSERT_TRUE(threw);
}

TEST(macos_discovery_returns_nullopt) {
    auto dev = find_bmap_device();
    ASSERT_FALSE(dev.has_value());
}
#endif
