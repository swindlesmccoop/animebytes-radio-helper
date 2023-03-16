local utils = require "mp.utils"

function notify_current_media(key)
    local value = mp.get_property_native(key)
    return mp.command_native({"run", "notify-send", value})
end

mp.observe_property("metadata/by-key/icy-title", string, notify_current_media)
