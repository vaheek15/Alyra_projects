
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


function littleEndianHexStringToDecimal(string)
{
    if(!string) return undefined;
    var len = string.length;
    var bigEndianHexString = "0x";
    for(var i = 0; i < len/2; i++)
    {
        bigEndianHexString += string.substring((len-((i+1)*2)),(len-(i*2)));
    }
    return parseInt(bigEndianHexString);
}





 //ca fonctionne pour des grands nombres mais pour des petits nombres comme 42 ça ne semble pas convertir!
console.log(dec2hex(54845))

console.log(dec2hexL(54845))


//console.log(littleEndianHexStringToDecimal((little));
