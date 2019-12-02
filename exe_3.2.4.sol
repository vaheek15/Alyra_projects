pragma solidity ^0.5.0;
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract CagnotteFestival {
  using SafeMath for uint;
  mapping (address => uint) organisateurs; // Mapping des organisateurs et leurs parts
    string[] sponsors; // Liste des sponsors
    uint constant LIMITE = 100; // Limite des sponsors à ajouter
    uint dateFestival;
    uint dateLiquidation;
    uint constant seuilDepense = 100 ether; // Seuil dépense par jour
    mapping (uint => uint) depenses; // Jour => valeur
    uint partsTotal = 100;


  constructor(uint date) public {
   require(date >= block.timestamp, "La date renseignée est fausse !");
    organisateurs[msg.sender] = partsTotal;
    dateFestival = date;
    dateLiquidation = dateFestival +2 weeks;
  }

  function estOrga(address orga) public view returns (bool){
          require(orga != address(0));
         return (organisateurs[orga] > 0);
  }

  function transfererOrga(address orga, uint parts) public {
      require(orga != address(0));
      require(organisateurs[msg.sender] >= parts, "demander une part moins importante!");
      require(!estOrga(orga), "Vous n"'etes pas organisteur");
      organisateurs[msg.sender] = organisateurs[msg.sender].sub(parts);
      organisateurs[orga] = parts;
      //organisateurs.push(orga);
  }


  function jour(uint t) internal pure returns (uint) {
       // Indice du jour du moment t
       return SafeMath.div(t, 1 days);
   }

  function controleDepense(uint valeur) internal view returns (bool) {
    // vérifier la dépense du jour
    return SafeMath.add(depenses[jour(block.timestamp)], valeur) <= seuilDepense;
  }



  function sponsoriser(string memory nom) public payable {
        require(msg.sender != address(0));
        require(msg.value >= 30 ether && sponsors.length <= LIMITE, "Minimum amount to be sponsor is 30 ETH and sponsors limit is reached");
        sponsors.push(nom);
  }

  function retraitOrganisateurs() public{
    // vérifier que la date de liquidation est atteinte
    require(block.timestamp >= dateLiquidation, "La date de liquidation n'est pas dépassée !");
    // to avoid re-entrancy
    uint toTransfer = (address(this).balance).mul(organisateurs[msg.sender].div(partsTotal));
    // mettre à jour les parts
    partsTotal = partsTotal.sub(organisateurs[msg.sender]);
    assert(partsTotal <= 100);
    // supprimer l'organisateur
    delete organisateurs[msg.sender];
    // transferer le montant équivalent à ses parts au msg.sender
    msg.sender.transfer(toTransfer);
    // vérifier si y'a plus de parts, kill le contrat
    if (partsTotal == 0) {
      selfdestruct(msg.sender);
    }
  }


  function () external payable{
   }

  }
