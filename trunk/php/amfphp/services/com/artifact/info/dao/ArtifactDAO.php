<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ArtifactDAO
 *
 * @author kaal
 */
class ArtifactDAO {
    //put your code here

    //SELECT * FROM artifactinfo where id not in (select id from currentsearchparty where userid = 2)
    public function getArtifacts(User $user){
        $con = Connection::createConnection();
        $result = mysql_query("SELECT * FROM artifactinfo where id not in (select artifactid from currentsearchparty where userid = $user->id) AND isactive = 1");
        $artifactList=array();
        while($row = mysql_fetch_array($result)){
            if($row['isactive'] == 1){
                $artifact=new ArtifactInfo();
                $artifact->id=$row['id'];
                $artifact->name=$row['name'];
                $artifact->desc=$row['desc'];
                $artifact->isActive=1;
                array_push($artifactList, $artifact);
            }
        }
        Connection::closeConnection($con);
        return $artifactList;
    }

    public function makeArtifactInactive($artifact){
        $con = Connection::createConnection();
        $acrifactInactive=mysql_query("update artifactinfo set isactive = 0 where id = $artifact->id");
        mysql_query("commit");
        Connection::closeConnection($con);
        return;
    }

        
}
?>
