const std = @import("std");

pub fn maxArea(heights: []const u32) u64 {
    if (heights.len < 2) return 0;

    var left: usize = 0;
    var right: usize = heights.len - 1;
    var best: u64 = 0;

    while (left < right) {
        const left_side = heights[left];
        const right_side = heights[right];

        // const height = if (left_side < right_side) left_side else right_side;
        const height = @min(left_side, right_side);
        const width: u64 = @intCast(right - left);
        const area = height * width;

        if (area > best) {
            best = area;
        }

        if (left_side < right_side) {
            left += 1;
        } else {
            right -= 1;
        }
    }

    return best;
}

pub fn main() !void {
    const heights = [_]u32{ 1, 8, 6, 2, 5, 4, 8, 3, 7 };
    const result = maxArea(&heights);

    std.debug.print("Max area = {d}\n", .{result});
}
