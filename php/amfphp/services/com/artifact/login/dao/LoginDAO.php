<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of LoginDAO
 *
 * @author Savior
 */
class LoginDAO {
    //put your code here

    public function isUsernameAvailable($username){
        $con = Connection::createConnection();
        $result = mysql_query("Select * From user Where username = '$username'");
        $loginid = -1;

        $tempArray=mysql_fetch_array($result);
        if(mysql_num_rows($result) == 1){
            $loginid = $tempArray['id'];
        }

       
        Connection::closeConnection($con);

        return $loginid;

    }
}
?>
