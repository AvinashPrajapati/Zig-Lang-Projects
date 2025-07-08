const std = @import("std");
const expect = std.testing.expect;

const print = std.debug.print;

pub fn main() !void {
    // // write code
    // const slice: [:0]const u8 = "hello";
    // print("{d}\n", .{slice.len});

    // // alternative initialization using result location
    // const alt_slice: []const i32 = &.{ 1, 2, 3, 4 };
    // print("{d}\n", .{alt_slice});

    // var array = [_]i32{ 1, 2, 3, 4 };
    // _ = &array; // necessory as var neds to mutate.
    // print("{d}\n", .{array});

    // // slicing
    // var array = [_]u8{ 3, 2, 1, 0, 3, 2, 1, 0 };
    // var runtime_length: usize = 3;
    // _ = &runtime_length;
    // const slice = array[0..runtime_length :0];
    // print("{d}\n", .{slice});

    // *********** Creating a sentinel-terminated slice from the array with a length of 2
    // will result in the value `1` occupying the sentinel element position.
    // This does not match the indicated sentinel value of `0` and will lead
    // to a runtime panic.
    var array = [_]u8{ 3, 2, 1, 0, 3, 2, 1, 0 };
    var runtime_length: usize = 2;
    _ = &runtime_length;
    const slice = array[0..runtime_length :1];
    for (slice) |val| {
        print("{} ", .{val});
    }
    print("\n", .{});
}
