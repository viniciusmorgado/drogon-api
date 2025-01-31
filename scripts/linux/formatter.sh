#!/bin/bash
#
# clang-format-all: a tool to run clang-format on an entire project
# Adapted for project structure with src/ and tests/

function usage {
    echo "Usage: $0 [DIR...]"
    echo "If no directories are specified, defaults to 'src' and 'tests'"
    exit 1
}

# Default to src and tests if no arguments provided
if [ $# -eq 0 ]; then
    set -- "src" "tests"
fi

# Variable that will hold the name of the clang-format command
FMT=""

# Find clang-format (same as original)
for clangfmt in clang-format{,-{4,3}.{9,8,7,6,5,4,3,2,1,0}}; do
    if which "$clangfmt" &>/dev/null; then
        FMT="$clangfmt"
        break
    fi
done

[ -z "$FMT" ] && { echo "clang-format not found"; exit 1; }

# Validate directories
for dir in "$@"; do
    if [ ! -d "$dir" ]; then
        echo "Error: $dir is not a directory"
        usage
    fi
done

# Find dominating .clang-format file (same as original)
find-dominating-file() {
    [ -r "$1/$2" ] && return 0
    [ "$1" = "/" ] && return 1
    find-dominating-file "$(realpath "$1/..")" "$2"
}

# Format files with corrected extensions
for dir in "$@"; do
    pushd "$dir" &>/dev/null || continue
    if ! find-dominating-file . .clang-format; then
        echo "No .clang-format found for $dir"
        popd &>/dev/null
        continue
    fi
    find . \
        \( -name '*.cc' \
        -o -name '*.cpp' \
        -o -name '*.h' \) \
        -exec "$FMT" -i '{}' \;
    popd &>/dev/null
done
