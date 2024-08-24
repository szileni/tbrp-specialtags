# RedM overhead player/entity specialtags for RSG Framework

A script to display Special names above players head. (Based on Admin/Mod/VIP stuffs)

# Install

Follow these simple steps to install tbrp-specialtags:

    - Download tbrp-specialtags and add it to your resources folder.
    - Ensure it's enabled in your server configuration: "ensure tbrp-specialtags".
	- Add "TriggerEvent('tbrp-specialtags:client:playernames', source)" into "rsg-spawn:client:setupSpawnUI" side
	- Add licenses into "config.lua"

# Replace this in "rsg-spawn"

``
`RegisterNetEvent('rsg-spawn:client:setupSpawnUI', function(cData, new)
`    if new == false then
`        TriggerEvent('rsg-spawn:client:existingplayer')
`        exports.weathersync:setSyncEnabled(true)
`		TriggerEvent('tbrp-specialtags:client:playernames', source)
`    else
`        TriggerEvent('rsg-spawn:client:newplayer')
`		TriggerEvent('tbrp-specialtags:client:playernames', source)
`    end
`end)
``

# Use

If you want to hide it then use [/playernames] (Only hides from you, not from other players!)
