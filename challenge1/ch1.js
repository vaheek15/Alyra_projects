
function hex2dec(h){
    var result = 0, digitValue;
    hex = h.toLowerCase();
    for(var i = 0; i < hex.length; i++){
        digitValue = '0123456789abcdefgh'.indexOf(hex[i]);
        result = result * 16 + digitValue;

    }
    return result;
    }


function HexaLittleEndianToHexa(h){
    if (h.length %2 ==1){
        h = '0' +h
    }
    let retour = ""
    for (var i = 0; i < h.length-1; i+=2){
        retour = h[i] + h[i+1]+ retour
    }
    return retour
}


function DeciToVarInt(number) {
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
    varint =  "0x " + prefix + dec2hex(number).substring(2)
    return HexaLittleEndianToHexa(varint)
}


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
             return "0x"+ hexString
 }


function target2Diff(target) {
     return 0xffff * Math.pow(2, 208) / target;
    }


function calculateTarget(bits) {

   return  0xffff / parseInt(bits.substr(4, 6), 16) * Math.pow(256, 29 - parseInt(bits.substr(2, 2), 16));

}


function getInfoBlock(hash) {
    let rst
    let url = "https://api.blockcypher.com/v1/btc/main/blocks/" + hash
    let req = new XMLHttpRequest()
    req.onreadystatechange = function() {
        if (req.status == 200 && req.readyState == 4) {
        let rst = JSON.parse(req.responseText)
        document.getElementById("ha").value = rst.hash
        document.getElementById("hei").value = rst.height
        document.getElementById("txnb").value = rst.n_tx
        document.getElementById("fees").value = rst.fees
        document.getElementById("size").value = rst.size
        document.getElementById("tot").value = rst.total
        document.getElementById("times").value = rst.time
        document.getElementById("BIT").value = rst.bits
        document.getElementById("nonce").value = rst.nonce
        document.getElementById("pblock").value = rst.prev_block
        document.getElementById("mroot").value = rst.mrkl_root
        document.getElementById("chain").value = rst.chain
        document.getElementById("ver").value = rst.ver
        document.getElementById("depth").value = rst.depth
        } else if (req.satus != 200 && req.readyState == 4)
        alert("Ce hash de block n'existe pas")
    }
    req.open("get", url, true)
    req.send()
}


document.getElementById('hex2dec').addEventListener('click', event => {
    deci = document.getElementById('hex1').value
    hexa = hex2dec(deci)
    document.getElementById('dec1').innerHTML = hexa
})


document.getElementById('hexl2hex').addEventListener('click', event => {
    hexal = document.getElementById('hexl').value
    hexa3 = HexaLittleEndianToHexa(hexal)
    document.getElementById('hex3').innerHTML = hexa3
})

document.getElementById('varint2dec').addEventListener('click', event => {   
    varINT = document.getElementById('varint').value
    dec3 = DeciToVarInt(varINT)
    document.getElementById('dec3').innerHTML = dec3
})

document.getElementById('DEC2HEXB').addEventListener('click', event => {
    deci2 = document.getElementById('dec2').value
    hexa2 = dec2hex(deci2)
    document.getElementById('hex2').innerHTML = hexa2
})

document.getElementById('b2t').addEventListener('click', event => {   
    bits = document.getElementById('bit').value
    target = calculateTarget(bits)
    document.getElementById('target').innerHTML = target
})


document.getElementById('t2d').addEventListener('click', event => {   
    tar = document.getElementById('target2').value
    diff = target2Diff(tar)
    document.getElementById('diff').innerHTML = diff
})


// modify this to call the right fun and its ok
document.getElementById('bkinf').addEventListener('click', event => {   
    blockID = document.getElementById('bid').value
    BLOCKinfo = getInfoBlock(blockID)

    //document.getElementById('').innerHTML = BLOCKinfo
})
