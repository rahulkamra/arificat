package com.artifact.servermodel
{
	[RemoteClass(alias="com.artifact.searchparty.model.CurrentSearchParty")]
    [Bindable]
	public class CurrentSearchParty
	{
		public function CurrentSearchParty()
		{
		}
		
		public var id:int;
    	public var artifactLvl:int;
    	public var progress:int;
    	public var user:User;
    	public var artifact:ArtifactInfoi;

	}
}