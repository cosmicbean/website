import os
import sys

"""
with open("x.txt", "r") as x:
    for s in x:
        if s[-5:-1] == "webp":
            print('        <img src="../resources/pov/' + s[:-1] + '" alt="Computer view of me">')
"""

try:
    print(sys.argv[1])
    n = int(sys.argv[1])
except ValueError:
    print("Error: n must be an integer")
    sys.exit(1)

res = []
fd1 = open("pov1.html", "r")
res.append(fd1.read())
fd1.close()
for i in range(n-1, -1, -1):
    res.append('          <img src="../resources/pov/' + str(i) + '.webp" alt="Computer view of me">\n')

fd2 = open("pov2.html", "r")
res.append(fd2.read())
fd2.close()

os.system("rm ../../blog/pov.html")
with open("../../blog/pov.html", "w") as x:
    x.write("".join(res))

