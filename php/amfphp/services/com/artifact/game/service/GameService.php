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

    public function getSpyQuestions($friend,$currentSearchParty){
        $user=$_SESSION['loggedin_user'];
        
        settype($friend,"object");
        settype($currentSearchParty,"object");
        settype($friend->user,"object");
        
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
        $dataArray=$gamedao->getSpyQuestion($user, $friend, $currentSearchParty);

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

    public function grantSpyProgress($answers){
         settype($answers,"object");

    }
}
?>
