function bits2Diff(bits){
     
    let  exponent = bits.substring(2,4);
    let coefficient = bits.substring(4,10);
    let currtarget = parseInt(coefficient,16) * 2**(8 * (parseInt(exponent,16) - 3))
    let maxtarget = parseInt("0x00000000FFFF0000000000000000000000000000000000000000000000000000",16);    
    diffuclty = maxtarget / currtarget
    return diffuclty
}




console.log(bits2Diff("0x1c0ae493"));
console.log(bits2Diff("0x03000001"));