

function swapEndianness(string) {
  const result = [];
  let len = string.length - 2;
  while (len >= 0) {
    result.push(string.substr(len, 2));
    len -= 2;
  }
  return result.join('');
}


function calculerCible(actualblocdate, blocminus2016date, previousTarget) {

target = previousTarget * ( (actualblocdate - blocminus2016date) / (20160 * 60) );

return swapEndianness(target.toString(16));

}

console.log(calculerCible(1546661037, 1545564024, parseInt("0000000000000000003218a50000000000000000000000000000000000000000",16)))