<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GameDAO
 *
 * @author admin
 */
class GameDAO {
    //put your code here
    public function getGameProfile(User $user){
        $con = Connection::createConnection();
        $result = mysql_query("Select * From gameprofile Where userid=$user->id");
        $tempArray=mysql_fetch_array($result);
        if(mysql_num_rows($result) == 1){
            $gameProfile=new GameProfile;
            $gameProfile->id=$tempArray['id'];
            $gameProfile->user=$user;
            $gameProfile->buyLvl=$tempArray['buylvl'];
            $gameProfile->exp=$tempArray['exp'];
            $gameProfile->globalLvl=$tempArray['globallvl'];
            $gameProfile->gold=$tempArray['gold'];
            $gameProfile->scoutLvl=$tempArray['scoutlvl'];
            $gameProfile->shareLvl=$tempArray['sharelvl'];
            $gameProfile->spyLvl=$tempArray['spylvl'];
        }
        Connection::closeConnection($con);
        return $gameProfile;
    }
}
?>
