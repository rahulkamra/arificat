<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Inventory
 *
 * @author kaal
 */
class Inventory {
    //put your code here
    public $id;
    public $artifactLvl;

    private $user;
    private $artifact;

     public function getUser(){
        return $this->user;
    }

    public function setUser(User $user){
        $this->user=$user;
    }

     public function getArtifact(){
        return $this->artifact;
    }

    public function setArtifact(ArtifactInfo $artifact){
        $this->artifact=$artifact;
    }
    
}
?>
