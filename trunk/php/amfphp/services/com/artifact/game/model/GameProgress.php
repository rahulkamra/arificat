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

    public $id;
    
    private $friend;
    private $csp;
    private $progressType;

    public function getFriend(){
        return $this->friend;
    }

    public function setFriend(User $friend){
        $this->friend=$friend;
    }

    public function getCsp(){
        return $this->csp;
    }

    public function serCsp(CurrentSearchParty $csp){
        $this->csp=$csp;
    }

    public function getProgressType(){
        return $this->progressType;
    }

    public function setProgressType(ProgressType $progressType){
        $this->progressType=$progressType;
    }

    
}
?>
