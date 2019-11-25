#!/usr/bin/env python3
import timeit
from math import factorial

num = int(input("Input the number for which you want to calculate the factorial: "))

def factorial_iterative(n):
    product = 1
    for num in range(2, n + 1):
        product *= num
    return product

def factorial_recursive(n):
    if n == 1:
       return 1
    else:
       return n * factorial_recursive(n - 1)

def python_builtin(n):
    return factorial(n)


print("the factorial of {} is {} and it takes:".format(num, factorial_iterative(num)))
print(timeit.timeit('factorial_classic(num)',setup = "from __main__ import factorial_iterative, num", number=100000), "seconds")

print("the factorial of {} is {} and it takes:".format(num, factorial_recursive(num)))
print(timeit.timeit("factorial_recursive(num)",setup = "from __main__ import factorial_recursive, num", number=100000), "seconds")

print("the factorial of {} is {} and it takes:".format(num, python_builtin(num)))
print(timeit.timeit("python_builtin(num)",setup = "from __main__ import python_builtin, num", number=100000),"seconds")
    
