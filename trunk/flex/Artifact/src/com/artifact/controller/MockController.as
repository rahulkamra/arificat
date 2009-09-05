package com.artifact.controller
{
	import com.artifact.model.CurrentSearchPartiesModel;
	
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

	}
}