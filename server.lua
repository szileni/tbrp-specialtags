local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Commands.Add("playernames", "Show/hide special ids (Admin Only and Only hide from you!)", {}, false, function(source)
    TriggerClientEvent('tbrp-specialtags:client:playernames', source)
end, 'admin')