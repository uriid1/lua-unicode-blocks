local PATH = 'unidata'
local BLOCKS_PATH = PATH..'/Blocks.txt'
local TABLE_PATH = PATH..'/uniTable.lua'

--
-- Generate unicode table
-- Blocks.txt = https://www.unicode.org/Public/UNIDATA/Blocks.txt
--
local unicodeBlocks = 'return {\n'

for line in io.lines(BLOCKS_PATH, "*l") do
  local firstChar = line:sub(1, 1)
  if firstChar == '#' or firstChar == '' then
    goto continue
  end

  -- Capture
  local startCode, endCode, name = line:match('([A-Z0-9]+)%.%.([A-Z0-9]+); (.+)')
  if not (startCode and endCode and name) then
    goto continue
  end

  name = name:gsub(' ', '-')

  -- Add
  unicodeBlocks = unicodeBlocks
    .. '\t["'..name..'"] = ' .. ('"0x%s-0x%s"'):format(startCode, endCode)
    .. ',\n'

  ::continue::
end

unicodeBlocks = unicodeBlocks .. '}'

--
-- Save table
--
local fd = io.open(TABLE_PATH, 'w+')
if fd == nil then
  print('Erorr: '..TABLE_PATH)
  os.exit(1)
end

fd:write(unicodeBlocks)
fd:close()

print('Successfully created: ' .. TABLE_PATH)
