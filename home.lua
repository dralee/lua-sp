-- home信息
-- 2025.4.2 by dralee
local home = os.getenv("HOME")

local mpv_config = string.format("%s/.config/mpv", home)
print("mpv:", mpv_config)
