pragma solidity ^0.5.0;

contract Pulsation {
  uint public battement;
  string private message;

 constructor(string memory _message) public {
   battement = 0;
   message = _message;
  }

 function ajouterBattement() public returns(string memory) {
    battement++;
    return  message;
    }
  }


contract Pendule {

 string[] public balancier;
 Pulsation tic = new Pulsation("tic");
 Pulsation tac = new Pulsation("tac");


 function mouvementsBalancier(uint k) public {
    for (uint i =0; i <= k; i++) {
    balancier.push(tic.ajouterBattement());
    balancier.push(tac.ajouterBattement());
  }
}
}
