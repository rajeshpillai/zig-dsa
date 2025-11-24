const std = @import("std");

const less10 = [_][]const u8{
    "One",  "Two", "Three", "Four", "Five", "Six", "Seven", "Eight",
    "Nine",
};

const less20 = [_][]const u8{
    "Ten",       "Eleven",   "Twelve",   "Thirteen", "Fourteen", "Fifteen", "Sixteen",
    "Seventeen", "Eighteen", "Nineteen",
};

const less100 = [_][]const u8{
    "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety",
};

fn append(list: *std.ArrayList(u8), ally: std.mem.Allocator, s: []const u8) !void {
    try list.appendSlice(ally, s);
}

fn numberToWordsNonZeroList(list: *std.ArrayList(u8), ally: std.mem.Allocator, number: u64) !void {
    if (number < 10) {
        const idx: usize = @intCast(number - 1);
        try append(list, ally, less10[idx]);
        return;
    }

    if (number < 20) {
        const idx: usize = @intCast(number - 10);
        try append(list, ally, less20[idx]);
        return;
    }

    if (number < 100) {
        const tens: u64 = number / 10;
        const ones: u64 = number % 10;

        try append(list, ally, less100[@intCast(tens - 2)]);
        if (ones != 0) {
            try append(list, ally, " ");
            try append(list, ally, less10[@intCast(ones - 1)]);
        }
        return;
    }

    if (number < 1000) {
        const hundreds: u64 = number / 100;
        const rem: u64 = number % 100;

        try append(list, ally, less10[@intCast(hundreds - 1)]);
        try append(list, ally, " Hundred");

        if (rem != 0) {
            try append(list, ally, " ");
            try numberToWordsNonZeroList(list, ally, rem);
        }
        return;
    }

    if (number < 1_000_000) {
        const thousands: u64 = number / 1_000;
        const rem: u64 = number % 1_000;

        try numberToWordsNonZeroList(list, ally, thousands);
        try append(list, ally, " Thousand");

        if (rem != 0) {
            try append(list, ally, " ");
            try numberToWordsNonZeroList(list, ally, rem);
        }
        return;
    }

    if (number < 1_000_000_000) {
        const millions: u64 = number / 1_000_000;
        const rem: u64 = number % 1_000_000;

        try numberToWordsNonZeroList(list, ally, millions);
        try append(list, ally, " Million");

        if (rem != 0) {
            try append(list, ally, " ");
            try numberToWordsNonZeroList(list, ally, rem);
        }
        return;
    }

    // Rest of the numbers
    const billions: u64 = number / 1_000_000_000;
    const rem: u64 = number % 1_000_000_000;

    try numberToWordsNonZeroList(list, ally, billions);
    try append(list, ally, " Billion");

    if (rem != 0) {
        try append(list, ally, " ");
        try numberToWordsNonZeroList(list, ally, rem);
    }
}

pub fn numberToWordsAlloc(ally: std.mem.Allocator, number: u64) ![]const u8 {
    if (number == 0) {
        return try ally.dupe(u8, "Zero");
    }

    var list = try std.ArrayList(u8).initCapacity(ally, 32);
    defer list.deinit(ally);

    try numberToWordsNonZeroList(&list, ally, number);

    return try list.toOwnedSlice(ally);
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const ally = gpa.allocator();

    const test_values = [_]u64{
        0,             3,             9,
        10,            11,            13,
        19,            24,            44,
        53,            99,            100,
        200,           203,           130,
        125,           999,           1000,
        1200,          1230,          1260,
        1234,          1400,          9999,
        10000,         10100,         10101,
        99999,         299_999,       999_999,
        999_990,       1_234_567,     1_000_000,
        2_147_483_648, 2_147_483_640,
    };

    for (test_values) |n| {
        const s = try numberToWordsAlloc(ally, n);
        defer ally.free(s);
        std.debug.print("{d} = {s}\n", .{ n, s });
    }
}
