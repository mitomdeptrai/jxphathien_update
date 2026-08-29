if MODEL_GAMECLIENT ~= 1 then
	return
end

Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\protocol.lua")

function OnLearnSkillButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_SKILL_LEARN", 0)
end

function OnLearnPassiveSkillButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_PASSIVE_SKILL_LEARN", 0)
end

function OnBindSkillButtonClick(nSlotIndex)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nSlotIndex)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_SKILL_BIND", handle)
	OB_Release(handle)
end

function OnUpgradeButtonClick(nSlotIndex)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nSlotIndex)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_SKILL_UPGRADE", handle)
	OB_Release(handle)
end

function OnPassiveUpgradeButtonClick(nSlotIndex)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nSlotIndex)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_PASSIVE_SKILL_UPGRADE", handle)
	OB_Release(handle)
end

function OnUpgradePetButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_UPGRADE", 0)
end

function OnRenamePetButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_RENAME", 0)
end

function OnExpButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_EXP", 0)
end

function OnSummonButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_SUMMON", 0)
end

function OnUnSummonButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_UNSUMMON", 0)
end

function OnFusionButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_PET_FUSION", 0)
end

function OnCompanionButtonClick()
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_C2S_OPEN_COMPANIONEQUIP", 0)
end

function s2c_OpenRebuildCompanionEquipUI()
	OpenRebuildCompanionEquipUI()
end

function DoRebuild(nItemId, nRet)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nItemId)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nRet)
	print(nItemId, nRet)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_C2S_DO_REBUILD_COMPANIONEQUIP", handle)
	OB_Release(handle)
end

function s2c_DoRebuild()
    CompanionEquip_UpdateTmpAttrib(0, {})
end

function TryRebuild(nItemId)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nItemId)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_C2S_TYR_REBUILD_COMPANIONEQUIP", handle)
	OB_Release(handle)
end

function s2c_TryRebuild(nCount, tbAttrib)
	CompanionEquip_UpdateTmpAttrib(nCount, tbAttrib)
end

function EquipCousume(nItemId)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nItemId)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_C2S_ASKCONSUME_COMPANIONEQUIP", handle)
	OB_Release(handle)
end

function s2c_SetCompanionEquipCostTip(nCost)
	SetCompanionEquipCostTip(nCost)
end