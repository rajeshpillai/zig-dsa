# Zig (0.15.2) for LeetCode, DSA, and Competitive Programming  
*A practical guide for developers who already know JavaScript / C# / TypeScript*

This guide teaches only the parts of Zig needed to solve algorithms & data structures problems efficiently.  
Everything here matches **Zig 0.15.2** APIs and syntax.

---

# 1. How We Use Zig for LeetCode

LeetCode does not natively support Zig, so our workflow is:

- Write the solution function (e.g., `fn maxArea(...)`).
- Provide a `main()` with hardcoded inputs.
- Print output using:

```
std.debug.print("...", .{});
```

This is the simplest & most stable debug output option in Zig 0.15.x.

---

# 2. Zig Syntax & Types (Minimal Required)

## 2.1 Variables and Constants

```
const x: i32 = 10;   // immutable
var y: i32 = 20;     // mutable
y += 5;
```

Zig infers types:

```
const x = 10;     // comptime_int
var flag = true;  // bool
```

Common types:

- `i32`, `i64` — signed
- `u32`, `u64` — unsigned
- `usize` — index type (use this for slicing and loops)

Explicit casting:

```
const a: u32 = 5;
const b: u64 = @as(u64, a);
```

---

## 2.2 Control Flow

```
if (condition) {
    ...
} else if (...) {
    ...
} else {
    ...
}

var i: usize = 0;
while (i < 10) : (i += 1) {
    ...
}
```

Slice traversal:

```
for (nums) |value| {
    ...
}

for (nums, 0..) |value, idx| {
    ...
}
```

---

# 3. Arrays, Slices, and Strings

## 3.1 Fixed Arrays

```
const arr = [_]i32{ 1, 2, 3 };
std.debug.print("{d}\n", .{arr.len});
```

---

## 3.2 Slices: the Most Important Type for DSA

```
pub fn maxValue(nums: []const i32) i32 {
    var best = nums[0];
    for (nums) |v| if (v > best) best = v;
    return best;
}

const arr = [_]i32{ 3,1,4 };
const slice = arr[0..];
```

Slices behave like:

```
(pointer, length)
```

Use these for LeetCode-style problems.

---

## 3.3 Strings (`[]const u8`)

```
pub fn countChar(s: []const u8, ch: u8) usize {
    var count: usize = 0;
    for (s) |c| if (c == ch) count += 1;
    return count;
}

const text = "hello";
countChar(text, 'l');
```

---

# 4. Functions, Optionals, and Error Handling

## 4.1 Functions

```
pub fn add(a: i32, b: i32) i32 {
    return a + b;
}
```

---

## 4.2 Optionals `?T`

```
pub fn find(nums: []const i32, target: i32) ?usize {
    for (nums, 0..) |v, i|
        if (v == target) return i;
    return null;
}

if (find(nums, 5)) |idx| {
    ...
} else {
    ...
}
```

---

## 4.3 Error Unions `!T`

LeetCode problems rarely need them except in `main()`.

```
pub fn main() !void {
    std.debug.print("hello\n", .{});
}
```

---

# 5. Builtins Useful for DSA

```
@min(a, b)
@max(a, b)
@as(T, value)
@intCast(T, value)
@sizeOf(T)
@TypeOf(x)
```

Example:

```
const height = @min(left_side, right_side);
const width: u64 = @intCast(right - left);
```

---

# 6. Useful std Library Components

## 6.1 Printing (debug mode only)

```
std.debug.print("value = {d}\n", .{v});
```

---

## 6.2 Sorting (`std.mem.sort` + `std.sort.asc`)

```
const std = @import("std");

pub fn sortInts(nums: []i32) void {
    std.mem.sort(i32, nums, {}, comptime std.sort.asc(i32));
}
```

---

## 6.3 Dynamic Arrays (std.ArrayList)

Used for variable-length results.

```
const ArrayList = std.ArrayList;

var list = ArrayList(i32).init(allocator);
try list.append(5);
const slice = try list.toOwnedSlice();
```

In DSA, often avoid allocators by:

- Using fixed buffers, or
- Returning static arrays with a length counter.

---

# 7. A Standard LeetCode Zig Template (0.15.2)

```
const std = @import("std");

pub fn solve(nums: []const i32) i32 {
    var result: i32 = 0;
    for (nums) |v| result += v;
    return result;
}

test "solve basic" {
    const arr = [_]i32{ 1,2,3 };
    try std.testing.expectEqual(@as(i32, 6), solve(&arr));
}

pub fn main() !void {
    const arr = [_]i32{ 1,2,3,4 };
    std.debug.print("Answer = {d}\n", .{ solve(&arr) });
}
```

---

# 8. Recommended Learning Path for Zig + DSA

## Day 1 — Basics & Arrays
- `const`, `var`, loops, slices  
- Solve: LC11, LC121, LC977

## Day 2 — Strings & Hashing
- `[]const u8`, frequency arrays  
- Solve: LC242, LC49, LC383

## Day 3 — Sorting & Two-Pointers
- `std.mem.sort`, comparators  
- Solve: LC15, LC16, LC56

## Day 4 — Recursion & Backtracking
- recur functions, small buffers  
- Solve: LC78, LC46, LC39

## Day 5 — DP & 2D Arrays
- `[N][M]T` arrays, DP patterns  
- Solve: LC70, LC322, LC64

## Day 6 — Graphs & BFS/DFS
- adjacency lists, visited arrays  
- Solve: LC200, LC417, LC994


---

