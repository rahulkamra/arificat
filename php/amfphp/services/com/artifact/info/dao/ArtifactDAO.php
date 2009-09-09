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

    public function getArtifacts(){
        $con = Connection::createConnection();
        $result = mysql_query("Select * from artifactinfo ");
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
        return $artifactList;
    }

        
}
?>
