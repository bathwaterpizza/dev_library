--[[--------------------------------------------------------------
-- DEV - Lua developer library for general programming projects --
--                       Module: Main                           --
----------------------------------------------------------------]]

/*

ChangeLog:
1- (10/07/2014) Initial release
2- (10/12/2014) Added PrintColor
3- (10/14/2014) Added MsgColor, Notify and PNotify

*/

include( "dev_library/devlib_util.lua" )
include( "dev_library/devlib_color.lua" )

util.AddNetworkString( "DEVLib_print_cl" )
util.AddNetworkString( "DEVLib_printcolor_cl" )
util.AddNetworkString( "DEVLib_msgcolor_cl" )
util.AddNetworkString( "DEVLib_notify_cl" )
util.AddNetworkString( "DEVLib_pnotify_cl" )
local meta = FindMetaTable( "Player" )

function meta:Print( message )
	if not ( self and IsValid( self ) ) then return error("(dev>Print) invalid player userdata") end
	if not ( message and isstring( message ) ) then return error("(dev>Print) invalid string") end

	self:SendLua( [[ net.Receive( "DEVLib_print_cl", function() print( net.ReadString() ) end ) ]] )
	timer.Simple( 0.01, function()
		net.Start( "DEVLib_print_cl" )
			net.WriteString( message )
		net.Send( self )
	end )
end

function meta:PrintColor( ... )
	if not ( self and IsValid( self ) ) then return error("(dev>PrintColor) invalid player userdata") end
	if not ( ... ) then return error("(dev>PrintColor) invalid args") end

	local tab = { ... }
	local args = {}

	for k, v in next, tab do
		if ( type( v ) == "string" ) then
			table.insert( args, v )
		elseif ( type( v ) == "table" ) then
			local val = false

			if v.a then
				val = Color( v.r, v.g, v.b, v.a )
			else
				val = Color( v.r, v.g, v.b )
			end

			table.insert( args, val )
		end
	end

	self:SendLua( [[ net.Receive( "DEVLib_printcolor_cl", function() chat.AddText( unpack( net.ReadTable() ) ) end ) ]] )
	timer.Simple( 0.01, function()
		net.Start( "DEVLib_printcolor_cl" )
			net.WriteTable( args )
		net.Send( self )
	end )
end

function meta:MsgColor( ... )
	if not ( self and IsValid( self ) ) then return error("(dev>MsgColor) invalid player userdata") end
	if not ( ... ) then return error("(dev>MsgColor) invalid args") end

	local tab = { ... }
	local args = {}

	for k, v in next, tab do
		if ( type( v ) == "string" ) then
			table.insert( args, v )
		elseif ( type( v ) == "table" ) then
			local val = false

			if v.a then
				val = Color( v.r, v.g, v.b, v.a )
			else
				val = Color( v.r, v.g, v.b )
			end

			table.insert( args, val )
		end
	end

	self:SendLua( [[ net.Receive( "DEVLib_msgcolor_cl", function() MsgC( unpack( net.ReadTable() ), "\n" ) end ) ]] )
	timer.Simple( 0.01, function()
		net.Start( "DEVLib_msgcolor_cl" )
			net.WriteTable( args )
		net.Send( self )
	end )
end

function meta:Notify( ntxt, ntype, ndur )
	if not ( self and IsValid( self ) ) then return error("(dev>Notify) invalid player userdata") end
	if not ntxt then return error("(dev>Notify) invalid string") end
	if not ( ntype and isnumber( ntype ) ) then return error("(dev>Notify) invalid type number") end
	if not ( ndur and isnumber( ndur ) ) then return error("(dev>Notify) invalid duration number") end

	self:SendLua( [[ net.Receive( "DEVLib_notify_cl", function() notification.AddLegacy( net.ReadString(), net.ReadDouble(), net.ReadDouble() ) end ) ]] )
	timer.Simple( 0.01, function()
		net.Start( "DEVLib_notify_cl" )
			net.WriteString( ntxt )
			net.WriteDouble( ntype )
			net.WriteDouble( ndur )
		net.Send( self )
	end )
end

function meta:PNotify( str, time )
	if not ( self and IsValid( self ) ) then return error("(dev>PNotify) invalid player userdata") end
	if not str then return error("(dev>PNotify) invalid string") end
	if not ( time and isnumber( time ) ) then return error("(dev>PNotify) invalid number") end

	self:SendLua( [[ net.Receive( "DEVLib_pnotify_cl", function() notification.AddProgress( "devlib", net.ReadString() ) timer.Simple( net.ReadDouble(), 
	function() notification.Kill( "devlib" ) end ) end ) ]] )
	timer.Simple( 0.01, function()
		net.Start( "DEVLib_pnotify_cl" )
			net.WriteString( str )
			net.WriteDouble( time )
		net.Send( self )
	end )
end

function meta:GetProfile()
	if not ( self and IsValid( self ) ) then return error("(dev>GetProfile) invalid player userdata") end

	local url = "http://steamcommunity.com/profiles/" .. self:SteamID64()
	return tostring( url )
end

function meta:KillSpawn( delay )
	if not ( self and IsValid( self ) ) then return error("(dev>KillSpawn) invalid player userdata") end
	if not ( delay and isnumber( delay ) ) then return error("(dev>KillSpawn) invalid delay number") end
	if delay < 0.1 then delay = 0.1 end

	self:Kill()
	timer.Simple( delay, function() self:Spawn() end )
end

function meta:cprint( ... )
	if not ... then return error("(dev>cprint) invalid string content") end
	if not ( self and IsValid( self ) ) then return error("(dev>cprint) invalid player userdata") end

	self:PrintMessage( HUD_PRINTCONSOLE, ... )
end

function cprintall( ... )
	if not ... then return error("(dev>cprintall) invalid string content") end

	PrintMessage( HUD_PRINTCONSOLE, ... )
end

--todo function respawn
--saves player's weapons
--saves player's smg, pistol and buckshot ammo
--respawns at same place and with same view angle