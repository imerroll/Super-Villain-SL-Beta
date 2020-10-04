--[[
###############################################################################################
#S U P E R - V I L L A I N - ORIGINALLY  By: Failcoder | SVUI (SUPER VILLAIN)  By: keivamp #
###############################################################################################
keivamp's quest tracker
]]--
local quests = CreateFrame("Frame", nil, UIParent)
	quests:SetWidth(50);
	quests:SetHeight(20);
	quests:SetPoint("TOPRIGHT",-250,-350)
	
		quests:SetMovable(true)
		quests:EnableMouse(true)
		quests:RegisterForDrag("LeftButton")
		quests:SetScript("OnDragStart", quests.StartMoving)
		quests:SetScript("OnDragStop", quests.StopMovingOrSizing)
		quests:SetClampedToScreen(true)
		quests:SetClampRectInsets(0, 0, 0,0)
		quests:SetUserPlaced(true)

	quests.Header = CreateFrame("Frame", nil, quests)
	quests.Header:SetPoint("TOPLEFT", quests, "TOPLEFT", 2, -2);
	quests.Header:SetPoint("TOPRIGHT", quests, "TOPRIGHT", -2, -2);
	quests.Header:SetHeight(30);

	quests.Header.Text = quests.Header:CreateFontString(nil,"OVERLAY")
	quests.Header.Text:SetPoint("TOPLEFT", quests.Header, "TOPLEFT", 2, 0);
	quests.Header.Text:SetPoint("BOTTOMLEFT", quests.Header, "BOTTOMLEFT", 2, 0);
	--quests.Header.Text:SetFontObject(PsychoUI_Font_Quest_Header);
	
	quests.Header.Text:SetJustifyH('LEFT')
	quests.Header.Text:SetTextColor(0.28,0.75,1)
	local function SetQuestFrame()
	--if PsychoUI.db.char.QuestFrame == false then return end

	--LSM:Fetch("font", PsychoUI.db.char.QuestFontKey)
	
	quests.Header.Text:SetFont("Interface\\AddOns\\SVUI_!Core\\assets\\fonts\\Dialog.ttf", 14, "THINOUTLINE");
	quests.Header.Text:SetText(TRACKER_HEADER_QUESTS)


	quests.Header.Divider = quests.Header:CreateTexture(nil, 'BACKGROUND');
	quests.Header.Divider:SetPoint("TOPLEFT", quests.Header.Text, "TOPRIGHT", -10, 0);
	quests.Header.Divider:SetPoint("BOTTOMRIGHT", quests.Header, "BOTTOMRIGHT", 0, 0);
	--quests.Header.Divider:SetTexture([[Interface\AddOns\PsychoUI\assets\textures\DROPDOWN-DIVIDER]]
	

	
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetAlpha(1)
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:ClearAllPoints()
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetPoint("LEFT", quests,"BOTTOMLEFT", -25,5)

 

	ObjectiveTrackerFrame:ClearAllPoints()
	ObjectiveTrackerFrame:SetPoint("TOP", quests,"BOTTOM", 30,15)
	ObjectiveTrackerFrame:SetScale(1.1)
	ObjectiveTrackerFrame:SetWidth(250) -- Set these to whatever height/width is needed 
	ObjectiveTrackerFrame:SetHeight(500) 


ObjectiveTrackerBlocksFrame.QuestHeader.Text:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.Background:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.LineGlow:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.LineSheen:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.SoftGlow:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.StarBurst:Hide()
--ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:Hide()
ObjectiveTrackerBlocksFrame:SetFrameLevel(15)
-- end
end

ObjectiveTrackerFrame:HookScript("OnUpdate", SetQuestFrame)