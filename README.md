# Rust Playground

A simple utility to format, lint, and run isolated Rust files without creating
a full Cargo project for each one.

## Features

- **Format**: Format your Rust code with `rustfmt`.
- **Lint**: Check your code with `clippy`.
- **Test**: Run tests using `cargo test`.
- **Run**: Execute your Rust file.
- **All**: Run format, lint, test, and execution in sequence.

## Installation

Clone the project, then:

```bash
./scripts/install.sh
```

This will make the `pgrs` command available in your path.

## Usage

```bash
pgrs <command> <path-to-rust-file>

pgrs fmt example.rs    # Format the file with rustfmt.
pgrs lint example.rs   # Lint the file with clippy.
pgrs test example.rs   # Run tests in the file.
pgrs run example.rs    # Run the Rust file.
pgrs all example.rs    # Format, lint, test, then run the file.
```

## How It Works

The script works by:

1. Copying your Rust file to a temporary location in a pre-configured Cargo
   project.
2. Running the requested operation(s).
3. Copying any formatting changes back to your original file.
4. Cleaning up temporary files automatically.

## Requirements

- Rust toolchain (rustc, cargo, rustfmt, clippy).
- Bash shell.

## Example

Create an example file (`example.rs`) anywhere in the file system:

```rust
fn main() {
    println!("Hello, Rust Playground!");
}
```

Run it with:

```bash
pgrs run example.rs
# Output: Hello, Rust Playground!
```

## License

MIT License

Copyright (c) 2025 João Sampaio

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the “Software”), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
