//const dapp = {};

// Setup the dapp with MetaMask

async function createMetaMaskDapp() {

try {

  const addresses = await ethereum.enable();
  const address = addresses[0];
  const provider = new ethers.providers.Web3Provider(ethereum);
  const signer = provider.getSigner();
  dapp = { address, provider, signer };
  //console.log(dapp);
  const userBalance = provider.getBalance(address).then((balance) => {
// balance is a BigNumber (in wei); format is as a sting (in ether)
  let etherString = ethers.utils.formatEther(balance);
  //console.log("Balance: " + etherString);
  document.getElementById('userBalance').innerHTML = etherString;
    });


  provider.getBlockNumber().then((blockNumber) => {
    //console.log("Current block number: " + blockNumber);
  document.getElementById('blocknum').innerHTML = blockNumber;
  });

  provider.getGasPrice().then((gasPrice) => {
  // gasPrice is a BigNumber; convert it to a decimal string
  gasPriceString = gasPrice.toString();
  //console.log("Current gas price: " + gasPriceString);
  document.getElementById('gasPrice').innerHTML = gasPriceString;
  });



} catch(err) {

  console.error(err);

}

}
