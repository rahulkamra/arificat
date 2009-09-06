<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Connection
 *
 * @author Savior
 */
class Connection {
    //put your code here
    public static function createConnection(){
        $con = mysql_connect(Database::server,Database::username,Database::password);
        if(!$con){
            NetDebug::trace('Could not connect');
            die ('could not connect'. mysql_error());
        }
        mysql_select_db(Database::databasename, $con);
        return $con;
    }

    public static function closeConnection($con){
        mysql_close($con);
    }

}
?>
