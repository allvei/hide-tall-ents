local tint = settings.startup["custom-tall-entities-tint"].value
if tint then
  -- Color values may be returned as {r,g,b,a} or as {1,2,3,4}.
  local function get_channel(key, index, fallback)
    local value = tint[key]
    if value == nil then
      value = tint[index]
    end
    if value == nil then
      value = fallback
    end
    return value
  end

  local color = {
    r = get_channel("r", 1, 20/255),
    g = get_channel("g", 2, 20/255),
    b = get_channel("b", 3, 20/255),
    a = get_channel("a", 4, 20/255)
  }

  for _, uc in pairs(data.raw["utility-constants"] or {}) do
    uc.tall_entity_tint = color
    uc.tall_entity_smoke_tint = color
  end
end

-- Base hides the toggle unless elevated-rails is installed, which also locks
-- it behind the elevated-rail technology. Always reveal it instead.
local shortcut = data.raw.shortcut["toggle-tall-entity-visibility"]
if shortcut then
  shortcut.hidden = nil
  shortcut.technology_to_unlock = nil
end

-- Comma-separated entity names mark them as tall; a "!" prefix removes tall.
local function set_tall(name, tall)
  local found = false
  for entity_type in pairs(defines.prototypes.entity) do
    local prototype = data.raw[entity_type] and data.raw[entity_type][name]
    if prototype then
      prototype.tall = tall
      found = true
    end
  end
  if not found then
    error("custom-tall-entities-overrides: no entity prototype named '" .. name .. "'")
  end
end

local overrides = settings.startup["custom-tall-entities-overrides"].value
for entry in string.gmatch(overrides, "[^,]+") do
  local tall = true
  local name = entry:match("^%s*(.-)%s*$")
  if name:sub(1, 1) == "!" then
    tall = false
    name = name:sub(2):match("^%s*(.-)%s*$")
  end
  if name ~= "" then
    set_tall(name, tall)
  end
end
