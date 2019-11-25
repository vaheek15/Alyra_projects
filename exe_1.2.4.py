#!/usr/bin/env python3


TX = []
curr_rate = {
        "Doge_LTC": 0.381,
        "Doge_ETH": 2.75,
        "ETH_BTC": 0.206,
        "LTC_ETH": 8,
        "BTC_Doge": 1.7,
        "BTC_LTC": 0.48
        }

TX_actif = [84,29,300,288,27,33]
TX_passif = [32,80,62,2304,46,16]

for tx_actif, curr_exc in zip(TX_actif, curr_rate.values()):
    #print(tx_actif,curr_exc)
    TX.append(tx_actif*curr_exc)

print("The best rate exchange is:",max([i - j for i, j in zip(TX_passif,TX)]),"- that is with Doge it is better to buy ETH!")
