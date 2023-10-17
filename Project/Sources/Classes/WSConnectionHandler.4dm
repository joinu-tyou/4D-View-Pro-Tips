Class constructor
	
Function onMessage($ws : 4D:C1709.WebSocket; $event : Object)
	ALERT:C41($event.data)
	
Function onTerminate($ws : 4D:C1709.WebSocket; $event : Object)
	ALERT:C41("接続を終了しました")