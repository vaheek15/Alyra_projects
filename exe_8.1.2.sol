pragma solidity 0.5.0;

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
    _amount = equilbreA + equilibreB;
    partieA = _partie1;
    partieB = _partie2;
    EtatCanal.ACTIF;
    }

  function financer() public payable {
    if (msg.sender == partieA) {
    equilibreA = this(msg.value);
    montant -= equilibreA;
  } else if (msg.sender == partieB){
    equilibreB = this(msg.value);
    montant -= equilibreB;
    }
    EtatCanal.ACTIF;
   }









}
