import random
kamala = 0
trump = 0

for i in range(100000):
    if random.random() < 0.5:
        kamala += 1
    else:
        trump += 1

print("Trump wins ", trump, " times")

