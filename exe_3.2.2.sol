pragma solidity ^0.4.26;

contract CagnotteFestival {
  mapping (address => uint) organisateurs;
  mapping (address => bool) festivaliers;
  string[] private sponsors;
  uint constant LIMITE = 100;
  uint placesRestantes;

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
      require(organisateurs[msg.sender] >= parts, "demander une part moins importante!");
      require(!estOrga(orga), "Vous n"'etes pas organisteur");
      require(orga != address(0));
      organisateurs[msg.sender] -= parts;
      organisateurs[orga] = parts;
  }

  function acheterTicket() public payable {
    require(msg.value>= 500 finney,"Place à 0.5 Ethers");
    require(placesRestantes>0,"Plus de places !");
    festivaliers[msg.sender]=true;
  }
  function payer(address  destinataire, uint montant) payable public {
  require(estOrga(msg.sender));
  require(destinataire != address(0));
  require(montant > 0);
  destinataire.transfer(montant);
  }

  function comptabiliserDepense(uint montant) private{
        depensesTotales += montant;
    }

  function () external payable{
     }


  function sponsoriser(string memory nom) public payable {
        require(msg.sender != address(0));
        require(msg.value >= 30 ether && sposors.length <= LIMITE, "Minimum amount to be sponsor is 30 ETH and sponsors limit is reached");
        sponsors.push(nom);
  }








}
