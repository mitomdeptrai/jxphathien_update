-- The protocol table is optional in this client build.
-- Keep it defined so script\protocol.lua can initialize without a nil table.
if MODEL_GAMECLIENT ~= 1 then
	return
end

T_PROTOCOL_DEF = T_PROTOCOL_DEF or {}
