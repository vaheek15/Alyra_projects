
function parseInput(hexVal) {
  let TX_id = hexVal.substring(0,64)
  let TX_VOUT =  hexVal.substring(64,72);
   
  let TX_scriptsigLen = parseInt(parseInt(hexVal.substring(72,74), 16).toString())  //VarInt 
  let TX_scriptsig = hexVal.substring(74,74+(TX_scriptsigLen*2))
  //console.log(TX_scriptsig)
  
  let TX_signatureLen = parseInt(parseInt(TX_scriptsig.substring(2,4),16).toString())  //VarInt 
  let TX_signature = TX_scriptsig.substring(4,4+(TX_signatureLen*2))
  //console.log(TX_signature)
  
  let Tx_pubkeyLen = parseInt(parseInt(TX_scriptsig.substring(4+(TX_signatureLen*2),4+(TX_signatureLen*2)+2), 16).toString())
  //console.log(Tx_pubkeyLen)
  let TX_pubkey = TX_scriptsig.substring(4+(TX_signatureLen*2)+2,4+(TX_signatureLen*2)+2+(Tx_pubkeyLen*2))
  //console.log(TX_pubkey)
  
  //this field seems to to be obsolete!!
  let TX_sequence = hexVal.substr(72+TX_scriptsig.length)


console.log("Parsing input: \ntransaction id (little endian): "+TX_id+"\nOutput index (little endian):"
+TX_VOUT+"\nScriptSig size: "+TX_scriptsigLen+"\nScriptSig: "+TX_scriptsig+"\nSignature size: "+TX_signatureLen+
"\nSignature (little endian): "+TX_signature+"\nPublic key size: "+Tx_pubkeyLen+"\nPublic key (little endian): "
+TX_pubkey+"\nSequence (little endian): "+TX_sequence)

}

let rawtx = "941e985075825e09de53b08cdd346bb67075ef0ce5c94f98853292d4bf94c10d010000006b483045022100ab44ef4" +
"25e6d85c03cf301bc16465e3176b55bba9727706819eaf07cf84cf52d02203f7dc7ae9ab36bead14dd3c83c8c030bf8" +
"ce596e692021b66441b39b4b35e64e012102f63ae3eba460a8ed1be568b0c9a6c947abe9f079bcf861a7fdb2fd577ed" +
"48a81Feffffff"
//var tx = bitcoin.Transaction.fromHex(rawtx);

parseInput(rawtx)
