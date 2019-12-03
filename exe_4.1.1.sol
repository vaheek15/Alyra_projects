pragma solidity ^0.5.11;

import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Credibilite {

   using SafeMath for uint256;

   mapping (address => uint256) public cred;
   bytes32[] private devoirs;
   mapping (bytes32 => bool) public remise;

   function produireHash(string memory url) public pure returns(bytes32){
       return keccak256(bytes(url));
   }

   function transfer(address destinataire, uint256 valeur) public{
       require(cred[msg.sender] > valeur, "Pas assez de creds);
       cred[msg.sender] = cred[msg.sender].sub(valeur);
       cred[destinataire] = cred[destinataire].add(valeur);
   }

   function remettre(bytes32 dev) public returns(uint){
       require(remise[dev] == false, "Devoir déja rendu!");
       devoirs.push(dev);
       remise[dev] = true;
       if (devoirs.length == 1){
           cred[msg.sender] = cred[msg.sender].add(30);
       } else if (devoirs.length == 2){
           cred[msg.sender] = cred[msg.sender].add(20);
       } else {
           cred[msg.sender] = cred[msg.sender].add(10);
       }
       return devoirs.length;
   }
}
