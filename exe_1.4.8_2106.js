//maximum size of 4 bytes int = 2^31 - 1: FF FF FF FF = 4294967295
let maxEpoch = 4294967295

let epoch0 = 0 // 01/01/1970 00:00:00
// www.epochconverter.com
let minute = 60
let hour = 3600
let day = 86400
let month = 2629743
let year = 31556926

let maxYear = Math.floor(maxEpoch / year)
let maxMonth = Math.floor((maxEpoch % year) / month)
let maxDay = Math.floor((maxEpoch % year % month) / day)
let maxHour = Math.floor((maxEpoch % year % month % day) / hour)
let maxMinute = Math.floor((maxEpoch % year % month % day % hour) / minute)
let maxSecond = maxEpoch % year % month % day % hour % minute

console.log((maxDay + 1) + "/" + (maxMonth + 1) + "/" + (maxYear + 1970) + " " + maxHour + ":" + maxMinute + ":" + maxSecond)
