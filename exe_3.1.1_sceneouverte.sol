//Write your own contracts here. Currently compiles using solc v0.4.15+commit.bbb8e64f.
pragma solidity ^0.5.13;
contract sceneOuverte {

string[12] passagesArtistes;
uint creneauxLibres = 12;
uint tour;

function sInscrire(string memory nomDArtiste) public {
  if (creneauxLibres>0){
    passagesArtistes[12-creneauxLibres] = nomDArtiste;
    creneauxLibres--;
  }
}

function passerArtisteSuivant() public {
     if (tour < creneauxLibres) {
     tour += 1;
     }
}

function artisteEnCours() public view returns (string){

    if (tour < 12) {
        return passagesArtistes[tour];
    } else {
        return "FIN";
    }
 }


/* no need for this cause sol got getters and setters by default ??
function getTour() public view returns (uint) {
    return tour;
}
*/





 }

