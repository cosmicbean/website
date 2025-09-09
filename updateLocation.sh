rm locationFile.txt
# get current location
curl -s https://ipinfo.io/$(curl -s https://ipinfo.io/ip) | jq '.city, .region, .country, .loc' >> locationFile.txt
# push change to git
git add locationFile.txt
git commit -m "Alex Location Update"
git push origin main
