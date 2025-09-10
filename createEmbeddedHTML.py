s1 = '''<gmp-map center="'''
s2 = '''" zoom="4" map-id="DEMO_MAP_ID" style="height: 500px"><gmp-advanced-marker position="'''
s3 = '''" title="Alexander's last known location"></gmp-advanced-marker></gmp-map>\n'''
s4 = '''<p>Last coordinates: '''
s5 = ''', updated at '''
s6 = '''.</p>'''
from datetime import datetime

with open("locationFile.txt", "r") as f:
    x = f.readlines()
    res = []
    for c in x[-1]:
        if c in "1234567890-.":
            res.append(c)
        elif c == " ":
            res.append(",")
    s = "".join(res)
    final = s1 + s + s2 + s + s3 + s4 + s + s5 + datetime.now().strftime("%m/%d/%Y, %H:%M:%S") + s6
    print(final)

