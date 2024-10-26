SWEP.Base = "medkit"

SWEP.PrintName = "Poisonious Powder"
SWEP.Author = "Homigrad"
SWEP.Instructions = "Sprinkle over a ragdolled player to poison them."

SWEP.Spawnable = true
SWEP.Category = "Traitor Tools"

SWEP.Slot = 3
SWEP.SlotPos = 0

SWEP.ViewModel = "models/props_lab/jar01b.mdl"
SWEP.WorldModel = "models/props_lab/jar01b.mdl"
SWEP.HoldType = "normal"

SWEP.dwsPos = Vector(35,35,15)
SWEP.dwsItemPos = Vector(2,0,2)

SWEP.dwmModeScale = 0.4
SWEP.dwmForward = 4
SWEP.dwmRight = 2
SWEP.dwmUp = 0.5

SWEP.dwmAUp = 0
SWEP.dwmARight = 180
SWEP.dwmAForward = 0

local function eyeTrace(ply)
    local att1 = ply:LookupAttachment("eyes")

    if not att1 then return end

    local att = ply:GetAttachment(att1)

    if not att then return end

    local tr = {}
    tr.start = att.Pos
    tr.endpos = tr.start + ply:EyeAngles():Forward() * 50
    tr.filter = ply

    return util.TraceLine(tr)
end

function SWEP:Initialize()
	self:SetHoldType("normal")
end

function SWEP:PrimaryAttack()
    if CLIENT then return end

    local ent = eyeTrace(self:GetOwner()).Entity

    if not IsValid(ent) or ent:IsWorld() or ent:IsPlayer() then return end

    self:Poison(ent)
end

function SWEP:SecondaryAttack() end

if SERVER then

    function SWEP:Poison(ent)
        ent.poisoned = true
        ent.poisonbro = self:GetOwner()
        self:GetOwner():EmitSound("snd_jack_hmcd_needleprick.wav",30)
        self:Remove()
        self:GetOwner():SelectWeapon("weapon_hands")
        
        return false
    end

    hook.Add("PlayerUse","poisoneditem",function(ply,ent)
        if not ent.poisoned then return end -- TODO: Add a check to see if player is ragdolled.

        ent.poisoned2 = true
        timer.Create("Cyanid"..ent:EntIndex().."12", 30, 1, function()
            if ent:Alive() and ent.poisoned2 then
                ent:EmitSound("vo/npc/male01/moan0"..math.random(1,5)..".wav",60)
            end

            timer.Create( "Cyanid"..ent:EntIndex().."22", 10, 1, function()
                if ent:Alive() and ent.poisoned2 then
                    ent:EmitSound("vo/npc/male01/moan0"..math.random(1,5)..".wav",60)
                end
            end)

            timer.Create( "Cyanid"..ent:EntIndex().."32", 15, 1, function()
                if ent:Alive() and ent.poisoned2 then
                    ent.KillReason = "poison"
                    --ent:Kill()
                    ply.nohook = true
                    ply:TakeDamage(10000,ent.poisonbro)
                    ply.nohook = nil
                end
            end)
        end)

        ent.poisoned = false
    end)

    function SWEP:Think()
        
    end

else

    function SWEP:DrawHUD()
        local owner = self:GetOwner()
        local traceResult = eyeTrace(owner)
        local ent = traceResult.Entity

        if not traceResult.Hit or not IsValid(ent) or ent:IsWorld() or ent:IsPlayer() then return end
        
        local frac = traceResult.Fraction

        surface.SetDrawColor(Color(255, 255, 255, 255))
        draw.NoTexture()
        Circle(traceResult.HitPos:ToScreen().x, traceResult.HitPos:ToScreen().y, 5 / frac, 32)
        draw.DrawText("Sprinkle onto ","TargetID",traceResult.HitPos:ToScreen().x,traceResult.HitPos:ToScreen().y - 40,color_white,TEXT_ALIGN_CENTER)
    end
end