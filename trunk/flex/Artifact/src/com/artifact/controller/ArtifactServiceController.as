package com.artifact.controller
{
	import com.artifact.constants.ArtifactServiceConstants;
	import com.artifact.servermodel.ArtifactInfo;
	import com.artifact.servermodel.CompleteProfileWrapper;
	import com.artifact.servermodel.User;
	import com.artifact.servermodel.UserProfile;
	
	import mx.controls.Alert;
	import mx.core.Application;
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
		/**
		 * Authentication
		 **/
		public function authenticate(username:String):void{
			var ro:RemoteObject=new RemoteObject;
			ro.showBusyCursor=true;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.LOGIN_SERVICE;
			ro.source=ArtifactServiceConstants.LOGIN_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,authenticateResultHandler);
			trace(username)
			ro.doLogin(username);	
		}
		
		public function authenticateResultHandler(event:ResultEvent):void{
			var user:User=event.result as User;
			if(user){
				ArtifactUIController.loggedInUser=user
				getProfile();
			}else{
				Alert.show('Wrong username');
			}
		}
		/**
		 * Get Profile
		 * 
		 **/
		 public function getProfile():void{
		 	var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GET_PROFILE;
			ro.showBusyCursor=true;
			ro.source=ArtifactServiceConstants.GET_PROFILE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,getProfileResultHandler);
			ro.getProfile();
		 }
		 
		 public function getProfileResultHandler(event:ResultEvent):void{
		 	var completeProfile:CompleteProfileWrapper=event.result as CompleteProfileWrapper;
		 	ArtifactUIController.gameProfile=completeProfile.gameProfile;
		 	ArtifactUIController.userProfile=completeProfile.userProfile; 
		 	ArtifactUIController.friends=completeProfile.friendsArray;
		 	Application.application.currentState='loggedin';
		 }
		
		/**
		 * 
		 * Get All Artifacts 
		 * 
		 **/
		public function getAllArtifacts():void{
			var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GET_ARTIFACTS_SERVICE;
			ro.source=ArtifactServiceConstants.GET_ARTIFACTS_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,getAllArtifactsResultHandler);
			ro.getActiveArtifacts();	
		}
		
		public function getAllArtifactsResultHandler(event:ResultEvent):void{
			var resultArray:Array=event.result as Array;
			Application.application.home.newSearchPartyPopUp.lstMain.dataProvider=resultArray;
			var artifactInfo:ArtifactInfo;
			trace(event.result)
		}
		
		/**
		 * Start a new search party
		 * 
		 **/
		 
		 public function startNewSearchParty(artifact:ArtifactInfo):void{
		 	var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.NEW_SEARCH_PARTY_SERVICE;
			ro.source=ArtifactServiceConstants.NEW_SEARCH_PARTY_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,startNewSearchPartyResultHandler);
			var userProfile:UserProfile=new UserProfile;
			userProfile.id=12;
			var user:User=new User;
			user.username='haha';
			userProfile.user=user
			ro.startSearchParty(userProfile);	
		 }
		 
		 public function startNewSearchPartyResultHandler(event:ResultEvent):void{
		 	var result:UserProfile=event.result as UserProfile;
		 	trace(event.result)
		 	trace(result.user)
		 }

	}
}