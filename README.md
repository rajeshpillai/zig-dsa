# DSA for Interviews and Competitive Programming  
*A Zig based coding practice repository*

This repository contains clean, well-structured solutions to common Data Structures and Algorithms (DSA) problems frequently asked in coding interviews and competitive programming.

---

## Project Goals

- Build a high-quality, easy-to-reference collection of DSA problem solutions.
- Practice writing efficient algorithms in Zig.
- Maintain clean, readable explanations for future revision.
- Provide both **pseudocode** and **Zig implementations**.
- Use a standardized file structure for easy navigation.

---

## Solution Format

Every problem is documented using the following format:

```
# Problem Title (e.g., LeetCode 11 — Container With Most Water)

## Problem Statement
<Full description copied or rewritten in your own words>

## Explanation
<Clear reasoning, diagrams if needed, complexity analysis>

## Example Input
<Code block containing raw sample input>

## Example Output
<Code block containing raw sample output>

## Pseudocode
<Language-agnostic pseudocode>

## Zig Solution (Zig 0.15.2)
<Full Zig implementation using the correct modern APIs>
```

This ensures each `.md` file is clean, uniform, and easy to read.

---

## Language & Tools

- **Zig version:** 0.15.2 (installed via ZVM)
- **Editor:** VS Code
- **Language Server:** ZLS (configured to use Zig via ZVM)

---

## Folder Structure

```
.
├── README.md
├── 01-container-with-most-water-lc11/
│   ├── lc11.md
│   ├── lc11.zig
│   ├── pseudocode.md
├── 02-<next-problem>/
│   └── ...
└── ...
```

You may name folders using numeric prefixes to preserve order.

---

## Running a Zig Solution

Use the Zig CLI:

```
zig run path/to/file.zig
```

or build/run:

```
zig build run
```


## To run any specific code from any versin branch against zig master 

```
 zvm run master run .\01-container-with-most-water-lc11\lc11.zig
 ```
 

---

## Contribution Style (Personal Use)

To keep your notes consistent:

1. Always write the **full problem explanation** in Markdown.
2. Keep Zig code **self-contained** — no external dependencies.
3. Ensure the solution compiles on Zig **0.15.2** with the modern I/O and build APIs.
4. Keep explanations concise but informative for revision.

---

## Why Zig for DSA?

- Low-level control with high-level ergonomics.
- Fast compile times.
- Explicit memory management helps deepen understanding of algorithmic complexity.
- No hidden allocations or runtime surprises.
- Clean syntax ideal for interview preparation.

---

## Future Plans

- Add solutions for:
  - Two Pointers
  - Binary Search
  - Sliding Window
  - Recursion & Backtracking
  - Dynamic Programming
  - Trees & Graphs
  - Greedy Algorithms
  - Bit Manipulation
- Add benchmark comparisons for certain problems.
- Add a build system for running problem sets.

---

## License

For personal learning and interview preparation.  
Feel free to modify the structure as needed.

