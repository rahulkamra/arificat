<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CurrentSearchPartyDAO
 *
 * @author admin
 */
class CurrentSearchPartyDAO {
    //put your code here


    public function addNewSearchParty(CurrentSearchParty $currentSearchParty){
        $con = Connection::createConnection();
        $user=$currentSearchParty->user;
        $artifact=$currentSearchParty->artifact;

        /* One person current start one party with one with artifact*/
        $selectRes=mysql_query("select * from currentsearchparty where userid = $user->id AND artifactid = $artifact->id");
        $tempArray=mysql_fetch_array($selectRes);
        if(mysql_num_rows($selectRes) == 1){
            Connection::closeConnection($con);
            return null;
        }else{
            $result = mysql_query("Insert into currentsearchparty values (NULL,$user->id,$artifact->id,$currentSearchParty->artifactLvl,$currentSearchParty->progress)");
            $currentSearchParty->id=mysql_insert_id();
            mysql_query("commit");
            Connection::closeConnection($con);
            
        }
        return $currentSearchParty;
    }



    /**
     *
     *
     *
     **/
    public function getCurrentSearchParty(User $user){
        $con = Connection::createConnection();
        $result=mysql_query("select currentsearchparty.*,artifact.id as artifact_id,artifact.name as name,artifact.desc as 'desc',artifact.isactive as isactive from currentsearchparty,artifactinfo as artifact where currentsearchparty.userid = $user->id AND currentsearchparty.artifactid=artifact.id");
        $currentSearchParties=array();
        while($row = mysql_fetch_array($result)){
            $currentSearchParty=new CurrentSearchParty();
            $artifactObj=new ArtifactInfo();
            $artifactObj->desc=$row['desc'];
            $artifactObj->name=$row['name'];
            $artifactObj->id=$row['artifact_id'];
            $artifactObj->isActive=$row['isactive'];
            $currentSearchParty->id=$row['id'];
            $currentSearchParty->artifactLvl=$row['artifactlvl'];
            $currentSearchParty->progress=$row['progress'];
            $currentSearchParty->setUser($user);
            $currentSearchParty->setArtifact($artifactObj);
            array_push($currentSearchParties, $currentSearchParty);
        }
        Connection::closeConnection($con);
        return $currentSearchParties;
    }


    /* Again assuming everybody is a frd of everybody */
    //select user.id as user_id,user.username as user_name,currentsearchparty.*,artifact.id as artifact_id,artifact.name as name,artifact.desc as 'desc',artifact.isactive as isactive from currentsearchparty,artifactinfo as artifact,user  where currentsearchparty.userid in (select user.id from user where user.id != 1 ) AND currentsearchparty.artifactid=artifact.id AND user.id=currentsearchparty.userid
    
    public function getFriendSearchParty(User $user){
        $con = Connection::createConnection();
        $result=mysql_query("select user.id as user_id,user.username as user_name,currentsearchparty.*,artifact.id as artifact_id,artifact.name as name,artifact.desc as 'desc',artifact.isactive as isactive from currentsearchparty,artifactinfo as artifact,user  where currentsearchparty.userid in (select user.id from user where user.id != $user->id ) AND currentsearchparty.artifactid=artifact.id AND user.id=currentsearchparty.userid");
        $friendtSearchParties=array();
        while($row = mysql_fetch_array($result)){
            $friendSearchParty=new CurrentSearchParty();

            $userObj=new User();
            $userObj->id=$row['user_id'];
            $userObj->username=$row['user_name'];

            $artifactObj=new ArtifactInfo();
            $artifactObj->desc=$row['desc'];
            $artifactObj->name=$row['name'];
            $artifactObj->id=$row['artifact_id'];
            $artifactObj->isActive=$row['isactive'];

            $friendSearchParty->id=$row['id'];
            $friendSearchParty->artifactLvl=$row['artifactlvl'];
            $friendSearchParty->progress=$row['progress'];
            
            $friendSearchParty->setUser($userObj);
            $friendSearchParty->setArtifact($artifactObj);
            
            array_push($friendtSearchParties, $friendSearchParty);
        }
        Connection::closeConnection($con);
        return $friendtSearchParties;

    }

}
?>