const std = @import("std");
const expect = std.testing.expect;

const print = std.debug.print;

// This is also available as `std.c.printf`.
pub extern "c" fn printf(format: [*:0]const u8, ...) c_int;

pub fn main() !void {
    // write code
    // // 1. ptr to Int, Int to ptr
    // const ptr: *i32 = @ptrFromInt(0xdeadbee0);
    // print("{}\n", .{ptr});
    // const addr = @intFromPtr(ptr);
    // print("{}", .{@TypeOf(addr)});

    // // // 2. ptr Casting
    // const bytes align(@alignOf(u32)) = [_]u8{ 0x12, 0x12, 0x12, 0x12 };
    // // print("{b}\n", .{bytes});

    // const u32_ptr: *const u32 = @ptrCast(&bytes);
    // // print("{d}\n", .{&bytes});
    // print("{d}\n", .{u32_ptr.*});

    // // print("{d}\n", .{u32_ptr});

    // // // Even this example is contrived - there are better ways to do the above than
    // // // pointer casting. For example, using a slice narrowing cast:
    // // const u32_value = std.mem.bytesAsSlice(u32, bytes[0..])[0];
    // // print("{d}\n", .{u32_value});

    // // And even another way, the most straightforward way to do it:
    // print("{d}\n", .{@as(u32, @bitCast(bytes))});

    // // 3. using VOLATILE
    // // If a given load or store should have side effects, such as Memory Mapped Input/Output (MMIO), use volatile. In the following code, loads and stores with mmio_ptr are guaranteed to all happen and in the same order as in source code:
    // const mmio_ptr: *volatile u8 = @ptrFromInt(0x12345678);
    // print("{}", .{@TypeOf(mmio_ptr)});

    // // 4. allowzero pointer
    // var zero: usize = 0; // var to make to runtime-known
    // _ = &zero; // suppress 'var is never mutated' error
    // const ptr: *allowzero i32 = @ptrFromInt(zero);
    // print("{d}\n", .{ptr}); // you can not use ptr.*
    // print("{}\n", .{@TypeOf(ptr.*)});

    const msg = "Hello, world!\n";
    const non_null_terminated_msg: [msg.len]u8 = msg.*;
    _ = printf(&non_null_terminated_msg);
}
