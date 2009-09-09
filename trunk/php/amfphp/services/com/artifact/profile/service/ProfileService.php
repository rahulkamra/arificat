<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProfileService
 *
 * @author kaal
 */

include_once("../../login/model/User.php");
include_once("../model/UserProfile.php");
include_once("../dao/UserProfileDAO.php");

include_once("../../friends/dao/FriendsDAO.php");
include_once("../../friends/util/FriendsUtil.php");

include_once("../../game/util/GameUtil.php");
include_once("../../game/model/GameProfile.php");
include_once("../../game/dao/GameDAO.php");

include_once("../../searchparty/dao/CurrentSearchPartyDAO.php");
include_once("../../searchparty/model/CurrentSearchParty.php");
include_once("../../searchparty/util/CurrentSearchPartyUtil.php");

include_once("../../info/model/ArtifactInfo.php");
include_once("..//model/CompleteProfileWrapper.php");
include_once("../../util/dbconnection/Connection.php");
include_once("../../util/properties/Database.php");


class ProfileService {
    //put your code here
    function ProfileService(){
        $this->methodTable = array(
        "getProfile" => array(
            "description" => "No description given.",
            "arguments" => array(),
            "access" => "remote"
            )
        );
    }

    public function getProfile(){
        $user=$_SESSION['loggedin_user'];
        $completeProfileWrapper=new CompleteProfileWrapper();
        
        $userProfileDAO=new UserProfileDAO();
        $userProfile=$userProfileDAO->getUserProfile($user);
        $completeProfileWrapper->setUserProfile($userProfile);
        $_SESSION['user_profile']=$userProfile;

        $friendUtil=new FriendsUtil();
        $friends=$friendUtil->getFriends($user);
        $completeProfileWrapper->friendsArray=$friends;

        $gameUtil=new GameUtil;
        $gameProfile=$gameUtil->getGameProfile($user);
        $completeProfileWrapper->setGameProfile($gameProfile);
        $_SESSION['game_profile']=$gameProfile;

        $currentSearchPartyUtil=new CurrentSearchPartyUtil();
        $currentSearchParties=$currentSearchPartyUtil->getCurrentSearchParty($user);
        $completeProfileWrapper->currentSearchPartiesArray=$currentSearchParties;
        
        return $completeProfileWrapper;
    }
}
?>
