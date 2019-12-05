//const dapp = {};

// Setup the dapp with MetaMask
let abi =
  [
{
  "constant": true,
  "inputs": [
    {
      "internalType": "address",
      "name": "",
      "type": "address"
    }
  ],
  "name": "cred",
  "outputs": [
    {
      "internalType": "uint256",
      "name": "",
      "type": "uint256"
    }
  ],
  "payable": false,
  "stateMutability": "view",
  "type": "function"
},
{
  "constant": true,
  "inputs": [
    {
      "internalType": "bytes32",
      "name": "",
      "type": "bytes32"
    }
  ],
  "name": "hashs",
  "outputs": [
    {
      "internalType": "bool",
      "name": "",
      "type": "bool"
    }
  ],
  "payable": false,
  "stateMutability": "view",
  "type": "function"
},
{
  "constant": true,
  "inputs": [
    {
      "internalType": "string",
      "name": "url",
      "type": "string"
    }
  ],
  "name": "produireHash",
  "outputs": [
    {
      "internalType": "bytes32",
      "name": "",
      "type": "bytes32"
    }
  ],
  "payable": false,
  "stateMutability": "pure",
  "type": "function"
},
{
  "constant": false,
  "inputs": [
    {
      "internalType": "bytes32",
      "name": "dev",
      "type": "bytes32"
    }
  ],
  "name": "remettre",
  "outputs": [
    {
      "internalType": "uint256",
      "name": "",
      "type": "uint256"
    }
  ],
  "payable": false,
  "stateMutability": "nonpayable",
  "type": "function"
},
{
  "constant": false,
  "inputs": [
    {
      "internalType": "address",
      "name": "destinataire",
      "type": "address"
    },
    {
      "internalType": "uint256",
      "name": "valeur",
      "type": "uint256"
    }
  ],
  "name": "transfer",
  "outputs": [],
  "payable": false,
  "stateMutability": "nonpayable",
  "type": "function"
}];

async function createMetaMaskDapp() {

try {

  const addresses = await ethereum.enable();
  const address = addresses[0];
  const provider = new ethers.providers.Web3Provider(ethereum);
  const signer = provider.getSigner();
  dapp = { address, provider, signer };
      //console.log(dapp);
 document.getElementsByClassName("needMetaMask")[0].className = "needMetaMask";
 } catch (err) {
    // Gestion des erreurs
    console.error(err);
  }
}

  async function instantiateCredibilite() {

  let credContract = new ethers.contract("0xad03801205254de5595a3c3e287a0ff2f4ed39447ec11c5b201883945a42079e", abi, dapp.provider.getSigner());
  let myCred = await credContract.cred(dapp.address);

  credContract.on('Transfer', (payeur, destinataire, montant) => {
  });

  }

  async function remettreDevoir() {
  let url = document.getElementById("devoirURL").value;
  let urlHash = await credContract.produireHash(url);
  console.log("Condensat de l'url du devoir: " + urlHash);

  //dapp.provider
  let rank = await contratCredibilite.remettre(urlHash);
  console.log("Le devoir #" + rank + "a été remis");
  }

}
