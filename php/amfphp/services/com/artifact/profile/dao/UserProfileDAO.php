<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UserProfileDAO
 *
 * @author admin
 */
class UserProfileDAO {
    //put your code here

    public function getUserProfile(User $user){
        $con = Connection::createConnection();
        $result = mysql_query("Select * From userprofile Where userid=$user->id");
        $tempArray=mysql_fetch_array($result);
        if(mysql_num_rows($result) == 1){
            $userprofile=new UserProfile;
            $userprofile->id=$tempArray['id'];
            $userprofile->setUser($user);
            $userprofile->age=$tempArray['age'];
            $userprofile->country=$tempArray['country'];
            $userprofile->favgame=$tempArray['favgame'];
            $userprofile->humour=$tempArray['humour'];
            $userprofile->imgurl=$tempArray['imgurl'];
            $userprofile->job=$tempArray['job'];
            $userprofile->language=$tempArray['language'];
            $userprofile->politicalview=$tempArray['politicalview'];
            $userprofile->religion=$tempArray['religion'];
            $userprofile->school=$tempArray['school'];
        }
        Connection::closeConnection($con);
        return $userprofile;
    }
    //SELECT globallevel from experience where exp > 2000 limit 1
    public function giveExperience($gameProfile,$expPoints){
        $con = Connection::createConnection();
        $user=$gameProfile->user;
        $update = mysql_query("update gameprofile set exp = $expPoints where userid = $user->id");
        $gameProfile->exp=$expPoints;
        
        $chkForLvlUp=mysql_query("SELECT globallevel from experience where exp > $expPoints limit 1");//limit is one so only one row is obtained
         while($row = mysql_fetch_array($chkForLvlUp)){
            $globalLevel=$row['globallevel'];
            break;
         }

         $globalLevel=$globalLevel-1;
         if($globalLevel != $gameProfile->globalLvl){
             //level is up update the game profile
             $updateProfile=mysql_query("update gameprofile set globallvl = $globalLevel where userid = $user->id");
             $gameProfile->globalLvl=$globalLevel;
         }
         
         mysql_query("commit");

        Connection::closeConnection($con);
        return $gameProfile;
        
    }
}
?>
