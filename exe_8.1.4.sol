pragma solidity 0.5.0;

import "github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/cryptography/ECDSA.sol";


contract CanalDePaiement {

  enum EtatCanal {VIDE, ACTIF, ENCOURSFERMETURE, FERME}
  address payable partieA;
  address payable partieB;
  uint montant;
  EtatCanal etat;
  uint blocFermeture;
  uint dernierNonce;
  uint equilibreA;
  uint equilibreB;


  constructor(uint _amount, address payable _partie1, address payable _partie2) public payable {
    require(montant > 0, "le Canal ne peut pas etre déficitaire!");
    _amount = equilibreA + equilibreB;
    partieA = _partie1;
    partieB = _partie2;
    EtatCanal.ACTIF;
    }

    modifier seulementParticipants() {
    require(msg.sender == partieA || msg.sender == partieB);
    _;
    }

  function financer() seulementParticipants public payable {
    if (msg.sender == partieA) {
    equilibreA = msg.value;
    montant -= equilibreA;
  } else if (msg.sender == partieB){
    equilibreB = msg.value;
    montant -= equilibreB;
    }
    EtatCanal.ACTIF;
   }

  function message(uint256 _nonce, uint _equilibreA, uint _equilibreB) seulementParticipants public view returns(bytes32){
   require(_nonce > dernierNonce);
   return keccak256(abi.encodePacked(_nonce, _equilibreA, _equilibreB));

  }

  function fermeture(uint256 _equilibreA, uint256 _equilibreB, uint256 _nonce, bytes memory signature) seulementParticipants public {
      require(_nonce > lastNonce);
      require(_equilibreA + _equilibreB == address(this).balance);

      bytes32 hash = ECDSA.toEthSignedMessageHash(message(_nonce, _equilibreA, _equilibreB));
      address signer = ECDSA.recover(hash, signature);

      require(signer == partieA  || signer == partieB, "Signer doit etre l'un des participants");
      require(signer != msg.sender, "Signer ne doit pas etre le sender");
      equilibreA = _equilibreA;
      equilibreB = _equilibreB;
      dernierNonce = _nonce;

    }





}
