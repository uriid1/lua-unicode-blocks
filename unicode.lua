--
-- Format table:
-- unicode.blocks = {
--  ['Domino-Tiles'] = "\u{1F030}-\u{1F09F}",
--  ['Supplemental-Arrows-C'] = "\u{1F800}-\\u{1F8FF}",
-- ...
-- }
--
local unicodeBlocks = require('unidata.uniTable')

local function getChars(property)
  local start, finish = property:match('^(.+)%-(.+)$')
  start = tonumber(start)
  finish = tonumber(finish)

  local result = ''
  for codepoint = start, finish do
    result = result .. utf8.char(codepoint)
  end
  return result
end

return {
  blocks = unicodeBlocks,
  getChars = getChars,
}
