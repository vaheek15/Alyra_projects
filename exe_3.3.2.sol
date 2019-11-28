pragma solidity ^0.5.0;
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";
contract Pulsation {
  using SafeMath for uint
  uint public battement;
  string private message;

 constructor(string memory _Msg) public {
  uint battement = 0;
  string memory message = _Msg;
 }

  function ajouterBattement() {
    battement.add(1);
    return message;
  }

}
