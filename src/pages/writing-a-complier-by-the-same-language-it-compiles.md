---
layout : "base-layout.njk"
title: "How Writing a Complier By The Same Language it Compiles Possible"
tags: ["ComputerScience"]
--- 

In computer science this called bootstrapping. Here's how a compiler can be written in the same language it compiles:
Step-by-Step: Writing a Compiler in Its Own Language

1. Initial Compiler in Another Language
- First, a minimal version of the compiler (let’s call it Stage 0) is written in a different language (e.g., C or assembly).
- This version can compile a basic subset of the target language.

2. Self-Hosting Compiler
- Using Stage 0, developers write a more complete compiler in the target language itself.
- This version is compiled by Stage 0 to produce a binary.

3. Recompile Itself
- The new compiler (written in its own language) is then used to compile its own source code.
- If the output matches the previous binary, this is called a fixed point—a sign of correctness.

4. Bootstrapping Complete
- Now the compiler is self-hosting: it can compile itself.
- Future improvements can be made in the language itself and compiled by the current version.

---

Real-World Examples

| Language | Bootstrapped Compiler? | Notes |
|----------|------------------------|-------|
| C    | Yes                    | Early C compilers were written in assembly, then rewritten in C. |
| Rust | Yes                    | Rust’s compiler (rustc) is written in Rust. |
| Go   | Yes                    | Initially written in C, then rewritten in Go. |
| Haskell | Yes                | GHC (Glasgow Haskell Compiler) is written in Haskell. |

---

Why Do This?

- Dogfooding: Using your own language to build its tools proves its maturity.
- Portability: Once bootstrapped, the compiler can be ported to new platforms by compiling the initial version there.
- Optimization: Developers can use the language’s features to improve the compiler itself.
