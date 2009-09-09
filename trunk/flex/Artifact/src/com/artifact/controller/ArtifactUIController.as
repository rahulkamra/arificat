package com.artifact.controller
{
	import com.artifact.servermodel.ArtifactInfo;
	import com.artifact.servermodel.GameProfile;
	import com.artifact.servermodel.User;
	import com.artifact.servermodel.UserProfile;
	
	public class ArtifactUIController
	{
		public function ArtifactUIController()
		{
		}
		[Bindable]
		public static var loggedInUser:User;
		[Bindable]
		public static var userProfile:UserProfile;
		[Bindable]
		public static var gameProfile:GameProfile;
		[Bindable]
		public static var friends:Array;
		
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