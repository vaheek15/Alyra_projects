

function cibleAtteinte(exponent, coefficient, hash){
     
        target = parseInt(coefficient,16) * 2**(8 * (parseInt(exponent,16) - 3))
            
        
        if (parseInt(hash,16) < target) {
            console.log("this hash is valid");
        } else {
            console.log("the hash is not valid");
        }

}

cibleAtteinte("3218a5", 23, "00000000000000000019b2634066a100e56ed58a0ae40ca5a4e2d1dba6a4be22");