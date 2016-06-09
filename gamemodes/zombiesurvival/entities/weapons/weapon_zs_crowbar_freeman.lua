AddCSLuaFile()

if CLIENT then
	SWEP.Author = "Duby"
	SWEP.PrintName = "Freeman's Crowbar"
	SWEP.Description = "Instantly kills headcrabs."
	SWEP.ViewModelFOV = 60
	SWEP.FlipYaw = false
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.HoldType = "melee"

SWEP.MeleeDamage = 55
SWEP.MeleeRange = 55
SWEP.MeleeSize = 1.5
SWEP.MeleeKnockBack = SWEP.MeleeDamage

SWEP.Primary.Delay = 0.95

SWEP.SwingTime = 0.4
SWEP.SwingRotation = Angle(30, -30, -30)
SWEP.SwingHoldType = "grenade"

function SWEP:PlaySwingSound()
	self:EmitSound("Weapon_Crowbar.Single")
end

function SWEP:PlayHitSound()
	self:EmitSound("Weapon_Crowbar.Melee_HitWorld")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("Weapon_Crowbar.Melee_Hit")
end

function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and hitent:Team() == TEAM_UNDEAD and hitent:IsHeadcrab() and gamemode.Call("PlayerShouldTakeDamage", hitent, self.Owner) then
		hitent:SetHealth(1)
	end
end
