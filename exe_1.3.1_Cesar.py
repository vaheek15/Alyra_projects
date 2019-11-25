#!/usr/bin/env python3


def cesar(string, n):
    
    if n < 0:
        n = n % 26 + 26
    word = ''
    for c in string:
        if 'A' <= c <= 'Z':
            c = chr((ord(c)-ord('A')+n) % 26 + ord('A'))
        if 'a' <= c <= 'z':
            c = chr((ord(c)-ord('a')+n) % 26 + ord('a'))
        word += c
    return word


shift = int(input("Input the shifting index a number from 0 to 25: "))
MessageToEncrypt = input("Enter the message to encrypt with Ceaser Cipher: ")
print("Your encrypted message is : ", cesar(MessageToEncrypt, shift))
