<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProfileService
 *
 * @author kaal
 */
class ProfileService {
    //put your code here
    function ProfileService(){
        $this->methodTable = array(
        "getProfile" => array(
            "description" => "No description given.",
            "arguments" => array(),
            "access" => "remote"
            )
        );
    }

    public function getProfile(){
        $user=$_SESSION['loggedin_user'];
        $userId=$user->id;
        NetDebug::printr($user);
        return $userId;
    }
}
?>
