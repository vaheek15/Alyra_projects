

from random import *

choosen_num = randrange(0,99)

guessed_num = 0


while  guessed_num != choosen_num:
    guessed_num = int(input("guess the number the rand function has choosen!:  "))	
    if guessed_num < choosen_num: 
     print("its too low")
    elif guessed_num > choosen_num:
      print("its too high")
    else:
      print("you've guessed it right, wooooora!")


