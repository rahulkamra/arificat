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
}
?>
