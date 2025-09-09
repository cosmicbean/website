rm locationFile.txt
# get current location
curl -s https://ipinfo.io/$(curl -s https://ipinfo.io/ip) | jq '.city, .region, .country, .loc' >> locationFile.txt
rm mapStuff.html
cp script.html mapStuff.html
python3 createEmbeddedHTML.py >> mapStuff.html
# push change to git
git add locationFile.txt
git add mapStuff.html
git commit -m "Alex Location Update"
git push origin main
