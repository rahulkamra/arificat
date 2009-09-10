<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of GameProgress
 *
 * @author kaal
 */
class GameProgress {
    //put your code here


    //The operation related to Game Progress will b very frequent so making this class as Lazy Load
    public $id;
    
    public $friend;
    public $csp;
    public $progressType;
    public $_explicitType = "com.artifact.game.model.GameProgress";

 

    public function getProgressType(){
        return $this->progressType;
    }

    public function setProgressType(ProgressType $progressType){
        $this->progressType=$progressType;
    }

    
}
?>
