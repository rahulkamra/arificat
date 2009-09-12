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
}
?>
