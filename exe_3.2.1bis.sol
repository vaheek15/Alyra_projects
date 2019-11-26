pragma solidity ^0.4.26;

contract CagnotteFestival {
  mapping (address => uint) organisateurs;
  mapping (address => bool) festivaliers;

  constructor() public {
  organisateurs[msg.sender] = 100;
  }

  function estOrga(address orga) public view returns (bool){
          if (organisateurs[orga] > 0 ){
            return true;
          } else {
            return false;
          }
  }

  function transfererOrga(address orga, uint parts) public {
      require(oraganisateurs[msg.sender] >= parts, "demander une part moins importante!");
      require(!estOrga(orga), "Vous n"'etes pas organisteur");
      require(orag != address(0));
      organisateurs[msg.sender] -= parts;
      organisateurs[orga] = parts;
  }

  function acheterTicket() public payable {
    require(msg.value>= 500 finney,"Place à 0.5 Ethers");
    require(placesRestantes>0,"Plus de places !");
    festivaliers[msg.sender]=true;
  }

  function payer(address payable destinataire, uint montant) public {
  require(estOrga(msg.sender));
  require(destinataire != address(0));
  require(montant > 0);
  destinataire.transfer(montant);
}

/* modualirty and heritage in Solidity 
contract Cogere {

 mapping (address => uint) organisateurs;

 constructor() internal {
   organisateurs[msg.sender] = 100;
 }

 function transfererOrga(address orga, uint parts) public {
 }

 function estOrga(address orga) public view returns (bool){
 }
}
*/




}
