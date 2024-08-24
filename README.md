# RedM overhead player/entity specialtags for RSG Framework

A script to display Special names above players head. (Based on Admin/Mod/VIP stuffs)

![alt text]([http://url/to/img.png](https://media.discordapp.net/attachments/1249060557038948474/1276975300839866408/image.png?ex=66cb7b6c&is=66ca29ec&hm=063726fe321610f3c690bf1bdf8cffb48ac54bec16284ed683cbee0f2a4c5060&=&format=webp&quality=lossless))

# Install

Follow these simple steps to install tbrp-specialtags:

    - Download tbrp-specialtags and add it to your resources folder.
    - Ensure it's enabled in your server configuration: "ensure tbrp-specialtags".
	- Add "TriggerEvent('tbrp-specialtags:client:playernames', source)" into "rsg-spawn:client:setupSpawnUI" side
	- Add licenses into "config.lua"

# Replace this in "rsg-spawn"

``
RegisterNetEvent('rsg-spawn:client:setupSpawnUI', function(cData, new)
    if new == false then
        TriggerEvent('rsg-spawn:client:existingplayer')
        exports.weathersync:setSyncEnabled(true)
		TriggerEvent('tbrp-specialtags:client:playernames', source)
    else
        TriggerEvent('rsg-spawn:client:newplayer')
		TriggerEvent('tbrp-specialtags:client:playernames', source)
    end
end)
``

# Use

If you want to hide it then use [/playernames] (Only hides from you, not from other players!)
