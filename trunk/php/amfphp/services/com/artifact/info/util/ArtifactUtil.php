<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ArtifactUtil
 *
 * @author admin
 */
class ArtifactUtil {
    //put your code here

    public function makeArtifactInactive($artifact){
        $artifactDAO=new ArtifactDAO();
        $artifactDAO->makeArtifactInactive($artifact);
        return;
    }

    public function isArtifactActive($artifact){
        $artifactDAO=new ArtifactDAO();
        return $artifactDAO->isArtifactActive($artifact);
    }
}
?>
