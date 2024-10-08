fx_version 'cerulean'
game 'gta5'

author 'Sky\'s Scripts'
description 'Custom Plates Script'

version '1.0'

shared_scripts {
    "config.lua",
}


client_scripts {
    "client.lua"
}

files {
    "README.md",
    'images/*.png',
    'templates/*.psd'

}

escrow_ignore {
    "config.lua",
    "client.lua",
    "README.md",
    'images/*.png',
    "templates/*.psd"
}

lua54 'yes'