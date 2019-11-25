#coding: utf-8
from itertools import combinations


def brute_force(capacity, weight_cost):
    """Brute force method for solving knapsack problem
    :param number: number of existing items
    :param capacity: the capacity of knapsack
    :param weight_cost: list of tuples like: [(weight, cost), (weight, cost), ...]
    :return: tuple like: (best cost, best combination list(contains 1 and 0))
    """
    best_cost = None
    best_combination = []
   # generating combinations by all ways: C by 1 from n, C by 2 from n, ...
    for way in range(len(weight_cost)):
        for comb in combinations(weight_cost, way + 1):
            #print(comb)
            weight = sum([wc[0] for wc in comb])
            cost = sum([wc[1] for wc in comb])
            if (best_cost is None or best_cost < cost) and weight <= capacity:
                best_cost = cost
                best_combination = comb
    return best_cost, best_combination


item = [
       (2000,13000),(6000,9000),(800,2000),(700,1500),(1200,3500),(1000,2800),(1300,5000),(600,1500)
        ]

print(brute_force(6000,item))

