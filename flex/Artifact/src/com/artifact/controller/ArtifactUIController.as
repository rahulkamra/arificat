package com.artifact.controller
{
	import com.artifact.servermodel.ArtifactInfo;
	import com.artifact.servermodel.User;
	
	public class ArtifactUIController
	{
		public function ArtifactUIController()
		{
		}
		
		public static var loggedInUser:User;
		public function checkUsername(username:String):void{
			Artifact.artifactServiceController.authenticate(username);
		}
		
		
		public function getAllArtifacts():void{
			Artifact.artifactServiceController.getAllArtifacts();
		}
		
		public function startNewSearchParty(artifact:ArtifactInfo):void{
			Artifact.artifactServiceController.startNewSearchParty(artifact);
		}
	}
}