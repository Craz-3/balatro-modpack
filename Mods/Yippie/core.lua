-- Script Loading Start

        -- load jokers
assert(SMODS.load_file('scripts/jokers.lua'))()
        -- load decks
assert(SMODS.load_file('scripts/decks.lua'))()

-- Script Loading End

--Sound Junk Start

SMODS.Sound { -- used to import the sound effect
key = 'yippie',
path = 'yippie.ogg',
volume = 1.3,
pitch = 1.0,
}

SMODS.Sound:register_global() -- used to import the sound effect

-- Sound Junk End

--Atlas Junk start

SMODS.Atlas { -- atlas for the joker textures.
       
    key = "Coo29",  -- key it uses to call the correct sheet later on.
      
    path = "JokerSheet.png",  -- name of the file the joker textures are located in.

    -- size of the individual textures in the file. (71x95 is default)
    px = 71,
    py = 95
}

SMODS.Atlas { -- atlas for the deck texture.

    key = "Decks",  -- key it usesto call the correct sheet later on.

    path = "decks.png", --name of the file the deck textures are located in.

    -- size of the indvidual texture in the file. (71x95 is default)
    px = 71,
    py = 95
}

SMODS.Atlas { -- icon for the modpack as shown in the mods menu.
    key = "modicon", -- this text needs to be modicon afaik.
   path = "modicon.png", -- file name should also be modicon.png.
   px = 32, -- icon should be 32x32
   py = 32
}

SMODS.Atlas { -- atlas for the possom texture.
       
key = "possom",  -- key it uses to call the correct sheet later on.
  
path = "possom.png",  -- name of the file the joker textures are located in.

-- size of the individual joker textures in the file. (71x95 is default)
px = 71,
py = 95
}

SMODS.Atlas { -- atlas for the minmoo texture.
       
key = "minmoo",  -- key it uses to call the correct sheet later on.
  
path = "minmoo.png",  -- name of the file the joker textures are located in.

-- size of the individual joker textures in the file. (71x95 is default)
px = 71,
py = 95
}

--Atlas Junk End

--Shader Stuff Start

--Shader Stuff End