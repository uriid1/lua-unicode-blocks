local unicode = require('unicode')

-- Print Cyrillic
-- print(unicode.getChars(unicode.blocks['Cyrillic']))

-- 10 random
local i = 1
for blockName, property in pairs(unicode.blocks) do
  i = i + 1
  print(blockName..':')
  print(unicode.getChars(property) .. '\n')

  if i == 10 then
    break
  end
end
