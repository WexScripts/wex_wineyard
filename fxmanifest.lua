fx_version 'cerulean'
game 'gta5'

name "wex_wineyard"
description "wineyard"
author "Tobix"
version "1.0.0"
lua54 "yes"



shared_scripts {
    '@ox_lib/init.lua',
}

server_scripts {
	'shared/*.lua',
	'server/*.lua'
}

client_scripts {
	'shared/*.lua',
	'client/*.lua'
}


