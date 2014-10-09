--[[--------------------------------------------------------------
-- DEV - Lua developer library for general programming projects --
--                       Module: Main                           --
----------------------------------------------------------------]]

/*

ChangeLog:
1- (10/07/2014) Initial release

*/

include( "dev_library/devlib_util.lua" )
include( "dev_library/devlib_color.lua" )
util.AddNetworkString( "DEVLib_print_cl" )
local meta = FindMetaTable( "Player" )

local function meta:PrintCL( message )
	if not ( self and IsValid( self ) ) then return error("(dev>PrintCL) invalid player userdata") end
	if not ( message and isstring( message ) ) then return error("(dev>PrintCL) invalid string") end

	self:SendLua( [[ net.Receive( "DEVLib_print_cl", function() print( net.ReadString() ) end ) ]] )
	timer.Simple( 0.1, function()
		net.Start( "DEVLib_print_cl" )
			net.WriteString( message )
		net.Send( self )
	end )
end

local function meta:GetProfile()
	if not ( self and IsValid( self ) ) then return error("(dev>GetProfile) invalid player userdata") end

	local url = "http://steamcommunity.com/profiles/" .. self:SteamID64()
	return tostring( url )
end

local function meta:KillSpawn( delay )
	if not ( self and IsValid( self ) ) then return error("(dev>KillSpawn) invalid player userdata") end
	if not ( delay and isnumber( delay ) ) then return error("(dev>KillSpawn) invalid delay number") end
	if delay < 0.1 then delay = 0.1 end

	self:Kill()
	timer.Simple( delay, function() self:Spawn() end )
end

local function meta:cprint( ... )
	if not ... then return error("(dev>cprint) invalid string content") end
	if not ( self and IsValid( self ) ) then return error("(dev>cprint) invalid player userdata") end

	self:PrintMessage( HUD_PRINTCONSOLE, ... )
end

local function cprintall( ... )
	if not ... then return error("(dev>cprintall) invalid string content") end

	PrintMessage( HUD_PRINTCONSOLE, ... )
end