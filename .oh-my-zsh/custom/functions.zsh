# Combine mkdir and cd into a single command
mkcd() {
        mkdir -p -- $1 && cd -P -- $1
}

# Test speed of hard drive
filesystemtest() {
        sync
        time dd ibs=1k obs=1k if=/dev/zero of=gigfile count=1000000
        time sync
        rm gigfile
}

# Print size of each file/dir in current directory
topoffenders() {
        for dir in `ls`; do
                if [ -d $dir -a ! -h $dir ]; then
                        du -sxh $dir
                fi
        done
}
