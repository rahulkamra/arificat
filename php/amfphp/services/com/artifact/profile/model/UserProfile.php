<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UserProfile
 *
 * @author kaal
 */
class UserProfile {
    //put your code here

    public $id;
    public $age;
    public $politicalView;
    public $religion;
    public $language;
    public $humor;
    public $country;
    public $school;
    public $job;
    public $favgame;
    public $imgurl;

    private $user;

    public function getUser(){
        return $this->user;
    }

    public function setUser(User $user){
        $this->user=$user;
    }
}
?>
