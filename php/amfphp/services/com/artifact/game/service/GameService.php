<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GameService
 *
 * @author kaal
 */
include_once("../dao/GameDAO.php");
include_once("../util/GameUtil.php");
include_once("../model/Questioniar.php");
include_once("../model/GameProgressResponse.php");
include_once("../model/ProgressType.php");
include_once("../../searchparty/util/CurrentSearchPartyUtil.php");
include_once("../../searchparty/dao/CurrentSearchPartyDAO.php");
include_once("../../searchparty/model/CurrentSearchParty.php");

include_once("../../util/properties/ServerConstants.php");

include_once("../../util/dbconnection/Connection.php");
include_once("../../util/properties/Database.php");

class GameService {
    //put your code here

    function GameService(){
        $this->methodTable = array(
            "getSpyQuestions" => array(
            "description" => "//put your code here",
            "access" => "remote"
            ),
            "grantSpyProgress" => array(
                "description" => "No description given.",
                "access" => "remote"
            )

        );

        
    }

    public function getSpyQuestions($gameProgress){
        $user=$_SESSION['loggedin_user'];

        settype($gameProgress,"object");
        settype($gameProgress->friend,"object");
        settype($gameProgress->csp,"object");
        settype($gameProgress->csp->user,"object");
        settype($gameProgress->csp->artifact,"object");
        settype($gameProgress->progressType,"object");
        settype($gameProgress->friend->user,"object");

        $classvar=get_class_vars("UserProfile");
        $class=new ReflectionClass("UserProfile");
        $properties=$class->getProperties();
        //unsetting explicit type , user,imgurl and id
        unset ($properties[0]);
        unset ($properties[1]);
        unset ($properties[11]);
        unset ($properties[12]);

        $gameUtil=new GameUtil();
        $randomIndex=$gameUtil->giveRandomNumbers();

        $gamedao=new GameDAO();
        $dataArray=$gamedao->getSpyQuestion($user, $gameProgress);

        //Cannot spy same person twice
        if($dataArray == null){
            return null;
        }

        $questioniar=array();
        for($count = 0 ;$count < 5 ; $count ++){//randomizing questions
            $question=new Questioniar();
            $tempProperty=$properties[$randomIndex[$count]]->name;
            $question->question=$tempProperty;
            $randomOptions=$gameUtil->giveUniqueRandomOptions();
            $question->optionOne=$dataArray[$randomOptions[0]]->$tempProperty;//accessing random data element and getting its
            $question->optionTwo=$dataArray[$randomOptions[1]]->$tempProperty;
            $question->optionThree=$dataArray[$randomOptions[2]]->$tempProperty;
            array_push($questioniar, $question);
        }
        
        return $questioniar;

    }

    public function grantSpyProgress($answers,$gameProgress){
         //$answers=array();
         $gameResponse=new GameProgressResponse();
         settype($answers,"array");
         settype($gameProgress,"object");
         settype($gameProgress,"object");
         settype($gameProgress->friend,"object");
         settype($gameProgress->csp,"object");
         settype($gameProgress->csp->user,"object");
         settype($gameProgress->csp->artifact,"object");
         settype($gameProgress->progressType,"object");
         settype($gameProgress->friend->user,"object");
         $currentUserProfile=$_SESSION['game_profile'];
         for($count = 0 ; $count < count($answers) ; $count++){
             settype($answers[$count],"object");
         }
         $gameDao=new GameDAO();

         $correntAnswers=$gameDao->checkAnswers($answers, $gameProgress);
         //cannot spy two persons at time same time
         if($correntAnswers == -1){
             return null;
         }if($correntAnswers == 0 ){
             //no need of update if corrent answers is zero
             $gameResponse->isSomebodyGetArtifact=false;
         }else{
             $progressObtained=($correntAnswers*5)*$currentUserProfile->spyLvl;
             $gameProgress->csp->progress +=$progressObtained;
             $currentSearchPartyUtil=new CurrentSearchPartyUtil;
             $updatedSearchParty=$currentSearchPartyUtil->updateCurrentSearchPartyProgress($gameProgress->csp);
              if($updatedSearchParty == null){
                  $gameResponse->isSomebodyGetArtifact=true;
              }
         }
         
         $gameResponse->currentSearchParty=$gameProgress->csp;
         $gameResponse->percentObjtained=$progressObtained;
             
        if($gameProgress->csp->progress >= 100 ){
              
             //add to inventory
             //chk for lvl up
             //cleanup the current search party
             //make item inactive
             
             $gameResponse->isActifactObtained=true;
         }
         
         return $gameResponse;

    }
}
?>