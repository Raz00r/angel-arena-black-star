modifier_destroyer_frenzy = class({})

function modifier_destroyer_frenzy:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_MAX,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
end

function modifier_destroyer_frenzy:GetModifierMoveSpeed_Max()
	local ability = self:GetAbility()
	local level
	local healht_pct = self:GetParent():GetHealthPercent()
	if healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl3") then
		level = 3
	elseif	healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl2") then
		level = 2
	elseif	healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl1") then
		level = 1
	end
	if level then
		return ability:GetSpecialValueFor("max_speed_lvl" .. level)
	end
end
function modifier_destroyer_frenzy:GetModifierMoveSpeed_Limit()
	local ability = self:GetAbility()
	local level
	local healht_pct = self:GetParent():GetHealthPercent()
	if healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl3") then
		level = 3
	elseif	healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl2") then
		level = 2
	elseif	healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl1") then
		level = 1
	end
	if level then
		return ability:GetSpecialValueFor("max_speed_lvl" .. level)
	end
end
function modifier_destroyer_frenzy:GetModifierPhysicalArmorBonus()
	return self.ReducedArmor or 0
end
function modifier_destroyer_frenzy:GetModifierBaseDamageOutgoing_Percentage()
	local ability = self:GetAbility()
	local level
	local healht_pct = self:GetParent():GetHealthPercent()
	if healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl3") then
		level = 3
	elseif	healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl2") then
		level = 2
	elseif	healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl1") then
		level = 1
	end
	if level then
		return ability:GetSpecialValueFor("bonus_damage_pct_lvl" .. level)
	end
end
function modifier_destroyer_frenzy:OnCreated()
	if IsServer() then
		self.pfx = ParticleManager:CreateParticle("particles/arena/units/heroes/hero_destroyer/destroyer_frenzy.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
	end
	self:StartIntervalThink(0.1)
	self:OnIntervalThink()
end
if IsServer() then
	function modifier_destroyer_frenzy:OnDestroy()
		ParticleManager:DestroyParticle(self.pfx, false)
	end
end
function modifier_destroyer_frenzy:OnIntervalThink()
	local ability = self:GetAbility()
	local parent = self:GetParent()
	local level
	local healht_pct = parent:GetHealthPercent()
	if healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl3") then
		level = 3
	elseif	healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl2") then
		level = 2
	elseif	healht_pct < ability:GetSpecialValueFor("hp_mark_pct_lvl1") then
		level = 1
	end
	self.ReducedArmor = level == nil and 0 or (parent:GetPhysicalArmorValue() - (self.ReducedArmor or 0)) * ability:GetSpecialValueFor("bonus_armor_pct_lvl" .. level) * 0.01
	if IsServer() then
		ParticleManager:SetParticleControl(self.pfx, 15, Vector(level == 3 and 255 or 0, level == 2 and 255 or 0, level == 1 and 255 or 0))
	end
end