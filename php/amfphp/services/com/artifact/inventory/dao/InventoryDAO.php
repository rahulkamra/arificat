<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of InventoryDAO
 *
 * @author admin
 */
class InventoryDAO {
    //put your code here

    //For now getting every thing will change the logic later
    //SELECT inventory.id AS inventory_id, inventory.artifactlevel AS inventory_artifactlevel, inventory.artifactid AS inventory_artifactid, inventory.userid AS inventory_userid, user.id AS user_id, user.username AS user_username, artifact.* FROM inventory, user, artifactinfo AS artifact WHERE inventory.userid = user.id AND inventory.artifactid = artifact.id AND inventory.userid =1
    public function getInventory(User $user){
        $con = Connection::createConnection();
        $result = mysql_query("SELECT inventory.id AS inventory_id, inventory.artifactlevel AS inventory_artifactlevel, inventory.artifactid AS inventory_artifactid, inventory.userid AS inventory_userid, user.id AS user_id, user.username AS user_username, artifact.* FROM inventory, user, artifactinfo AS artifact WHERE inventory.userid = user.id AND inventory.artifactid = artifact.id AND inventory.userid =$user->id");
        $myinventory=array();
        while($row = mysql_fetch_array($result)){
            $inventoryObj=new Inventory();
            $artifact=new ArtifactInfo();
            $user=new User();

            $inventoryObj->artifactLvl=$row['inventory_artifactlevel'];
            $inventoryObj->id=$row['inventory_id'];

            $user->id=$row['user_id'];
            $user->username=$row['user_username'];

            $artifact->desc=$row['desc'];
            $artifact->id=$row['id'];
            $artifact->name=$row['name'];
            $artifact->isActive=$row['isactive'];

            $inventoryObj->setUser($user);
            $inventoryObj->setArtifact($artifact);
            
            array_push($myinventory, $inventoryObj);
        }
        Connection::closeConnection($con);
        return $myinventory;
    }
}
?>
