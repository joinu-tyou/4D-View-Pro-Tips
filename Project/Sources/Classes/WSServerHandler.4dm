Class constructor
	
Function onConnection($wss : Object; $param : Object) : Object
	// VerifyAddress メソッドを呼び出して、リモートアドレスからの接続を許可するか判断します
	If (VerifyAddress($param.request.remoteAddress))
		// 接続を許可する場合
		// WSConnectionHandler オブジェクトが返されます
		// 4D はこのオブジェクトを使って、この接続に紐づけられた 
		// 4D.WebSocketConnection オブジェクトをインスタンス化します
		return cs:C1710.WSServerHandler.new()
	Else 
		// 接続がキャンセルされます
		return Null:C1517
	End if 
	
	
	
Function onError($wss : Object; $param : Object)
	
	If (OB Is defined:C1231($param; "statusText"))
		LogFile("!!! Server error: "+$param.statusText)
	Else 
		LogFile("!!! Server error: ")
	End if 
	
	
	
Function onMessage($ws : 4D:C1709.WebSocketConnection; $message : Object)
	// 他のチャットクライアントにメッセージをブロードキャストします
	This:C1470.broadcast($ws; $message.data)
	
Function onOpen($ws : 4D:C1709.WebSocketConnection; $message : Object)
	LogFile("*** Server started")
	// 接続したユーザーにメッセージを送信します
	//$ws.send("チャットへようこそ!")
	// 他のクライアントへは "新しいクライアントが接続しました" というメッセージを送信します
	This:C1470.broadcast($ws; "新しいクライアントが接続しました")
	
Function onTerminate($ws : 4D:C1709.WebSocketConnection; $message : Object)
	// "クライアントが切断されました" メッセージを他のクライアントに送信します
	This:C1470.broadcast($ws; "クライアントが切断されました")
	
Function broadcast($ws : 4D:C1709.WebSocketConnection; $message : Text)
	var $client : 4D:C1709.WebSocketConnection
	// 他のチャットクライアントにメッセージをブロードキャストします
	
	
	If (OB Is defined:C1231($ws; "wss"))
		
		For each ($client; $ws.wss.connections)
			// クライアントの id が発信者と同一でない場合にメッセージを送信します
			If ($client.id#$ws.id)
				$client.send($message)
			End if 
		End for each 
		
	Else 
		
	End if 
	
	
	
	