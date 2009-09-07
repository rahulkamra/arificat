<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CompleteProfileWrapper
 *
 * @author kaal
 */
class CompleteProfileWrapper {
    //put your code here

    public $friendsArray;         //Array of type user profile;
    private $userProfile;         //object of userprofile
    private $gameProfile;         //object of gameprofile
    public $currentSearchPartiesArray;           //array of current search parties
    public $friendSearchPartiesArray;            //array of current search parties
    public $myArtifacts;                         //array of artifactinfo


    public function getUserProfile(){
        return $this->userProfile;
    }
    public function setUserProfile(UserProfile $userProfile){
        $this->userProfile=$userProfile;
    }
    public function getGameProfile(){
        return $this->gameProfile;
    }
    public function setGameProfile(GameProfile $gameProfile){
        $this->gameProfile=$gameProfile;
    }
}
?>
