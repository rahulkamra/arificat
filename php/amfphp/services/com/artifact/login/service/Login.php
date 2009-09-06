<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Login
 *
 * @author Savior
 */
include_once("../dao/LoginDAO.php");
include_once("../../util/dbconnection/Connection.php");
include_once("../../util/properties/Database.php");

class Login {
    //put your code here
    function Login(){
        $this->methodTable = array(
            "doLogin" => array(
            "description" => "//put your code here",
            "access" => "remote"
            )
        );
    }
    public function doLogin($username){
        $logindao = new LoginDAO();

        return $logindao->isUsernameAvailable($username);
    }
}

?>
