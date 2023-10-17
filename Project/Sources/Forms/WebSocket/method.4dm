
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_TEXT:C284($wssUrl)
		$wssUrl:="ws://127.0.0.1:80/"
		
		var $handler : cs:C1710.WSConnectionHandler
		$handler:=cs:C1710.WSConnectionHandler.new()
		//https://developer.4d.com/docs/ja/API/WebSocketClass#websocket-%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88
		//４D　v20 R2 必要です。
		var $voWebSocket : 4D:C1709.WebSocket
		
		
		$voWebSocket:=4D:C1709.WebSocket.new($wssUrl; $handler)
		
		
		
		
		Form:C1466.voWebSocket:=$voWebSocket
		
		
End case 
