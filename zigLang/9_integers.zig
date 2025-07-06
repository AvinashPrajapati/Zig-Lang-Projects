const std = @import("std");
const print = std.debug.print;

const big = @as(f64, 1 << 40);

export fn foo_strict(x: f64) f64 {
    return x + big - big;
}

export fn foo_optimized(x: f64) f64 {
    @setFloatMode(.optimized);
    return x + big - big;
}

// pub fn main() !void {
//     // write code
//     _ = 123.0E+77;
//     const another_float = 123.0;

//     print("{}", .{foo_strict(another_float)});
// }
