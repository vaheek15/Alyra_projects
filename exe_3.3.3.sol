pragma solidity ^0.5.0;
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Pulsation {
  uint public battement;
 constructor() public {
  uint battement = 0;
 }

 function ajouterBattement() {
    battement.add(1);
  }
}


contract Pendule {

 string[] public balancier;
 Pulsation tac;
 Pulsation tic;
 bool public ping;


 function ajouterTacTic(Pulsation _tic, Pulsation _tac)public{
   tic = _tic;
   tac = _tac;
 }

 function mouvementsBalancier() public {
    if(ping = true) {
    balancier.push(tic.ajouterBattement());
    ping = false;
  } else if (ping = false) {
    balancier.push(tac.ajouterBattement());
    ping = true;
 }
}

}
