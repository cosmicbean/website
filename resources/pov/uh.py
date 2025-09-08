import os

with open("x.txt", "r") as x:
    for s in x:
        if s[-4:-1] == "jpg":
            print('<img src="../resources/pov/' + s[:-1] + '" alt="Computer view of me">')

