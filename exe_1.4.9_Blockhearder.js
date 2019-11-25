//1 bloc every 10 min
//10 min = 600s
let blockGeneration = 600
let currentDate =new Date().getTime() // in seconds
//console.log(currentDate)

let numberOfBlocks = currentDate / blockGeneration

//header's size (with no TX) = 80 octets
let headersSize = numberOfBlocks * 80

//1 Byte --> 0.000001 MB
console.log("La taille de l'ensemble des en-têtes des blocs au 11/11/2019 est d'environ " + Math.floor(headersSize / 1000000) + " MB")
