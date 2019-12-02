pragma solidity ^0.5.0;
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract CagnotteFestival {
  using SafeMath for uint;
  address[] private organisateurs;
  string[] private sponsors;
  uint public placesRestantes = 100000;
  uint private _depensesTotales;
  uint private _depenseLimite = 20000;
  uint public dateFestival;
  uint _dateLiquidation = dateFestival + 2 weeks;

  mapping (address => uint) private pourcentage;
  mapping (address => bool) private festivaliers;
  mapping (uint => uint) private depensesJour;

  constructor() public {
    pourcentage[msg.sender] = 100;
    organisateur.push(msg.sender)
    dateFestival = block.timestamp;
  }

  function estOrga(address orga) public view returns (bool){
          require(orga != address(0));
          if (pourcentage[orga] > 0 ){
            return true;
          } else {
            return false;
          }
  }

  function transfererOrga(address orga, uint parts) public {
      require(orga != address(0));
      require(pourcentage[msg.sender] >= parts, "demander une part moins importante!");
      require(!estOrga(orga), "Vous n"'etes pas organisteur");
      pourcentage[msg.sender] = pourcentage[msg.sender].sub(parts);
      pourcentage[orga] = parts;
      organisateurs.push(orga);
  }

  function acheterTicket() public payable {
    require(msg.value>= 500 finney,"Place à 0.5 Ethers");
    require(placesRestantes>0,"Plus de places !");
    festivaliers[msg.sender]=true;
    placesRestantes = placesRestantes.sub(1);
  }


  function payer(address  destinataire, uint montant) payable public {
    require(destinatire != address(0));
    require(estOrga(msg.sender));
    require(destinataire != address(0));
    require(montant > 0);
    require(address(this).balance >= montant, "Fonds insufissante");
    require(_comptabiliserDepense(montant), "Limite journalière atteinte");
    if (((block.timestamp)/ 1 days) == depensesJour[0]){
      depensesJour[0] = ((block.timestamp)/ 1 days);
    }
    depensesJour[(block.timestamp)/ 1 days] = depensesJour[(block.timestamp)/ 1 days].add(montant);
    _depensesTotales = _depensesTotales.add(montant);
    destinataire.transfer(montant);
  }

  function _comptabiliserDepense(uint montant) private view returns (bool){
        if (depensesJour[(block.timestamp)/ 1 days].add(montant) > _depenseLimite){
              return false;
      } else {
              return true;
          }
  }

  function voirDepensesTotales() public view returns (uint){
        require(estOrga(msg.sender), "Vous n'êtes pas organisateur");
        return _depensesTotales;
  }

  function sponsoriser(string memory nom) public payable {
        require(msg.sender != address(0));
        require(msg.value >= 30 ether && sposors.length <= LIMITE, "Minimum amount to be sponsor is 30 ETH and sponsors limit is reached");
        sponsors.push(nom);
  }

  function retraitOrganisateurs(){
     require(block.timestamp >= dateLiquidation);
     if (organisateurs.length == 1) {
        selfdestruct(msg.sender);
     } else {
       msg.sender.transfer(address(this).balance/pourcentage[msg.sender]);
     }

     for (uint i = 0; i < organisateurs.length; i++) {
       if(organisateurs[i] == msg.sender) {
          delete organisateurs[i];
          }
     }

  }


  function () external payable{
   }



  }
