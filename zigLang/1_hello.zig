const std = @import("std");

// // level 1
// pub fn main() !void {
//     const stdout = std.io.getStdOut().writer();
//     try stdout.print("hellow {s}", .{"Hellow"});
// }

// // level 2

// pub fn main() !void {
//     std.debug.print("{}", .{2});
// }

// Level 3

const print = @import("std").debug.print;

pub fn main() !void {
    print("Hello, World!", .{});
}
