modifier_item_scythe_of_sun = class({})
function modifier_item_scythe_of_sun:IsHidden() return true end
function modifier_item_scythe_of_sun:GetAttributes() return MODIFIER_ATTRIBUTE_MULTIPLE end


function modifier_item_scythe_of_sun:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_PROPERTY_MANA_BONUS,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MANA_REGEN_PERCENTAGE,
		MODIFIER_PROPERTY_EVASION_CONSTANT,
		MODIFIER_PROPERTY_CAST_RANGE_BONUS,
		MODIFIER_PROPERTY_SPELL_AMPLIFY_PERCENTAGE
	}
end

function modifier_item_scythe_of_sun:GetModifierBonusStats_Strength()
	return self:GetAbility():GetSpecialValueFor("bonus_strength")
end

function modifier_item_scythe_of_sun:GetModifierBonusStats_Agility()
	return self:GetAbility():GetSpecialValueFor("bonus_agility")
end

function modifier_item_scythe_of_sun:GetModifierBonusStats_Intellect()
	return self:GetAbility():GetSpecialValueFor("bonus_intellect")
end

function modifier_item_scythe_of_sun:GetModifierManaBonus()
	return self:GetAbility():GetSpecialValueFor("bonus_mana")
end

function modifier_item_scythe_of_sun:GetModifierPhysicalArmorBonus()
	return self:GetAbility():GetSpecialValueFor("bonus_armor")
end

function modifier_item_scythe_of_sun:GetModifierConstantHealthRegen()
	return self:GetAbility():GetSpecialValueFor("bonus_health_regen")
end

function modifier_item_scythe_of_sun:GetModifierPercentageManaRegen()
	return self:GetAbility():GetSpecialValueFor("bonus_mana_regen_pct")
end

function modifier_item_scythe_of_sun:GetModifierEvasion_Constant()
	return self:GetAbility():GetSpecialValueFor("bonus_evasion")
end

function modifier_item_scythe_of_sun:GetModifierCastRangeBonus()
	return self:GetAbility():GetSpecialValueFor("cast_range_bonus")
end

function modifier_item_scythe_of_sun:GetModifierSpellAmplify_Percentage()
	return self:GetAbility():GetSpecialValueFor("spell_amp_pct")
end


modifier_item_scythe_of_sun_hex = class({})
function modifier_item_scythe_of_sun_hex:IsDebuff() return true end
function modifier_item_scythe_of_sun_hex:IsPurgable() return false end

function modifier_item_scythe_of_sun_hex:CheckState()
	return {
		[MODIFIER_STATE_HEXED] = true,
		[MODIFIER_STATE_EVADE_DISABLED] = true
	}
end

function modifier_item_scythe_of_sun_hex:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MODEL_CHANGE,
		MODIFIER_PROPERTY_MOVESPEED_MAX,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
		MODIFIER_PROPERTY_MOVESPEED_ABSOLUTE,

		MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE
	}
end

function modifier_item_scythe_of_sun_hex:GetModifierModelChange()
	return "models/items/hex/sheep_hex/sheep_hex_gold.vmdl"
end

function modifier_item_scythe_of_sun_hex:GetModifierMoveSpeed_Max()
	return self:GetAbility():GetSpecialValueFor("hex_movement_speed")
end

function modifier_item_scythe_of_sun_hex:GetModifierMoveSpeed_Limit()
	return self:GetAbility():GetSpecialValueFor("hex_movement_speed")
end

function modifier_item_scythe_of_sun_hex:GetModifierMoveSpeed_Absolute()
	return self:GetAbility():GetSpecialValueFor("hex_movement_speed")
end

function modifier_item_scythe_of_sun_hex:GetModifierIncomingDamage_Percentage()
	return self:GetAbility():GetSpecialValueFor("hex_damage_pct")
end