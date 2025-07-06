const std = @import("std");
const print = std.debug.print;

// Level 2
const assert = @import("std").debug.assert;
const mem = @import("std").mem;
// array literal
const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };

pub fn main() !void {
    // write code

    // // undefined can be coerced to any type.
    // var x: u32 = undefined;
    // var y: u32 = undefined;
    // var z: u32 = undefined;
    // // In Debug mode, Zig writes 0xaa bytes to undefined memory. This is to catch bugs early, and to help detect use of undefined memory in a debugger.

    // const tuple = .{ 1, 2, 3 };
    // x, y, z = tuple;
    // print("tuple: x = {}, y = {}, z = {}\n", .{ x, y, z });

    // const array = [_]u32{ 4, 5, 6 };
    // x, y, z = array;
    // print("array: x = {}, y = {}, z = {}\n", .{ x, y, z });

    // const vector: @Vector(3, u32) = .{ 7, 8, 9 };
    // x, y, z = vector;
    // print("vector: x = {}, y = {}, z = {}\n", .{ x, y, z });

    // //  array concatenation
    // const array1 = [_]u32{ 1, 2 };
    // const array2 = [_]u32{ 3, 4 };
    // _ = array1 ++ array2;

    // --level 2
    var some_integers: [100]i32 = undefined;
    // 0.. – an open-ended range starting at 0. Since it's paired with the array, the loop auto-stops at the array's length (100).
    for (&some_integers, 0..) |*item, i| {
        item.* = @intCast(i);
        print("{}\t", .{item});
        // print("{}\t", .{item.*});
    }
}
