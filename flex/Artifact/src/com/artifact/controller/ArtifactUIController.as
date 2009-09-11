package com.artifact.controller
{
	import com.artifact.components.Search;
	import com.artifact.servermodel.ArtifactInfo;
	import com.artifact.servermodel.CurrentSearchParty;
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
		[Bindable]
		public static var currentSearchParties:Array;
		[Bindable]
		public static var friendSearchParties:Array;
		[Bindable]
		public static var myArtifacts:Array;
		
		public static var currentSearch:Search;
		
		public function checkUsername(username:String):void{
			Artifact.artifactServiceController.authenticate(username);
		}
		
		
		public function getAllArtifacts():void{
			Artifact.artifactServiceController.getAllArtifacts();
		}
		
		public function startNewSearchParty(artifact:ArtifactInfo):void{
			Artifact.artifactServiceController.startNewSearchParty(artifact);
		}
		public function getSpyQuestions(friend:UserProfile,currentSearchParty:CurrentSearchParty):void{
			Artifact.artifactServiceController.getSpyQuestions(friend,currentSearchParty);
		}
		
		public function grantSpyProgress():void{
			
		}
		public function findCommonFriendsById(artifactId:int):int{
			var numberOfFriends:int=0;
			for(var count:int = 0 ; count < friendSearchParties.length ; count++){
				var eachObj:CurrentSearchParty = friendSearchParties[count] as CurrentSearchParty;
				if(eachObj.artifact.id == artifactId){
					numberOfFriends++;
				}
			}
			return numberOfFriends;
		}
		
		public function giveCommonFriendsProfileByArtifactId(artifactId:int):Array{
			var commonFriendsArray:Array=new Array();
			
			for(var count:int = 0 ; count < friendSearchParties.length ; count++){
				var eachObj:CurrentSearchParty = friendSearchParties[count] as CurrentSearchParty;
				if(eachObj.artifact.id == artifactId){
					commonFriendsArray.push(getFriendProfileById(eachObj.user.id));
				}
			}
			
			return commonFriendsArray;
		}
		
		public function getFriendProfileById(userId:int):UserProfile{
			for(var count:int = 0 ; count < friends.length ; count++){
				var eachObj:UserProfile=friends[count] as UserProfile;
				if(eachObj.user.id == userId){
					break;
				}
			}
			return eachObj;
		}
		
		
		
	}
}