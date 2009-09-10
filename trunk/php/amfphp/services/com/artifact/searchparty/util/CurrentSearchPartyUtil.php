<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CurrentSearchPartyUtil
 *
 * @author kaal
 */
class CurrentSearchPartyUtil {
    //put your code here
    public function getCurrentSearchParty(User $user){
        $currentSearchPartyDAO=new CurrentSearchPartyDAO;
        $currentSearchParties=$currentSearchPartyDAO->getCurrentSearchParty($user);
        return $currentSearchParties;
    }

    public function getFriendSearchParty(User $user){
        $currentSearchPartyDAO=new CurrentSearchPartyDAO;
        $friendSearchParties=$currentSearchPartyDAO->getFriendSearchParty($user);
        return $friendSearchParties;
    }
}
?>
