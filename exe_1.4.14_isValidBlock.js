const crypto = require('crypto');

function changeEndianness(string) {
    const result = [];
    let len = string.length - 2;
    while (len >= 0) {
      result.push(string.substr(len, 2));
      len -= 2;
    }
    return result.join('');
}


function cibleAtteinte(exponent, coefficient, hash){
      target = parseInt(coefficient,16) * 2**(8 * (parseInt(exponent,16) - 3));  
      if (parseInt(hash,16) < target) {
        console.log("this hash is valid");
    } else {
        console.log("the hash is not valid");
    }

}


function isValidblock(block) {
       header = block.substring(2,162);
       version = changeEndianness(header.substring(0,8));
       prevHashblock = header.substring(8,72)
       Merkleroot = header.substring(72,136);
       TmStp = changeEndianness(header.substring(136,144));     
       bits = changeEndianness(header.substring(144,152));
       nonce = changeEndianness(header.substring(152,160));      
       hash1st = crypto.createHash('sha256').update(version+prevHashblock+Merkleroot+TmStp+bits+nonce).digest('hex');
       hash2nd = crypto.createHash('sha256').update(hash1st).digest('hex');
       hash = changeEndianness(hash2nd);

       expo = bits.substring(0,2);   
       coef = bits.substring(2,8);
       cibleAtteinte(expo, coef, hash);      

}


isValidblock("0x01000000008de6ae7a37b4f26a763f4d65c5bc7feb1ad9e3ce0fff4190c067f0000000000913281d"+
"b730c5cff987146330508c88cc3e642d1b9f5154854764fd547e0a54eaf26849ffff001d2e4a4c3d010100000001000000"+
"0000000000000000000000000000000000000000000000000000000000ffffffff0704ffff001d013fffffffff0100f205"+
"2a010000004341041ada81ea00c11098d2f52c20d5aa9f5ba13f9b583fda66f2a478dd7d95a7ab615159d98b63df2e6f3e"+
"cb3ef9eda138e4587e7afd31e7f434cbb6837e17feb0c5ac00000000")