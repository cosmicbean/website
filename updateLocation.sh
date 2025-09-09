
# cd to the directory this script lives in (resolves symlinks too)
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE")" && pwd)"
cd "$SCRIPT_DIR" || exit 1


if nc -zw1 8.8.8.8 53; then
    rm locationFile.txt
    # get current location
    curl -s https://ipinfo.io/$(curl -s https://ipinfo.io/ip) | jq '.city, .region, .country, .loc' >> locationFile.txt

    if [ "$(wc -l < locationFile.txt)" -gt 1 ]; then
        echo "result from ipinfo greater than one line, updating!"
        rm mapStuff.html
        cp script.html mapStuff.html
        python3 createEmbeddedHTML.py >> mapStuff.html
        # push change to git
        git add locationFile.txt
        git add mapStuff.html
        git commit -m "Alex Location Update"
        git push origin main
        echo "success"
    else
        echo "result from ipinfo not greater than one line, will not update"
    fi
    echo "here 1"
fi
echo "here 2"
