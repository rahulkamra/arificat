package com.artifact.controller
{
	public class ArtifactUIController
	{
		public function ArtifactUIController()
		{
		}
		
		public function checkUsername(username:String):void{
			Artifact.artifactServieController.authenticate(username);
		}

	}
}