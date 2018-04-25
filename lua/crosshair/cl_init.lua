local crosshairGapConVar = CreateClientConVar("crosshair_gap", "4")
local crosshairLengthConVar = CreateClientConVar("crosshair_length", "8")
local crosshairThicknessConVar = CreateClientConVar("crosshair_thickness", "3")
local crosshairRedConVar = CreateClientConVar("crosshair_red", "255")
local crosshairGreenConVar = CreateClientConVar("crosshair_green", "255")
local crosshairBlueConVar = CreateClientConVar("crosshair_blue", "0")
local crosshairAlphaConVar = CreateClientConVar("crosshair_alpha", "200")

hook.Add("HUDPaint", "crosshair", function()
	local crosshairGap = math.max(crosshairGapConVar:GetFloat(), 0)
	local crosshairLength = math.max(crosshairLengthConVar:GetFloat(), 0)
	local crosshairThickness = math.max(crosshairThicknessConVar:GetFloat(), 0)
	local crosshairRed = math.Clamp(crosshairRedConVar:GetInt(), 0, 255)
	local crosshairGreen = math.Clamp(crosshairGreenConVar:GetInt(), 0, 255)
	local crosshairBlue = math.Clamp(crosshairBlueConVar:GetInt(), 0, 255)
	local crosshairAlpha = math.Clamp(crosshairAlphaConVar:GetInt(), 0, 255)
	
	local xCenter = ScrW() / 2
	local yCenter = ScrH() / 2
	
	local crosshairThicknessHalf = crosshairThickness / 2
	 
	surface.SetDrawColor(crosshairRed, crosshairGreen, crosshairBlue, crosshairAlpha)
	surface.DrawRect(xCenter - crosshairGap - crosshairLength, yCenter - crosshairThicknessHalf, crosshairLength, crosshairThickness)
	surface.DrawRect(xCenter + crosshairGap, yCenter - crosshairThicknessHalf, crosshairLength, crosshairThickness)
	surface.DrawRect(xCenter - crosshairThicknessHalf, yCenter - crosshairGap - crosshairLength, crosshairThickness, crosshairLength)
	surface.DrawRect(xCenter - crosshairThicknessHalf, yCenter + crosshairGap, crosshairThickness, crosshairLength)
	surface.SetDrawColor(255, 255, 255, 255)
end)