package com.artifact.controller
{
	import com.artifact.constants.ArtifactServiceConstants;
	import com.artifact.servermodel.ArtifactInfo;
	import com.artifact.servermodel.CompleteProfileWrapper;
	import com.artifact.servermodel.CurrentSearchParty;
	import com.artifact.servermodel.GameProfile;
	import com.artifact.servermodel.GameProgress;
	import com.artifact.servermodel.GameProgressResponse;
	import com.artifact.servermodel.Inventory;
	import com.artifact.servermodel.User;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	import mx.utils.ObjectUtil;
	
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
		 	ArtifactUIController.currentSearchParties=completeProfile.currentSearchPartiesArray;
		 	ArtifactUIController.friendSearchParties=completeProfile.friendSearchPartiesArray;
		 	ArtifactUIController.myArtifacts=completeProfile.myArtifacts;
		 	//trace(completeProfile.currentSearchPartiesArray);
		 	Application.application.currentState='loggedin';
		 }
		
		/**
		 * 
		 * Get All Artifacts 
		 * 
		 **/
		public function getAllArtifacts():void{
			var ro:RemoteObject=new RemoteObject;
			ro.showBusyCursor=true;
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
			ro.startSearchParty(artifact);	
		 }
		 
		 public function startNewSearchPartyResultHandler(event:ResultEvent):void{
		 	var result:CurrentSearchParty=event.result as CurrentSearchParty;
		 	//add current search party into ui :)
		 	ArtifactUIController.currentSearchParties.push(result);
		 	var newCurrentSearchParties:Array=ObjectUtil.copy(ArtifactUIController.currentSearchParties) as Array;
		 	ArtifactUIController.currentSearchParties=newCurrentSearchParties;
		 	//ArtifactUIController.currentSearchParties.
		 	
		 	//close pop up
		 	if(Application.application.home.newSearchPartyPopUp){
		 		PopUpManager.removePopUp(Application.application.home.newSearchPartyPopUp);
		 		Application.application.home.newSearchPartyPopUp=null;
		 	} 
		 	
		 }
		 
		 /**
		 * 
		 * Get Spy Questions
		 * 
		 **/
		 
		 public function getSpyQuestions(gameProgress:GameProgress):void{
		 	var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GAME_SERVICE;
			ro.source=ArtifactServiceConstants.GAME_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,getSpyQuestionsResultHandler);
			ro.getSpyQuestions(gameProgress);	
		 }
		 
		 
		 public function getSpyQuestionsResultHandler(event:ResultEvent):void{
		 	if(event.result == null){
		 		Alert.show('You cannot spy the same person twice')
		 		return;
		 	}
		 	var result:Array=event.result as Array;
		 	ArtifactUIController.currentSearch.currentState ='questions'
		 	ArtifactUIController.currentSearch.rptQuestions.dataProvider=event.result;
		 }
		 
		 /**
		 * 
		 * 
		 * 
		 **/
		 
		 public function grantSpyProgress(answers:Array,gameProgress:GameProgress):void{
		 	var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GAME_SERVICE;
			ro.source=ArtifactServiceConstants.GAME_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,grantSpyProgressResultHandler);
			ro.grantSpyProgress(answers,gameProgress);	
		 }
		 
		 public function grantSpyProgressResultHandler(event:ResultEvent):void{
		 	if(event.result == null){
		 		Alert.show('You cannot spy the same person twice')
		 		return;
		 	}
		 	
		 	var gameProgressResponse:GameProgressResponse=event.result as GameProgressResponse;
		 	trace(gameProgressResponse);
		 	trace(event.result);
		 	
		 	if(genericProgressResultHandler(event)){
		 		return;
		 	}
		 	
		 	var updatedSearchParty:CurrentSearchParty=gameProgressResponse.currentSearchParty;
		 	
		 	//updating current search party
		 	
		 	var percentObjtained:int=gameProgressResponse.percentObjtained;
		 	var correntAnswers:int=percentObjtained/(5*ArtifactUIController.gameProfile.spyLvl);
		 	ArtifactUIController.currentSearch.experienceGained=percentObjtained;
		 	ArtifactUIController.currentSearch.correctAnswers=correntAnswers;
		 	ArtifactUIController.currentSearch.currentState='report';
		 	
		 	artifactObtainedResultHandler(event);

		 	Artifact.artifactUIController.updateCurrentSearchParty(updatedSearchParty);
		 	ArtifactUIController.currentSearch.data=updatedSearchParty;
		 	ArtifactUIController.currentSearchParties=ObjectUtil.copy(ArtifactUIController.currentSearchParties) as Array;
		 	trace(gameProgressResponse.percentObjtained);
		 	trace('end');
		 }
		 /**
		 * 
		 * 
		 **/
		 
		 public function grantScoutProgress(gameProgress:GameProgress):void{
		 	var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GAME_SERVICE;
			ro.source=ArtifactServiceConstants.GAME_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,grantScoutProgressResultHandler);
			ro.grantScoutProgress(gameProgress);	
		 } 
		 
		 public function grantScoutProgressResultHandler(event:ResultEvent):void{
		 	var gameProgressResponse:GameProgressResponse=event.result as GameProgressResponse;
		 	trace(gameProgressResponse);
		 	trace(event.result);
		 	
		 	if(genericProgressResultHandler(event)){
		 		return;
		 	}
		 	
		 	var updatedSearchParty:CurrentSearchParty=gameProgressResponse.currentSearchParty;
		 	
		 	//updating current search party
		 	
		 	var percentObjtained:int=gameProgressResponse.percentObjtained;
		 	ArtifactUIController.currentSearch.experienceGained=percentObjtained;
		 	ArtifactUIController.currentSearch.currentState='report';
		 	
		 	artifactObtainedResultHandler(event);
		 	Artifact.artifactUIController.updateCurrentSearchParty(updatedSearchParty);
		 	ArtifactUIController.currentSearch.data=updatedSearchParty;
		 	ArtifactUIController.currentSearchParties=ObjectUtil.copy(ArtifactUIController.currentSearchParties) as Array;
		 	trace(gameProgressResponse.percentObjtained);
		 	trace('end');
		 }
		 
		 
		 public function grantBuyProgress(gameProgress:GameProgress):void{
		 	var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GAME_SERVICE;
			ro.source=ArtifactServiceConstants.GAME_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,grantBuyProgressResultHandler);
			ro.grantBuyProgress(gameProgress);	
		 }
		 
		 public function grantBuyProgressResultHandler(event:ResultEvent):void{
		 	if(!event.result){
		 		Alert.show('You dont have enough gold');
		 		return;
		 	}
		 	grantScoutProgressResultHandler(event);	
		 }
		 
		 public function grantShareProgress(gameProgress:GameProgress):void{
		 	var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GAME_SERVICE;
			ro.source=ArtifactServiceConstants.GAME_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,grantShareProgressResultHandler);
			ro.grantShareProgress(gameProgress);	
		 }
		 
		  public function grantShareProgressResultHandler(event:ResultEvent):void{
		  	if(!event.result){
		 		Alert.show('Minimum 10% is required for sharing');
		 		return;
		 	}
		  	grantScoutProgressResultHandler(event);	
		 }	
		 
		 /**
		 * 
		 * If sombody got this artifact then this function  take care of disabling the 
		 * current search party
		 **/
		 public function genericProgressResultHandler(event:ResultEvent):Boolean{
		 	var gameProgressResponse:GameProgressResponse=event.result as GameProgressResponse;
		 	if(gameProgressResponse.isSomebodyGetArtifact){
		 		Alert.show('Somebody already got the artifact');
		 		gameProgressResponse.currentSearchParty.artifact.isActive=false;
		 		//disable the item. assuming the item is cming as disabled	
		 		Artifact.artifactUIController.updateCurrentSearchParty(gameProgressResponse.currentSearchParty);
		 		ArtifactUIController.currentSearchParties=ObjectUtil.copy(ArtifactUIController.currentSearchParties) as Array;
		 		return true;
		 	}
		 	return false;
		 	
		 	
		 }
		 
		 /**
		 * If artifact is obtained we need to call this function 
		 * this function take care of adding the item into the inventory 
		 * and making the item inactive 
		 * 
		 **/
		 public function artifactObtainedResultHandler(event:ResultEvent):void{
		 	var gameProgressResponse:GameProgressResponse=event.result as GameProgressResponse;
		 	if(gameProgressResponse.isActifactObtained){
		 		//means u get the artifact hurray :)
		 		//change game profile
		 		ArtifactUIController.gameProfile=gameProgressResponse.updatedGameProfile;
		 		//add item into inventory
		 		ArtifactUIController.myArtifacts.push(gameProgressResponse.artifact);
		 		ArtifactUIController.myArtifacts=ObjectUtil.copy(ArtifactUIController.myArtifacts) as Array;
		 		//disable the current search party
		 		gameProgressResponse.currentSearchParty.artifact.isActive=false;
		 			
		 		//disable the back button if u can !! so that the user cannot go back he can only close the app
		 		ArtifactUIController.currentSearch.btnBack.visible=false;
		 		
		 	}
		 }
		 
		 /**
		 * 
		 * 
		 **/
		 public function addSkill(type:String):void{
		 	var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GET_PROFILE;
			ro.source=ArtifactServiceConstants.GET_PROFILE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,addSkillResultHandler);
			ro.addSkill(type);	
		 }
		 
		 public function addSkillResultHandler(event:ResultEvent):void{
		 	if(!event.result){
		 		Alert.show('You dont have enough skill points left');
		 		return;
		 	}
		 	var updatedGameProfile:GameProfile=event.result as GameProfile;
		 	ArtifactUIController.gameProfile=updatedGameProfile;	
		 }
		 
		 public function sellArtifact(artifactPrice:int,inventoryItem:Inventory):void{
			var ro:RemoteObject=new RemoteObject;
			ro.endpoint=ArtifactServiceConstants.SERVER_URL;
			ro.destination=ArtifactServiceConstants.GET_ARTIFACTS_SERVICE;
			ro.source=ArtifactServiceConstants.GET_ARTIFACTS_SERVICE;
			ro.addEventListener(FaultEvent.FAULT,myFaultHandler);
			ro.addEventListener(ResultEvent.RESULT,sellArtifactResultHandler);
			ro.showBusyCursor=true;
			Artifact.artifactUIController.removeItemFromInventoryUI(inventoryItem);
			ro.sellArtifact(artifactPrice,inventoryItem);
				
		 }
		 
		 public function sellArtifactResultHandler(event:ResultEvent):void{
		 	var updatedGameProfile:GameProfile=event.result as GameProfile;
		 	ArtifactUIController.gameProfile=updatedGameProfile;
		 	
		 }
		 

	}
}