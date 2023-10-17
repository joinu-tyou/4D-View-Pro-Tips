
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If (Form:C1466.inputMessage#"")
			Form:C1466.voWebSocket.send(Form:C1466.inputMessage)
		End if 
		
		
		
End case 
