cdd() {
    mkdir $1 && cd $_
}

tm() {
    name=`basename $(pwd)`
    tmux ls | rg -q $name
    if [ $? -eq 0 ]; then
        tmux attach -t $name
    else
        tmux new -s $name
    fi
}

covid_json() {
    curl -s "https://e.infogram.com/7327507d-28f5-4e3c-b587-c1680bd790e6?parent_url=https%3A%2F%2Fwww.covid.is%2Ftolulegar-upplysingar&src=embed" | grep -E "\{.*\}" -o | tail -1 | jq '[.elements.content.content.entities[].props[] | objects | .data[0][0] | select(length == 3 and (.[2] | strings) and (.[2] | contains("Path")))] | reverse | [.[] | {total: .[0], category: .[1]}]' | sed 's/<[^>]*>\|\\n\\n//g'
}

covid() {
    curl -s "https://e.infogram.com/7327507d-28f5-4e3c-b587-c1680bd790e6?parent_url=https%3A%2F%2Fwww.covid.is%2Ftolulegar-upplysingar&src=embed" | grep -E "\{.*\}" -o | tail -1 | jq '[.elements.content.content.entities[].props[] | objects | .data[0][0] | select(length == 3 and (.[2] | strings) and (.[2] | contains("Path")))] | reverse | .[] | "\(.[0]) \(.[1])"' | sed 's/<[^>]*>\|\\n\\n\|"//g'
}

daysuntil() {
    echo $(( ($(date -d "$1" +%s --utc) - $(date +%s) )/(60*60*24) ))
}

ipinfo() {
    curl -s ipinfo.io/$1 | jq .
}

wd() {
    mkdir -p ~/Work/$1
    mkdir ~/Work/$1/Code
    mkdir ~/Work/$1/Images
    mkdir ~/Work/$1/PoCs
}

bspwm_nodes() {
    if [ -z $1 ]; then
        nodes=$(bspc query -N)
    else
        nodes=$(bspc query -N -n $1)
    fi
    while IFS= read -r val; do
        echo "$val $(xtitle $val)"
    done <<< "$nodes"
}

