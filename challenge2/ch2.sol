
pragma solidity 0.5.0;
pragma experimental ABIEncoderV2;
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/math/SafeMath.sol";

contract marcheIllustrateur {

   using SafeMath for uint;

   struct Demandes {
    uint remuneration;
    uint delais; //en seconds
    string description;
    EtatDemande etat;
    uint reputationMin;
    uint debut;
    uint finPrevu;
    uint finReelle;
    address[] addressCandidats;
    string[] nomCandidats;
    bytes32 rendu;
    mapping (address => bool) candidats;
   }
   enum EtatDemande {OUVERTE, ENCOURS, FERMEE}
   uint public demandeCompteur;
   Demandes[] public demandes;

   mapping (address => uint) public reputation;
   mapping (address => string) public utilisateurs;
   mapping (address => bool) private admins;
   mapping (address => bool) private bannis;

   constructor() public {
     admins[msg.sender] = true;
     reputation[msg.sender] = 1;
   }


   function inscription(string memory nom) public {
     require(bannis[msg.sender] = false, "Vous êtes banni!");
     utilisateurs[msg.sender] = nom;
     reputation[msg.sender] = 1;
   }

   function bannir(address user) public {
     require(admins[msg.sender] == true, "Vous n'etes pas admin");
     require(bannis[user] == false, "user déjà banni");
     reputation[user] = 0;
     bannis[user] = true;
   }


   function ajouterDemande(uint _remuneration, uint _delai, string memory _description, uint _reputationMin) public  payable {
     require(!bannis[msg.sender], "vous êtes banni!");
     require(reputation[msg.sender] > 0 , "Vous devez vous inscrire"); //pas sûr
     require(msg.sender != address(0));
     require(msg.value >= (_remuneration + (_remuneration*2)/100), "Ajoutez les 2% de frais");
     Demandes memory nouvelleDemande;
     nouvelleDemande.remuneration = _remuneration;
     nouvelleDemande.delai = _delai * 1 days;
     nouvelleDemande.description = _description;
     nouvelleDemande.etat = EtatDemande.OUVERTE;
     nouvelleDemande.reputationMin = _reputationMin;
     demandes.push(nouvelleDemande);
   }


   function postuler(uint _numOffre) public {
      require(demandes[_numOffre].etat == EtatDemande.OUVERTE, "Cette offre nest plus ouverte au candidatures");
      require(!bannis[msg.sender], "Vous avez été banni");
      require(reputation[msg.sender] > 0, "Vous devez être inscrit");
      demandes[_numOffre].candidats[msg.sender] = true;
      demandes[_numOffre].addressCandidats.push(msg.sender);
      demandes[_numOffre].nomsCandidats.push(utilisateurs[msg.sender]);
   }


  function accepterOffre(uint _numOffre, address _elu) public {
    require(demandes[_numOffre].etat = EtatDemande.OUVERTE, "cette offre nest plus ouverte!");
    demandes[_numOffre].etat = EtatDemande.ENCOURS;
    demandes[_numOffre].debut = now;
    demandes[_numOffre].finPrevu =demandes[_numOffre].delai + demandes[_numOffre].debut ;

  }

  function produireHash(string memory url) public pure returns(bytes32){
      return keccak256(bytes(url));
  }


  function livraison(uint _numOffre,string memory url) public {
    demandes[_numOffre].rendu =  produireHash(url);
    demandes[_numOffre].etat = EtatDemande.FERMEE;
    reputation[msg.sender] += 1;
    demandes[_numOffre].finReelle = now;
  }

}
