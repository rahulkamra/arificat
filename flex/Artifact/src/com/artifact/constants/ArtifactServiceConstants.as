package com.artifact.constants
{
	public class ArtifactServiceConstants
	{
		public function ArtifactServiceConstants()
		{
		}
		
		public static const SERVER_URL:String = "http://localhost:8090/amfphp/gateway.php"
		
		public static const LOGIN_SERVICE:String="com.artifact.login.service.LoginService";
		public static const GET_PROFILE:String="com.artifact.profile.service.ProfileService";
		public static const GET_ARTIFACTS_SERVICE:String="com.artifact.info.service.ArtifactService";
		public static const NEW_SEARCH_PARTY_SERVICE:String="com.artifact.searchparty.service.SearchPartyService";
		public static const GAME_SERVICE:String="com.artifact.game.service.GameService";
	}
}