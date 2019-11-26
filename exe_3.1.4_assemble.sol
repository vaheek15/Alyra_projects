pragma solidity ^0.4.26;

contract Assemblee {
    address[] membres;
    string[] descriptionDecisions;
    uint nomAssemblee[];
    address[] admins;

    struct Decision {
      string description;
      uint votePour;
      uint voteContre;
      mapping (address => bool) aVote;
    }
    Decision[] public decisions;

    constructor(string nom) {
      nomAssemblee = nom;
      admins.push(nomAssemblee);

    }

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
        require(estMembre(msg.sender), "Il faut être membre");
        Decision memory nouvelleDecision = Decision(description,0,0);
        decisions.push(nouvelleDecision);
    }

    function voter(uint indice, bool value) public {
      // Vérifier si l'indice indiqué est correcte
       require(indice < decisions.length && indice >= 0, "Vérifiez lindice indiqué!");
        require(estMembre(msg.sender), "Il faut être membre");
        require(decisions[indice].aVote[msg.sender] != true," Vous avez voté pour cette decision!");

        if(value == true){
            decisions[indice].votesPour++;
        } else if(value == false){
            decisions[indice].votesContre++;
        }
        decisions[indice].aVote[msg.sender] = true;
    }

    function comptabiliser(uint indice) public view returns (int){
        return int(decisions[indice].votesPour - decisions[indice].votesContre);
    }
}[
