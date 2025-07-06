const std = @import("std");

const print = std.debug.print;

pub fn main() !void {
    // // write code
    // var a: u8 = 200; // u8 has max limit 255
    // const b = 2;
    // a *%= b; // Wrapping Multiplication (*% ) => 200*2 mod 255
    // print("{}", .{a});

    // // Also
    // const ab: u8 = 10;
    // const bc: u16 = 5;
    // const result = ab *% bc; // becomes u16
    // print("{}", .{result});

    // // Detecting Overflow
    // const x: u8 = 200;
    // const y = 2;
    // const result = @mulWithOverflow(x, y); // => struct { result: u8, overflow: bool }

    // const product = result[0]; // the actual multiplication result
    // const overflow = result[1]; // 1 = overflow, 0 = no overflow

    // if (overflow == 1) {
    //     print("overflow!\n", .{});
    // } else {
    //     print("value: {}\n", .{product});
    // }

    // POinter Derefrencing
    const x: u32 = 1234;
    const ptr = &x;
    ptr.* == 1234;
}
