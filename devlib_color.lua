--[[--------------------------------------------------------------
-- DEV - Lua developer library for general programming projects --
--                      Module: Colors                          --
----------------------------------------------------------------]]

/*

ChangeLog:
1- (10/07/2014) Initial release
2- (10/09/2014) Added violet color set

*/

local clr = {}
clr.red = {}
clr.red.flat = Color( 255, 0, 0 )
clr.red.dark = Color( 155, 0, 0 )
clr.red.wine = Color( 139, 0, 0 )
clr.red.brick = Color( 255, 48, 48 )
clr.red.indian = Color( 205, 92, 92 )
clr.red.orange = Color( 255, 36, 0 )
clr.green = {}
clr.green.flat = Color( 0, 255, 0 )
clr.green.dark = Color( 0, 100, 0 )
clr.green.olive = Color( 128, 128, 0 )
clr.green.forest = Color( 34, 139, 34 )
clr.green.lime = Color( 50, 205, 50 )
clr.green.pale = Color( 152, 251, 152 )
clr.green.spring = Color( 0, 255, 127 )
clr.green.swamp = Color( 85, 107, 47 )
clr.blue = {}
clr.blue.flat = Color( 0, 0, 255 )
clr.blue.dark = Color( 0, 0, 155 )
clr.blue.light = Color( 0, 255, 255 )
clr.blue.royal = Color( 65, 105, 225 )
clr.blue.sky = Color( 135, 206, 235 )
clr.blue.steel = Color( 70, 130, 180 )
clr.blue.navy = Color( 0, 0, 128 )
clr.blue.water = Color( 127, 255, 212 )
clr.blue.cadet = Color( 152, 245, 255 )
clr.pink = {}
clr.pink.flat = Color( 238, 169, 184 )
clr.pink.light = Color( 255, 182, 193 )
clr.pink.hot = Color( 255, 105, 180 )
clr.pink.deep = Color( 255, 20, 147 )
clr.pink.magenta = Color( 255, 0, 255 )
clr.yellow = {}
clr.yellow.flat = Color( 255, 255, 0 )
clr.yellow.gold = Color( 255, 215, 0 )
clr.yellow.dark = Color( 205, 205, 0 )
clr.yellow.green = Color( 153, 204, 50 )
clr.orange = {}
clr.orange.flat = Color( 255, 165, 0 )
clr.orange.red = Color( 255, 36, 0 )
clr.orange.dark = Color( 255, 140, 0 )
clr.orange.cadmium = Color( 255, 97, 3 )
clr.purple = {}
clr.purple.flat = Color( 160, 32, 240 )
clr.purple.dark = Color( 128, 0, 128 )
clr.purple.light = Color( 147, 112, 219 )
clr.white = {}
clr.white.flat = Color( 255, 255, 255 )
clr.white.smoke = Color( 245, 245, 245 )
clr.white.ghost = Color( 248, 248, 255 )
clr.black = {}
clr.black.flat = Color( 0, 0, 0 )
clr.black.light = Color( 25, 25, 25 )
clr.grey = {}
clr.grey.flat = Color( 84, 84, 84 )
clr.grey.silver = Color( 192, 192, 192 )
clr.grey.light = Color( 211, 211, 211 )
clr.grey.slate = Color( 112, 128, 144 )
clr.violet = {}
clr.violet.flat = Color( 238, 130, 238 )
clr.violet.dark = Color( 148, 0, 211 )
clr.violet.red = Color( 208, 32, 144 )
clr.violet.pale = Color( 219, 112, 147 )
clr.violet.blue = Color( 159, 95, 159 )
clr.salmon = {}
clr.salmon.flat = Color( 250, 128, 114 )
clr.salmon.light = Color( 255, 160, 122 )
clr.salmon.dark = Color( 233, 150, 122 )
clr.salmon.dark2 = Color( 238, 130, 98 )
clr.brown = {}
clr.brown.flat = Color( 139, 69, 19 )
clr.brown.sand = Color( 244, 164, 96 )
clr.brown.dark = Color( 92, 64, 51 )
clr.brown.dark2 = Color( 92, 64, 51 )