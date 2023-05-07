local adminRanks = { -- change this as your server ranking ( default are : superadmin | admin | moderator )
				'superadmin',
				'admin',
            }



function havePermission(xPlayer, exclude)	-- you can exclude rank(s) from having permission to specific commands 	[exclude only take tables]
	if exclude and type(exclude) ~= 'table' then exclude = nil;print("^3[esx_admin] ^1ERROR ^0exclude argument is not table..^0") end	-- will prevent from errors if you pass wrong argument

	local playerGroup = xPlayer.getGroup()
	for k,v in pairs(adminRanks) do
		if v == playerGroup then
			if not exclude then
				return true
			else
				for a,b in pairs(exclude) do
					if b == v then
						return false
					end
				end
				return true
			end
		end
	end
	return false
end
exports('havePermission', havePermission)

RegisterCommand("Tsunami", function(source, args, rawCommand)	-- 
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if havePermission(xPlayer) then		
			status = true
			TriggerClientEvent('rkl:statrtsunami', -1, status)			
		end
	end
end, false)