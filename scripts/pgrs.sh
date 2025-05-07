#!/usr/bin/env bash

set -e

function show_usage {
    echo "Usage: $0 <command> <path-to-rust-file>"
    echo ""
    echo "Commands:"
    echo "  fmt     Format the specified Rust file using cargo fmt"
    echo "  lint    Run cargo clippy on the specified Rust file"
    echo "  run     Run the specified Rust file using cargo run"
    echo "  all     Run fmt, lint, and run commands in sequence"
    exit 1
}

function format_file {
    echo "Running cargo fmt..."
    cargo fmt

    echo "Copying formatted file back to $target_abs"
    cp "$temp_main" "$target_abs"
}

function lint_file {
    echo "Running cargo clippy..."
    cargo clippy --all-targets --all-features
}

function run_file {
    echo "Running cargo run..."
    cargo run
}

if [ $# -ne 2 ]; then
    show_usage
fi

command="$1"
target_file="$2"

case "$command" in
    fmt | lint | run | all) ;;
    *)
        echo "Error: Unknown command '$command'"
        show_usage
        ;;
esac

if [ ! -f "$target_file" ]; then
    echo "Error: '$target_file' does not exist or is not a regular file."
    exit 1
fi

script_path="$(readlink -f "${BASH_SOURCE[0]}")"
script_dir="$(dirname "$script_path")"
project_root="$(cd "$script_dir/.." && pwd)"
temp_main="${project_root}/src/main.rs"

function cleanup {
    echo "Cleaning up temporary files..."
    rm -f "$temp_main"
}
trap cleanup EXIT INT TERM HUP

mkdir -p "$(dirname "$temp_main")"

target_abs="$(readlink -f "$target_file")"

echo "Copying $target_file to $temp_main"
cp "$target_abs" "$temp_main"

cd "$project_root"

case "$command" in
    fmt)
        format_file
        ;;
    lint)
        lint_file
        ;;
    run)
        run_file
        ;;
    all)
        format_file
        lint_file
        run_file
        ;;
esac
