package com.artifact.controller
{
	import com.artifact.model.AddSkillModel;
	import com.artifact.model.ArtifactModel;
	import com.artifact.model.CurrentSearchPartiesModel;
	import com.artifact.model.FriendSearchPartiesModel;
	import com.artifact.model.QuestionModel;
	import com.artifact.model.SearchModel;
	
	import mx.collections.ArrayCollection;
	
	public class MockController
	{
		public function MockController()
		{
		}
		
		/**
		 * This class is used to mock the data when the backend is not present
		 * 
		 * 
		 **/ 
		public static function getFriendsList():ArrayCollection{
			var friendList:ArrayCollection=new ArrayCollection;
			var firstObj:Object=new Object;
			firstObj.imgSrc="com/artifact/resources/images/avatar/Albert-Einstein.jpg";
			var secondObj:Object=new Object;
			secondObj.imgSrc="com/artifact/resources/images/avatar/Angry-PC-User.gif"
			var thirdObj:Object=new Object;
			thirdObj.imgSrc="com/artifact/resources/images/avatar/Badass-Cat.jpg"
			var fourthObj:Object=new Object;
			fourthObj.imgSrc="com/artifact/resources/images/avatar/cathelmet.jpg"
			var fifthObj:Object=new Object;
			fifthObj.imgSrc="com/artifact/resources/images/avatar/ba-na-na.gif"
			var sixthObj:Object=new Object;
			sixthObj.imgSrc="com/artifact/resources/images/avatar/disappointed000.gif"
			friendList.addItem(firstObj);
			friendList.addItem(secondObj);
			friendList.addItem(thirdObj);
			friendList.addItem(fourthObj);
			friendList.addItem(fifthObj);
			friendList.addItem(sixthObj);
			
			return friendList;
		}
		
		public static function createCurrSearchPartyObj():ArrayCollection{
			var currSearchParty1:CurrentSearchPartiesModel = new CurrentSearchPartiesModel();
			currSearchParty1.artifactLvl = 4;
			currSearchParty1.artifactName = 'Haammer of Zeus';
			currSearchParty1.partyProgress = 23;
			
			var currSearchParty2:CurrentSearchPartiesModel = new CurrentSearchPartiesModel();
			currSearchParty2.artifactLvl = 2;
			currSearchParty2.artifactName = 'Butterfly';
			currSearchParty2.partyProgress = 0;
			
			var currSearchParty3:CurrentSearchPartiesModel = new CurrentSearchPartiesModel();
			currSearchParty3.artifactLvl = 5;
			currSearchParty3.artifactName = 'Lothars Edge';
			currSearchParty3.partyProgress = 50;
			
			var currSearchParty4:CurrentSearchPartiesModel = new CurrentSearchPartiesModel();
			currSearchParty4.artifactLvl = 2;
			currSearchParty4.artifactName = 'Arcane Ring';
			currSearchParty4.partyProgress = 56;
			
			var currSearchParty5:CurrentSearchPartiesModel = new CurrentSearchPartiesModel();
			currSearchParty5.artifactLvl = 9;
			currSearchParty5.artifactName = 'Heart';
			currSearchParty5.partyProgress = 100;
			
			var arraycollCurrSearchParty:ArrayCollection = new ArrayCollection([currSearchParty1,currSearchParty2,currSearchParty3,currSearchParty4,currSearchParty5]);
			
			return arraycollCurrSearchParty;
			
		
		}
		
		public static function createFriendSearchPartyObj():ArrayCollection{
			var currSearchParty1:FriendSearchPartiesModel = new FriendSearchPartiesModel();
			currSearchParty1.artifactLvl = 4;
			currSearchParty1.artifactName = 'Haammer of Zeus';
			currSearchParty1.partyProgress = 23;
			currSearchParty1.friendName="John"
			
			var currSearchParty2:FriendSearchPartiesModel = new FriendSearchPartiesModel();
			currSearchParty2.artifactLvl = 2;
			currSearchParty2.artifactName = 'Butterfly';
			currSearchParty2.partyProgress = 0;
			currSearchParty2.friendName="Ram"
			
			var currSearchParty3:FriendSearchPartiesModel = new FriendSearchPartiesModel();
			currSearchParty3.artifactLvl = 5;
			currSearchParty3.artifactName = 'Lothars Edge';
			currSearchParty3.partyProgress = 50;
			currSearchParty3.friendName="Rahul"
			
			var currSearchParty4:FriendSearchPartiesModel = new FriendSearchPartiesModel();
			currSearchParty4.artifactLvl = 2;
			currSearchParty4.artifactName = 'Arcane Ring';
			currSearchParty4.partyProgress = 56;
			currSearchParty4.friendName="Vikas"
			
			var currSearchParty5:FriendSearchPartiesModel = new FriendSearchPartiesModel();
			currSearchParty5.artifactLvl = 9;
			currSearchParty5.artifactName = 'Heart';
			currSearchParty5.partyProgress = 100;
			currSearchParty5.friendName="Sophia"
			
			var arraycollCurrSearchParty:ArrayCollection = new ArrayCollection([currSearchParty1,currSearchParty2,currSearchParty3,currSearchParty4,currSearchParty5]);
			
			return arraycollCurrSearchParty;
			
		
		}
		
		public static function giveDummyArtifacts():ArrayCollection{
			var tempArtifact:ArtifactModel=new ArtifactModel;
			tempArtifact.artifactLevel=12;
			tempArtifact.artifactName="Arcane Ring";
			
			var tempArtifact1:ArtifactModel=new ArtifactModel;
			tempArtifact1.artifactLevel=15;
			tempArtifact1.artifactName="Heart of tarassaq"
			
			var tempArtifact2:ArtifactModel=new ArtifactModel;
			tempArtifact2.artifactLevel=19;
			tempArtifact2.artifactName="Klen's Dagger of Escape"
			
			return new ArrayCollection([tempArtifact,tempArtifact1,tempArtifact2]);
		}
		
		public static 	function giveDummySkillData():AddSkillModel{
			var skillData:AddSkillModel=new AddSkillModel;
			
			skillData.buyLevel=2;
			skillData.spyLevel=4;
			skillData.currentLevel=21;
			skillData.shareLevel=2;
			skillData.experiencePointsAvailable=0;
			skillData.scoutLevel=4;
			
			return skillData;
		}
		
		public static function giveSearchData():SearchModel{
			var searchModel:SearchModel=new SearchModel;
			searchModel.friendsNumber=10;
			searchModel.artifactDesc="Its a description ok ok its a desc"
			searchModel.progress=70;
			searchModel.artifactLvl=12;
			searchModel.artifactName="Doondha"
			return searchModel;
		}
		
		public static function giveQuestions():ArrayCollection{
			var question1:QuestionModel=new QuestionModel;
			var question2:QuestionModel=new QuestionModel;
			var question3:QuestionModel=new QuestionModel;
			var question4:QuestionModel=new QuestionModel;
			var question5:QuestionModel=new QuestionModel;
			question1.question="Who lets the dog out !!"
			question1.optionOne="Whoo";
			question1.optionTwo="Whoo Whoo";
			question1.optionThree="Whoo Whoo Whoo";
			
			question2.question="Who lets the dog out !!"
			question2.optionOne="Whoo";
			question2.optionTwo="Whoo Whoo";
			question2.optionThree="Whoo Whoo Whoo";
			
			question3.question="Who lets the dog out !!"
			question3.optionOne="Whoo";
			question3.optionTwo="Whoo Whoo";
			question3.optionThree="Whoo Whoo Whoo";
			
			question4.question="Who lets the dog out !!"
			question4.optionOne="Whoo";
			question4.optionTwo="Whoo Whoo";
			question4.optionThree="Whoo Whoo Whoo";
			
			question5.question="Who lets the dog out !!"
			question5.optionOne="Whoo";
			question5.optionTwo="Whoo Whoo";
			question5.optionThree="Whoo Whoo Whoo";

			return new ArrayCollection([question1,question2,question3,question4,question5]);
		}

	}
}