<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of InventoryUtil
 *
 * @author admin
 */
class InventoryUtil {
    //put your code here

    public function getInventory(User $user){
        $inventoryDao=new InventoryDAO();
        $inventoryList=$inventoryDao->getInventory($user);
        return $inventoryList;
    }
}
?>
