<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SearchPartyService
 *
 * @author kaal
 */
class SearchPartyService {
    //put your code here

    function SearchPartyService(){
        $this->methodTable = array(
            "getActiveArtifacts" => array(
            "description" => "Get Artifacts",
            "access" => "remote"
            )
        );
    }

    public function startSearchParty($artifactObj){
        
        $user=$_SESSION['loggedin_user'];

        /* Converting flex object into php */
        $artifact=new ArtifactInfo;
        $artifact->desc=$artifactObj['desc'];
        $artifact->id=$artifactObj['id'];
        $artifact->name=$artifactObj['name'];
        $artifact->isActive=$artifact['isActive'];

        $currentSearchParty=new CurrentSearchParty();
        //$currentSearchParty->

    }
}
?>
