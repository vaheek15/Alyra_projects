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
 Pulsation tac;
 Pulsation tic;


 function ajouterTacTic(Pulsation _tic, Pulsation _tac) public{
   tic = _tic;
   tac = _tac;
 }

 function mouvementsBalancier() public {
    balancier.push(tic.ajouterBattement());
    balancier.push(tac.ajouterBattement());
  }
}
