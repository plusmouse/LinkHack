local function GenerateTooltip(itemID, keyLevel, itemLevel, upgradeLevel)
  local tooltipData = C_TooltipInfo.GetItemKey(itemID, itemLevel, 0)
  tooltipData.lines[1].leftColor = ITEM_QUALITY_COLORS[Enum.ItemQuality.Epic].color
  table.insert(tooltipData.lines, 2, {
    type = 0,
    leftText = PLAYER_DIFFICULTY_MYTHIC_PLUS .. " " .. keyLevel,
    leftColor = GREEN_FONT_COLOR,
  })
  table.insert(tooltipData.lines, 4, {
    type = 0,
    leftText = ITEM_UPGRADE_TOOLTIP_FORMAT:format(upgradeLevel, 8),
    leftColor = NORMAL_FONT_COLOR,
  })
  for index, line in ipairs(tooltipData.lines) do
    if line.leftText == AUCTION_HOUSE_BUCKET_VARIATION_EQUIPMENT_TOOLTIP then
      table.remove(tooltipData.lines, index)
      table.remove(tooltipData.lines, index - 1)
      break
    end
  end
  local info = {
    tooltipData = tooltipData,
  }
  GameTooltip:ProcessInfo(info)
  GameTooltip:Show()
end

local item = Item:CreateFromItemID(211470)
item:ContinueOnItemLoad(function()
  GameTooltip:SetOwner(UIParent, "ANCHOR_CENTER")
  GenerateTooltip(211470, 13, 460, 3)
end)
