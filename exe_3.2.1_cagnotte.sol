pragma solidity ^0.4.26;

contract CagnotteFestival {
  mapping (address => uint) organisateurs;


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
      require(estOrga(orga), "Vous n"'etes pas organisteur");
       organisateurs[msg.sender] -= parts;
       organisateurs[orga] += parts;
  }



}
