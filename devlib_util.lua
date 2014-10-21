--[[--------------------------------------------------------------
-- DEV - Lua developer library for general programming projects --
--                     Module: Utility                          --
----------------------------------------------------------------]]

/*

ChangeLog:
1- (10/07/2014) Initial release

*/

DEV = DEV or {}

function DEV.IsValidID( idstr )
	if not ( idstr ) then return error("(dev>IsValidID) invalid id string") end
	if not isstring( idstr ) then return nil end

	if string.match( idstr, "^STEAM_%d:%d:%d+$" ) then
		return true
	else
		return false
	end
end

function DEV.IsValidURL( urlstr )
	if not ( urlstr ) then return error("(dev>IsValidURL) invalid url string") end
	if not isstring( urlstr ) then return nil end

	if ( string.sub( urlstr, 1, 7 ) == "http://" ) or ( string.sub( urlstr, 1, 8 ) == "https://" ) then
		return true
	else
		return false
	end
end

function DEV.IsValidIP( ipstr )
	if not ( ipstr ) then return error("(dev>IsValidIP) invalid ip string") end
	if not isstring( ipstr ) then return nil end

	if string.find( ipstr, "^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$" ) then
		return true
	else
		return false
	end
end

function DEV.StripDecimal( number )
	if not ( number ) then return error("(dev>StripDecimal) invalid number/string") end
	number = tostring( number )

	local _number = string.Explode( ".", number )
	return tonumber( _number[1] )
end

function DEV.StripPort( ip )
	if not ( ip ) then return error("(dev>StripPort) invalid ip string") end
	local str = string.match( ip, ":" )
	if not str or ( str == "" ) then return ip end

	local _ip = string.Explode( ":", ip )
	return tostring( _ip[1] )
end

function DEV.StripQuotes( qtstr )
	if not ( qtstr ) then return error("(dev>StripQuotes) invalid string") end
	if not isstring( qtstr ) then return nil end

	return string.gsub( qtstr, "^%s*[\"]*(.-)[\"]*%s*$", "%1" )
end

function DEV.StripVector( invec )
	if not ( invec ) then return error("(dev>StripVector) invalid vector") end
	if not isvector( invec ) then return nil end

	local splVecX = string.Explode( ".", tostring( invec.x ) )
	local splVecZ = string.Explode( ".", tostring( invec.y ) )
	local splVecY = string.Explode( ".", tostring( invec.z ) )

	return Vector( splVecX[1], splVecZ[1], splVecY[1] )
end

function DEV.StringToVar( var )
	if not ( var ) then return error("(dev>StringToVar) invalid string") end
	if not isstring( var ) then return nil end

	local _var = string.Explode( "%.", var )
	local key = _G

	for k, v in ipairs( _var ) do
		key = key[ v ]
		if not key then key = nil end
	end

	return key
end

function DEV.GetPlayer( plystr )
	if not ( plystr ) then return error("(dev>GetPlayer) invalid string") end
	if not isstring( plystr ) then return nil end
	plystr = string.lower( plystr )
	local outply = false

	for k, ply in ipairs( player.GetAll() ) do
		if ( plystr == string.lower( ply:Nick() ) ) then
			if not outply then
				return ply
			else
				return nil
			end
		end
	end
	for k, ply in ipairs( player.GetAll() ) do
		local _outply = false
		if string.find( string.lower( ply:Nick() ), plystr, 1, true ) then
			_outply = ply
		end
		if outply and _outply then
			return nil
		end
		if _outply then
			outply = _outply
		end
	end

	if not outply then return nil else return outply end
end

function DEV.GetPlayerID( idstr )
	if not ( idstr ) then return error("(dev>GetPlayerID) invalid string") end
	if not isstring( idstr ) then return nil end
	local meta = FindMetaTable( "Player" )
	local checkID = { meta:UniqueID(), DEV.StripPort( meta:IPAddress() ), meta:SteamID(), meta:UserID() }
	idstr = string.upper( idstr )

	for k, _checkID in ipairs( checkID ) do
		for i, v in ipairs( player.GetAll() ) do
			if ( tostring( _checkID( v ) ) == idstr ) then
				return v
			end
		end
	end

	return nil
end

function DEV.FindPlayer( plystr )
	if not ( plystr ) then return error("(dev>FindPlayer) invalid string") end
	if not isstring( plystr ) then return nil end
	local outply = DEV.GetPlayer( plystr ) or DEV.GetPlayerID( plystr )

	if ( outply and IsValid( outply ) ) then
		return outply
	else
		return nil
	end
end