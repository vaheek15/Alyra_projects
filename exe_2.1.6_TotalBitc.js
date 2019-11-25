/*var TAILLE_PALIER = 210000;
var SATOSHIS_PAR_BITCOIN = Math.pow(10, 8);

function bitcoinsEnCirculation(hauteurBloc) {
	return satoshisEnCirculation(hauteurBloc) / SATOSHIS_PAR_BITCOIN;
}

function satoshisEnCirculation(hauteurBloc) {
	let palier = Math.floor(hauteurBloc / TAILLE_PALIER);
	hauteurBloc++;
	let nb = 0;
	let recompensePalier = 50 * SATOSHIS_PAR_BITCOIN;

	for (let i = 0; i < palier; i++) {
		nb += recompensePalier * TAILLE_PALIER;
		recompensePalier = Math.floor(recompensePalier / 2);
		if (recompensePalier === 0) {
			return nb;
		}
	}

	nb += recompensePalier * (hauteurBloc - palier * TAILLE_PALIER);
	return nb;
}*/


function recompenseBloc(height) {
    let palier = Math.floor(height / 210000);
    let reward = 50 * Math.pow(10,8);
    for (let i =0; i < palier; i++) {
         reward = Math.floor(reward /2 );
         if (reward === 0) {
             break;
         }
    }
    return reward / Math.pow(10,8);

}

function  bitcoinsCirculation(blocHeight) {
         
         Totalbitcoins = 0;
         for (let i=0; i <= blocHeight; i++) {
            Totalbitcoins += recompenseBloc(i);

        }
       
    return Totalbitcoins;
}

console.log(bitcoinsCirculation(180000))
console.log(bitcoinsCirculation(210005))




