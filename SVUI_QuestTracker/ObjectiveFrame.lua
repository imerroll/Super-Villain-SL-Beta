--[[
###############################################################################################
#S U P E R - V I L L A I N - ORIGINALLY  By: Failcoder | SVUI (SUPER VILLAIN)  By: keivamp #
###############################################################################################
keivamp's quest tracker
]]--
local _G = _G;
local pairs     = _G.pairs;
--BLIZZARD API
local CreateFrame           = _G.CreateFrame;
local GetTime               = _G.GetTime;
local PERCENTAGE_STRING     = _G.PERCENTAGE_STRING;
local GetTimeStringFromSeconds = _G.GetTimeStringFromSeconds;
local GetQuestProgressBarPercent = _G.GetQuestProgressBarPercent;
--[[
##########################################################
GET ADDON DATA
##########################################################
]]--
local SV = _G['SVUI']
local MOD = SV.QuestTracker;
local LSM = _G.LibStub("LibSharedMedia-3.0")

	local function CreateBackdrop(frame)
		frame:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8",
		insets = {top = 0, left = 0, bottom = 0, right = 0}})
		frame:SetBackdropColor(0,0,0,0.5)
		frame:SetBackdropBorderColor(0,0,0,1)
	end
	local function CreateBackdrop2(frame)
		frame:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8",
		insets = {top = -2, left = -2, bottom = -2, right = -2}})
		frame:SetBackdropColor(1,1,1,0)
		frame:SetBackdropBorderColor(0,0,1,0)
	end
	local function CreateBackdrop3(frame)
		frame:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8",
		insets = {top = 2, left = 2, bottom = 2, right = 2}})
		frame:SetBackdropColor(0,0.35,1,0)
		frame:SetBackdropBorderColor(0,0,1,0)
	end

	local scrollFrame = CreateFrame("ScrollFrame", "SVUI_QuestTrackerScrollFrame",Minimap, BackdropTemplateMixin and "BackdropTemplate")
	scrollFrame:SetWidth(295)
	scrollFrame:SetHeight(400)
	scrollFrame:SetPoint("BOTTOMLEFT",-250,-525)
	scrollFrame:EnableMouseWheel(true);
	scrollFrame.MaxVal = 0;

		scrollFrame:SetMovable(true)
		scrollFrame:EnableMouse(true)
		scrollFrame:RegisterForDrag("LeftButton")
		scrollFrame:SetScript("OnDragStart", scrollFrame.StartMoving)
		scrollFrame:SetScript("OnDragStop", scrollFrame.StopMovingOrSizing)
		scrollFrame:SetClampedToScreen(true)
		scrollFrame:SetClampRectInsets(0, 0, 0,0)

		scrollFrame:SetUserPlaced(true)
		
		CreateBackdrop(scrollFrame)
		
	
	
	local scrollChild = CreateFrame("Frame", "SVUI_QuestTrackerScrollFrameScrollChild", scrollFrame, BackdropTemplateMixin and "BackdropTemplate");
	scrollChild:SetWidth(265);
	scrollChild:SetScale(1);
	scrollChild:ClearAllPoints()

	scrollChild:SetHeight(800)

		
		CreateBackdrop2(scrollChild)
		
		local scrollFrame2 = CreateFrame("ScrollFrame", "SVUI_QuestTrackerScrollFrame2",scrollChild, BackdropTemplateMixin and "BackdropTemplate")
	scrollFrame2:SetWidth(265)
	scrollFrame2:SetHeight(800)
	scrollFrame2:SetPoint("TOP",scrollChild,"TOP",30,0)
	CreateBackdrop3(scrollFrame2)
	
	


	scrollFrame:SetScrollChild(scrollChild);

	scrollFrame.ScrollBar = scrollBar;
	scrollFrame.ScrollChild = scrollChild;
	
	ObjectiveTrackerBlocksFrame:SetParent(scrollFrame2)
	ObjectiveTrackerBlocksFrame:ClearAllPoints()
	ObjectiveTrackerBlocksFrame:SetAllPoints(scrollFrame2)
	ObjectiveTrackerBlocksFrame:SetScale(1.1)


local scrollBar = CreateFrame("Slider", "SVUI_QuestTrackerScrollFrameScrollBar", scrollFrame, "OptionsSliderTemplate");
	scrollBar:SetHeight(scrollFrame:GetHeight());
	scrollBar:SetWidth(18);
	scrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", 20, 2);
	scrollBar:SetFrameLevel(6)
	scrollBar:SetOrientation("VERTICAL");
	scrollBar:SetValueStep(5);
	scrollBar:SetMinMaxValues(1, 420);
	
	scrollBar:SetValue(1);
	scrollBar:SetScript("OnValueChanged", function(self, argValue)
		_G.SVUI_QuestTrackerScrollFrame:SetVerticalScroll(argValue)
	end)
	_G.SVUI_QuestTrackerScrollFrameScrollBarLow:Hide()
	_G.SVUI_QuestTrackerScrollFrameScrollBarHigh:Hide()
	
	scrollFrame:SetScript("OnMouseWheel", function(self, argValue)
		_G.SVUI_QuestTrackerScrollFrame:SetVerticalScroll(argValue)

	end)

	SV.API:Set("ScrollBar", scrollBar)

local quests = CreateFrame("Frame", nil, scrollFrame, BackdropTemplateMixin and "BackdropTemplate")
	quests:SetWidth(50);
	quests:SetHeight(20);
	quests:SetPoint("TOP",0,25)

	quests.Header = CreateFrame("Frame", nil, quests)
	quests.Header:SetPoint("TOPLEFT", quests, "TOPLEFT", 2, -2);
	quests.Header:SetPoint("TOPRIGHT", quests, "TOPRIGHT", -2, -2);
	quests.Header:SetHeight(25);

	quests.Header.Text = quests.Header:CreateFontString(nil,"OVERLAY")
	quests.Header.Text:SetPoint("TOPLEFT", quests.Header, "TOPLEFT", 2, 0);
	quests.Header.Text:SetPoint("BOTTOMLEFT", quests.Header, "BOTTOMLEFT", 2, 0);
	--quests.Header.Text:SetFontObject(PsychoUI_Font_Quest_Header);
	
	quests.Header.Text:SetJustifyH('LEFT')
	quests.Header.Text:SetTextColor(0.28,0.75,1)
	local function SetQuestFrame()

	
	quests.Header.Text:SetFont("Interface\\AddOns\\SVUI_!Core\\assets\\fonts\\Dialog.ttf", 15, "THINOUTLINE");
	quests.Header.Text:SetText(TRACKER_HEADER_QUESTS)


	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetAlpha(1)
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:ClearAllPoints()
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetPoint("LEFT", quests,"BOTTOMLEFT", -25,5)

ObjectiveTrackerBlocksFrame.QuestHeader.Text:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.Background:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.LineGlow:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.LineSheen:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.SoftGlow:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.StarBurst:Hide()
ObjectiveTrackerBlocksFrame.QuestHeader.MinimizeButton:Hide()
ObjectiveTrackerBlocksFrame:SetFrameLevel(1)


local frame = _G.ObjectiveTrackerFrame.MODULES
	if frame then
		for i = 1, #frame do
			local modules = frame[i]
			if modules then
				modules.Header.Background:SetAtlas(nil)

				 local text = modules.Header.Text
				 text:SetFont("Interface\\AddOns\\SVUI_!Core\\assets\\fonts\\Dialog.ttf", 15, "THINOUTLINE");
				 text:SetTextColor(0.28,0.75,1)
				 text:SetParent(modules.Header)
			end
		end
	end

end

ObjectiveTrackerFrame:HookScript("OnUpdate", SetQuestFrame)