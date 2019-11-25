#!/usr/bin/env python3
from collections import Counter


# 1. naive method
def naive_count(st):
    freq = {}
    for car in st:
        keys = freq.keys()
        if car in keys:
            freq[car] += 1
        else:
            freq[car] = 1
    return freq


text = input("enter a string to count its letters: ")
print("the letter frequencies are: ", naive_count(text.lower()))

# 2. Python's counter method
#counts = Counter(text)
#for i in text:
#   print(i,counts[i])


