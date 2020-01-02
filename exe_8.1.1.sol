pragma solidity 0.5.0;

contract CanalDePaiement {


enum EtatCanal {VIDE, ACTIF, ENCOURSFERMETURE, FERME}
address partieA;
address partieB;
uint montant;
EtatCanal etat;
uint blocFermeture;
uint dernierNonce;
uint equilibreA;
uint equilibreB;


constructor(uint _amount, address payable _partie1, address payable _partie2) public payable {
  montant = _amount;
  partieA = _partie1;
  partieB = _partie2;
  EtatCanal.ACTIF;
  }

}
