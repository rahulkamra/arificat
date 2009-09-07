<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ArtifactService
 *
 * @author kaal
 */
include_once("../../util/dbconnection/Connection.php");
include_once("../../util/properties/Database.php");
include_once("../dao/ArtifactDAO.php");
include_once("../model/ArtifactInfo.php");
class ArtifactService {
    //put your code here

    function ArtifactService(){
        $this->methodTable = array(
            "getActiveArtifacts" => array(
            "description" => "Get Artifacts",
            "access" => "remote"
            )
        );
    }

    public function getActiveArtifacts(){
        $artifactDAO=new ArtifactDAO();
        $artifactList=$artifactDAO->getArtifacts();
        return $artifactList;
    }
}
?>
