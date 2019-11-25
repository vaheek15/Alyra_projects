function dec2hex(number){
var hexCharacters = ["A", "B", "C", "D", "E", "F"]; //Digits for 10-15, eliminates having case statements
var hexString = "";
while (number > 0) {
  var mod = number % 16; //Get the remainder
  number = Math.floor(number / 16); //Update number

  //Prepend the corresponding digit
  if (mod > 9) {
    hexString = hexCharacters[mod - 10] + hexString; //Get the digits for 10-15 from the array
  } else {
    hexString = mod.toString() + hexString;
  }
}
return "0x" + hexString;
}


function dec2hexL(number){

   return "0x" + dec2hex(number).substring(2).replace(/^(.(..)*)$/, "0$1").match(/../g).reverse().join("")

}

function convertDeciToVarInt(number) {
    let prefix = ""
    if (number <= 252){
        prefix = ""
    } else if (number > 252 && number <= 65535) {
        prefix = "fd"
    } else if (number > 65535 && number <= 4294967295) {
        prefix = "fe"
    } else if (number > 4294967295 && number <= 18446744073709552000) {
        prefix = "ff"
    } else {
        return "Veuillez entrer un nombre inferieur ou égal à 18446744073709552000"
    }
    return "0x" + prefix + dec2hexL(number).substring(2)
}

console.log(dec2hex(3841))
console.log(dec2hexL(3841))
console.log(convertDeciToVarInt(3841))
