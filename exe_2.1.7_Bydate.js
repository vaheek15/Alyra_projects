
function getDateDiff(date1,date2){
	 
	var difference = (date1 - date2) / 1000;
	return difference;
}


function calculateNbBitcoinsByDate(date) {
	
    let datecreeationBitcoin = new Date('2009-01-03');
 
	let height=(getDateDiff(date,datecreeationBitcoin)/(10*60));
	
	console.log(height);
	
	let initBlocRewards = 50;
	let step = 210000;
	let numberDecrease = ~~(height / step);
	let NbBitcoins = 0;

	for (let i = 0; i < numberDecrease; i++) {
		NbBitcoins += (initBlocRewards / Math.pow(2, i)) * step;
		
	}
		 
	NbBitcoins += (initBlocRewards / Math.pow(2, numberDecrease)) * (height % step);
	console.log(NbBitcoins);
	
}

calculateNbBitcoinsByDate(new Date('2019-11-15'));