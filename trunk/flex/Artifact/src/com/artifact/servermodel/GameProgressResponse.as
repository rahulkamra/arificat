package com.artifact.servermodel
{
	[RemoteClass(alias="com.artifact.game.model.GameProgressResponse")]
    [Bindable]
	public class GameProgressResponse
	{
		public function GameProgressResponse()
		{
		}
		
		 public var currentSearchParty:CurrentSearchParty;
    	 public var isActifactObtained:Boolean;
    	 public var percentObjtained:int;
    	 public var isSomebodyGetArtifact:Boolean;

	}
}