pragma solidity ^0.5.0;

contract Pulsation {
  uint public battement;
  string private message;

 constructor(string memory _message) public {
   battement = 0;
   message = _message;
  }

 function ajouterBattement() public returns(string memory) {
    battement++;
    return  message;
    }
  }


contract Pendule {

 string[] public balancier;
 Pulsation tic;
 Pulsation tac;
 constructor() public {
         // créer un nouveau contract Pulsation avec le message "tic"
         tic = new Pulsation("tic");
         // créer un nouveau contract Pulsation avec le message "tac"
         tac = new Pulsation("tac");
     }



 function mouvementsBalancier(uint k) public {
    bool isTic = true;
    for (uint i =0; i <= k; i++) {
      if(isTic){
        balancier.push(tic.ajouterBattement());
        isTic = false;
     }else{
       balancier.push(tac.ajouterBattement());
       isTic = true;
    }
  }
 }
}
