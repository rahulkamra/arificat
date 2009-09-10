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

    //select * from userprofile where userprofile.userid !=2 order by rand() limit 2
    //select * from gameprogress where cspid=1 AND friendid =1 AND progresstypeid=(select id from progresstype where progresstype ="SPY")
    public function getSpyQuestion($user,$friend,$currentSearchParty){
        $con = Connection::createConnection();
        //first we need to check weather that person has spied him already or not
        $spy=ServerConstants::SPY;
        $friendUser=$friend->user;
        $chkResult = mysql_query("select * from gameprogress where cspid=$currentSearchParty->id AND friendid =$friendUser->id AND progresstypeid=(select id from progresstype where progresstype ='Spy')");
        
        if(mysql_num_rows($chkResult) == 1){
            Connection::closeConnection($con);
            return null;
        }else{
            $result=mysql_query("select * from userprofile where userprofile.userid !=$friendUser->id order by rand() limit 2");
            $dataArray=array();
            while($row = mysql_fetch_array($result)){
                $userprofile=new UserProfile;
                $userprofile->id=$row['id'];
                $userprofile->setUser($user);
                $userprofile->age=$row['age'];
                $userprofile->country=$row['country'];
                $userprofile->favgame=$row['favgame'];
                $userprofile->humour=$row['humour'];
                $userprofile->imgurl=$row['imgurl'];
                $userprofile->job=$row['job'];
                $userprofile->language=$row['language'];
                $userprofile->politicalView=$row['politicalview'];
                $userprofile->religion=$row['religion'];
                $userprofile->school=$row['school'];
                array_push($dataArray, $userprofile);
            }
        }
        Connection::closeConnection($con);
        array_push($dataArray, $friend);//This is the right option
        return $dataArray;
    }
}
?>
