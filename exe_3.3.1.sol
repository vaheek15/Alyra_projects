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
