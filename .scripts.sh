copy() {
    if [[ $# -eq 0 ]]; then
        cat | xclip -sel clip
    elif [ -f $1 ]; then
        xclip -sel clip $1
    else
        printf '%s' $1 | xclip -sel clip
    fi
}

mvdir() {
    mkdir $1
    cd $1
}
