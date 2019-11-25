
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


console.log(recompenseBloc(0));
console.log(recompenseBloc(210000));
console.log(recompenseBloc(2100001));    