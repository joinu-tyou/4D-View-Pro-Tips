//%attributes = {}

var $handler : cs:C1710.WSServerHandler
$handler:=cs:C1710.WSServerHandler.new()

CALL WORKER:C1389("WebSocketServer"; Formula:C1597(WSS:=4D:C1709.WebSocketServer.new($handler)))

