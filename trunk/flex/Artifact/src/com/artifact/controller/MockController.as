package com.artifact.controller
{
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
		public function getFriendsList():void{
			var friendList:ArrayCollection=new ArrayCollection;
			var firstObj:Object=new Object;
			firstObj.imgSrc="";
			var secondObj:Object=new Object;
			secondObj.imgSrc=""
			var thirdObj:Object=new Object;
			thirdObj.imgSrc=""
			var fourthObj:Object=new Object;
			fourthObj.imgSrc=""
			var fifthObj:Object=new Object;
			fifthObj.imgSrc=""
			var sixthObj:Object=new Object;
			sixthObj.imgSrc=""
			friendList.addItem(firstObj);
			friendList.addItem(secondObj);
			friendList.addItem(thirdObj);
			friendList.addItem(fourthObj);
			friendList.addItem(fifthObj);
			friendList.addItem(sixthObj);
			
		}

	}
}