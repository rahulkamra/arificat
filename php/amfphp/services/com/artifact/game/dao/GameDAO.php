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
    public function getSpyQuestion($user,$gameProgress){
        $con = Connection::createConnection();
        //first we need to check weather that person has spied him already or not
        $spy=ServerConstants::SPY;
        $chkResult = mysql_query("select * from gameprogress where cspid=$gameProgress->csp AND friendid =$gameProgress->friend AND progresstypeid=(select id from progresstype where progresstype ='$spy')");
        
        if(mysql_num_rows($chkResult) == 1){
            Connection::closeConnection($con);
            return null;
        }else{
            $result=mysql_query("select * from userprofile where userprofile.userid !=$gameProgress->friend order by rand() limit 2");
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
                $userprofile->politicalview=$row['politicalview'];
                $userprofile->religion=$row['religion'];
                $userprofile->school=$row['school'];
                array_push($dataArray, $userprofile);
            }
            /* Getting data of friend whom we want to spy i.e. the right options */
            $friendData=mysql_query("select * from userprofile where userid = $gameProgress->friend");
            while($row = mysql_fetch_array($friendData)){
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
                $userprofile->politicalview=$row['politicalview'];
                $userprofile->religion=$row['religion'];
                $userprofile->school=$row['school'];
                array_push($dataArray, $userprofile);
            }
        }
        
        Connection::closeConnection($con);
        return $dataArray;
    }

    public function checkAnswers($answers,$gameProgress){
        $correctAnswers=0;
        $con = Connection::createConnection();
        for($count = 0 ; $count < count($answers) ; $count++){
            $eachAnswer=$answers[$count];
            if($eachAnswer->answer == null){
                continue;
            }

            $chkResult = mysql_query("select * from userprofile where userid = $gameProgress->friend AND $eachAnswer->question =  '$eachAnswer->answer' ");

            if($chkResult == false){
                 return mysql_error();
            }
             if(mysql_num_rows($chkResult) == 1){
                 $correctAnswers++;
             }
        }
        //save it in game progress so that person will not b able to spy again
        $spy=ServerConstants::SPY;
        $spyProgress=mysql_query("select * from progresstype where progresstype = '$spy' ");
         while($row = mysql_fetch_array($spyProgress)){
             $progressType=new ProgressType();
             $progressType->id=$row['id'];
             $progressType->progressType=$row['progresstype'];
         }
        Connection::closeConnection($con);
        return $correctAnswers;
        
    }

    /*
     * Expects a complete game progress object with progressType as another object of ProgressType class
     *
     */
    public function addGameProgress(GameProgress $gameProgress){
        $progressType=$gameProgress->progressType;
        $result = mysql_query("Insert into gameprogress values (NULL,$gameProgress->csp,$gameProgress->friend,$gameProgress->progressType->id)");
        $gameProgress->id=mysql_insert_id();
        return $gameProgress;
    }
}
?>
