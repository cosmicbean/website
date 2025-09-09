if nc -zw1 8.8.8.8 53; then
    rm locationFile.txt
    # get current location
    curl -s https://ipinfo.io/$(curl -s https://ipinfo.io/ip) | jq '.city, .region, .country, .loc' >> locationFile.txt

    if [ "$(wc -l < locationFile.txt)" -gt 1 ]; then
        rm mapStuff.html
        cp script.html mapStuff.html
        python3 createEmbeddedHTML.py >> mapStuff.html
        # push change to git
        git add locationFile.txt
        git add mapStuff.html
        git commit -m "Alex Location Update"
        git push origin main
    fi
fi