const std = @import("std");

fn validMountainArray(arr: []const i32) bool {
    // std.debug.print("Input: -> {any}\n", .{arr});
    const n = arr.len;
    if (n < 3) return false;

    var i: usize = 0;

    // Walk strictly up
    while (i + 1 < n and arr[i] < arr[i + 1]) : (i += 1) {}

    if (i == 0 or i == n - 1) return false;

    // Walk strictly down
    while (i + 1 < n and arr[i] > arr[i + 1]) : (i += 1) {}

    return i == n - 1;
}

pub fn main() !void {
    // Example tests
    const example1 = [_]i32{ 2, 1 };
    const example2 = [_]i32{ 0, 3, 2, 1 };
    const example3 = [_]i32{ 0, 2, 2, 1 }; // not valid (flat at the top)
    const example4 = [_]i32{ 0, 1, 2, 3 }; // not valid (never goes down)

    std.debug.print("Example1: {any} -> {any}\n", .{ example1, validMountainArray(&example1) });
    std.debug.print("Example2: {any} -> {any}\n", .{ example2, validMountainArray(&example2) });
    std.debug.print("Example3: {any} -> {any}\n", .{ example3, validMountainArray(&example3) });
    std.debug.print("Example4: {any} -> {any}\n", .{ example4, validMountainArray(&example4) });
}
