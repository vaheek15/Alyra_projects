pragma solidity ^0.5.12;

import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Credibilite {

   using SafeMath for uint256;

   bytes32[] private devoirs;
   mapping (address => uint256) public cred; // balances de cred que déspose une address
   mapping (bytes32 => bool) public hashs; // liste des hashs remis

   event Remise(bytes32 devoir, address envoyeur);

   function produireHash(string memory url) public pure returns(bytes32){
       return keccak256(bytes(url));
   }

   function transfer(address destinataire, uint256 valeur) public{
       require(cred[msg.sender] > valeur, "Pas assez de creds");
       // require pour vérifier que le destinataire a bien des creds
       require(cred[destinataire] > 0);

       cred[msg.sender] = cred[msg.sender].sub(valeur);
       cred[destinataire] = cred[destinataire].add(valeur);
   }

   function remettre(bytes32 dev) public returns(uint){
       require(!hashs[dev] == false, "Devoir déja rendu!");
       devoirs.push(dev);
       hashs[dev] = true;

       if (devoirs.length == 1){
           cred[msg.sender] = cred[msg.sender].add(30);
       } else if (devoirs.length == 2){
           cred[msg.sender] = cred[msg.sender].add(20);
       } else {
           cred[msg.sender] = cred[msg.sender].add(10);
       }
       emit Remise(dev, msg.sender);
       return devoirs.length;
   }
}
