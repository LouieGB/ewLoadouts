fx_version 'cerulean'
game 'gta5'

author 'OscarRoss'
description 'Loadout script using ox_lib'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script 'client.lua'
server_script 'server.lua'

lua54 'yes'
