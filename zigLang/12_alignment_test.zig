const std = @import("std");
const expect = std.testing.expect;

const print = std.debug.print;

// pub fn main() void {
//     const alignment = @alignOf(u32); // Returns 4
//     print("Alignment of u32 is {}\n", .{alignment});
// }

const builtin = @import("builtin");
// // Some data types need to be stored at specific spots (e.g., even-numbered memory addresses) for the CPU to access them quickly and correctly.
// test "variable alignment" {
//     var x: i32 = 1234;
//     const align_of_i32 = @alignOf(@TypeOf(x));
//     try expect(@TypeOf(&x) == *i32);
//     try expect(*i32 == *align(align_of_i32) i32);
//     if (builtin.target.cpu.arch == .x86_64) {
//         try expect(@typeInfo(*i32).pointer.alignment == 4);
//     }
// }

// // Like, a *i32 can be coerced to a *const i32, a pointer with a larger alignment can be implicitly cast to a pointer with a smaller alignment, but not vice versa.
// var foo: u8 align(4) = 100;

// test "global variable alignment" {
//     print("{}\n", .{@TypeOf(foo)});
//     print("{}\n", .{@TypeOf(&foo)});
//     try expect(@typeInfo(@TypeOf(&foo)).pointer.alignment == 4);
//     try expect(@TypeOf(&foo) == *align(4) u8);
//     const as_pointer_to_array: *align(4) [1]u8 = &foo;
//     const as_slice: []align(4) u8 = as_pointer_to_array;
//     const as_unaligned_slice: []u8 = as_slice;
//     try expect(as_unaligned_slice[0] == 100);
// }

// fn derp() align(@sizeOf(usize) * 2) i32 {
//     return 1234;
// }
// fn noop1() align(1) void {}
// fn noop4() align(4) void {}

// test "function alignment" {
//     try expect(derp() == 1234);
//     try expect(@TypeOf(derp) == fn () i32);
//     try expect(@TypeOf(&derp) == *align(@sizeOf(usize) * 2) const fn () i32);

//     noop1();
//     try expect(@TypeOf(noop1) == fn () void);
//     try expect(@TypeOf(&noop1) == *align(1) const fn () void);

//     noop4();
//     try expect(@TypeOf(noop4) == fn () void);
//     try expect(@TypeOf(&noop4) == *align(4) const fn () void);
// }

// If you have a pointer or a slice that has a small alignment, but you know that it actually has a bigger alignment, use @alignCast to change the pointer into a more aligned pointer. This is a no-op at runtime, but inserts a safety check:
test "pointer alignment safety" {
    var array align(4) = [_]u32{ 0x11111111, 0x11111111 };
    const bytes = std.mem.sliceAsBytes(array[0..]);
    try std.testing.expect(foo(bytes) == 0x11111111);
}
fn foo(bytes: []u8) u32 {
    const slice4 = bytes[1..5];
    const int_slice = std.mem.bytesAsSlice(u32, @as([]align(4) u8, @alignCast(slice4)));
    return int_slice[0];
}
