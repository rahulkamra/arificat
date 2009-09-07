package com.artifact.controller
{
	import com.artifact.constants.ArtifactServiceConstants;
	import com.artifact.servermodel.User;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class ArtifactServiceController
	{
		public function ArtifactServiceController()
		{
		}
		public function myFaultHandler(event:FaultEvent):void{
			Alert.show(event.message.toString())
		}
		
		public function authenticate(username:String):void{
			var authRo:RemoteObject=new RemoteObject;
			authRo.endpoint=ArtifactServiceConstants.SERVER_URL;
			authRo.destination=ArtifactServiceConstants.LOGIN_SERVICE;
			authRo.source=ArtifactServiceConstants.LOGIN_SERVICE;
			authRo.addEventListener(FaultEvent.FAULT,myFaultHandler);
			authRo.addEventListener(ResultEvent.RESULT,authenticateResultHandler);
			trace(username)
			authRo.doLogin(username);	
		}
		
		public function authenticateResultHandler(event:ResultEvent):void{
			var user:User=event.result as User;
			//trace(user.id)
			//trace('end')
		}

	}
}