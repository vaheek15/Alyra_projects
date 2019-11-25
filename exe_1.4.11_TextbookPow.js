const { PerformanceObserver, performance } = require('perf_hooks');

function randomString1(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
       result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
 }

/*
 function randomString (strLength, charSet) {
    var result = [];

    
    charSet = charSet || 'abcdefghijklmnopqrstuvwxyz';

    while (--strLength) {
        result.push(charSet.charAt(Math.floor(Math.random() * charSet.length)));
    }

    return result.join('');
}*/
//console.log(randomString1(8));

function randomString_withConditon(str, len) {
    //console.log(str);
    //console.log(randstring);
    let count = 0;
    while (count >= 0) {
        let randstring = randomString1(len);
        if (randstring.substring(0,str.length) == str) {
        console.log(randstring);
        break;
        }
    count++;
          
}
console.log("On the "+count + " try!");
}



for (let i=0; i < 10; i++) {
    var t0 = performance.now();

    randomString_withConditon("ZZZ",3)

    var t1 = performance.now();
}
console.log("Call to our function took approximate " + (t1 - t0)/1000 + " seconds.")


