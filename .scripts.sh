cddir() {
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
