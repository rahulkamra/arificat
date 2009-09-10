<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GameUtil
 *
 * @author admin
 */
class GameUtil {
    //put your code here

    public function getGameProfile(User $user){
        $gameDAO=new GameDAO();
        return $gameDAO->getGameProfile($user);
    }

    public function giveRandomNumbers(){
        $questionIndex= array();
        for($count = 0 ;$count < 5 ; $count ++){
            while(true){
                $index=rand(2, 10);
                if(in_array($index, $questionIndex)){
                    continue;
                }else{
                    array_push($questionIndex, $index);
                    break;
                }
            }
        }
        return $questionIndex;
    }

    public function giveUniqueRandomOptions(){
            $optionIndex= array();
            for($count = 0 ;$count < 3 ; $count ++){
                while(true){
                    $index=rand(0,2);
                    if(in_array($index, $optionIndex)){
                        continue;
                    }else{
                        array_push($optionIndex, $index);
                        break;
                    }
                }
            }
            return $optionIndex;
    }
    

}
?>
