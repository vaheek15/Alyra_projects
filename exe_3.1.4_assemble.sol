pragma solidity ^0.4.26;

contract Assemblee {
    address[] membres;
    string[] descriptionDecisions;
    uint[] votesPour;
    uint[] votesContre;

    function rejoindre() public {
        membres.push(msg.sender);
    }

    function estMembre(address utilisateur) public view returns (bool) {
        bool there;
        for (uint i = 0; i < membres.length; i++){
            if (membres[i] == utilisateur){
                there = true;
            } else {
                there = false;
            }
        }
        return there;
    }

    function proposerDecision(string memory description) public {
        require (estMembre(msg.sender), "Il faut être membre");
        descriptionDecisions.push(description);
        votesPour.push(0);
        votesContre.push(0);
    }

    function voter(uint indice, bool value) public {
        require (estMembre(msg.sender), "Il faut être membre");
        require (descriptionDecisions.length >= indice + 1, "La décision n'existe pas");
        if(value == true){
            votesPour[indice] += 1;
        } else if(value == false){
            votesContre[indice] += 1;
        }
    }

    function comptabiliser(uint indice) public view returns (int){
        require (descriptionDecisions.length >= indice + 1, "La décision n'existe pas");
        int resultat;
        resultat = int(votesPour[indice] - votesContre[indice]);
        return resultat;
    }
}[