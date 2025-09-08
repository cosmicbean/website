import os

with open("x.txt", "r") as x:
    for s in x:
        if s[-5:-1] == "webp":
            print('          <img src="../resources/pov/' + s[:-1] + '" alt="Computer view of me">')

