local CharacterSheet = {}

function CharacterSheet.init(data)
    local saveData = JSON.decode(data.save_state)
    print(data.guid)
    addCheckboxes(data.guid, saveData.checkboxes, {})
end

function shallowCopy(t)
  local t2 = {}
  for k,v in ipairs(t) do
    t2[k] = v
  end
  return t2
end

function addCheckboxes(guid, data, path)
    local obj = getObjectFromGUID(guid)
    for i, v in pairs(data) do
        local newPath = shallowCopy(path)
        newPath[#newPath + 1] = i
        if(v.x == nil) then
            addCheckboxes(guid, v, newPath)
        else
            obj.createButton({
                click_function = "noop",
                position = {
                    x = ((v.x / 1280) * 2) - 1,
                    z = ((v.y / 1280) * 2) - 1,
                    y = 0.1
                },
                scale = {
                    x = 0.2,
                    y = 0.2,
                    z = 0.2,
                }
            })
        end
    end
end

return CharacterSheet