const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;

// pub fn main() !void {
//     const x: i32 = 1234;
//     const x_ptr = &x;
//     print("{}", .{x_ptr});  // ref add.
//     print("{}", .{x_ptr.*}); // deref add.
//     // write code
// }

// // Zig has two kinds of pointers: single-item and many-item. 1. *T, 2. [*]T, 3. *[N]T, 3. []T

// test "address of syntax" {
//     // Get the address of a variable:
//     const x: i32 = 1234;
//     const x_ptr = &x;

//     // Dereference a pointer:
//     try expect(x_ptr.* == 1234);

//     // When you get the address of a const variable, you get a const single-item pointer.
//     try expect(@TypeOf(x_ptr) == *const i32);

//     // If you want to mutate the value, you'd need an address of a mutable variable:
//     var y: i32 = 5678;
//     const y_ptr = &y;
//     try expect(@TypeOf(y_ptr) == *i32);
//     y_ptr.* += 1; // mutating the value
//     try expect(y_ptr.* == 5679);
// }

// test "pointer array access" {
//     // Taking an address of an individual element gives a
//     // single-item pointer. This kind of pointer
//     // does not support pointer arithmetic.
//     var array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
//     const ptr = &array[2]; // ptr keeping the add.
//     try expect(@TypeOf(ptr) == *u8);

//     try expect(array[2] == 3);
//     ptr.* += 1; // first deref. then update
//     try expect(array[2] == 4);
// }

// test "slice syntax" {
//     // Get a pointer to a variable:
//     var x: i32 = 1234;
//     const x_ptr = &x;

//     // Convert to array pointer using slice syntax:
//     const x_array_ptr = x_ptr[0..1];
//     try expect(@TypeOf(x_array_ptr) == *[1]i32);

//     // Coerce to many-item pointer:  IMPORTANT ONE.
//     const x_many_ptr: [*]i32 = x_array_ptr;
//     try expect(x_many_ptr[0] == 1234);
// }

// // In Zig, we generally prefer Slices rather than Sentinel-Terminated Pointers. You can turn an array or pointer into a slice using slice syntax
// test "pointer slicing" {
//     var array = [_]u8{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
//     var start: usize = 2; // var to make it runtime-known
//     _ = &start; // suppress 'var is never mutated' error
//     const slice = array[start..4];
//     try expect(slice.len == 2);

//     try expect(array[3] == 4);
//     slice[1] += 1;
//     try expect(array[3] == 5);
// }

// // Pointers work at compile-time too, as long as the code does not depend on an undefined memory layout
// test "comptime pointers" {
//     comptime {
//         var x: i32 = 1;
//         const ptr = &x;
//         ptr.* += 1;
//         x += 1;
//         try expect(ptr.* == 3);
//     }
// }

// // To convert an integer address into a pointer, use @ptrFromInt. To convert a pointer to an integer, use @intFromPtr:

// test "@intFromPtr and @ptrFromInt" {
//     const ptr: *i32 = @ptrFromInt(0xdeadbee0);
//     const addr = @intFromPtr(ptr);
//     try expect(@TypeOf(addr) == usize);
//     try expect(addr == 0xdeadbee0); // Zig is able to preserve memory addresses in comptime code, as long as the pointer is never dereferenced:
// }

// // @ptrCast converts a pointer's element type to another. This creates a new pointer that can cause undetectable Illegal Behavior depending on the loads and stores that pass through it. Generally, other kinds of type conversions are preferable to @ptrCast if possible.
// test "pointer casting" {
//     const bytes align(@alignOf(u32)) = [_]u8{ 0x12, 0x12, 0x12, 0x12 };
//     const u32_ptr: *const u32 = @ptrCast(&bytes);
//     try expect(u32_ptr.* == 0x12121212);

//     // Even this example is contrived - there are better ways to do the above than
//     // pointer casting. For example, using a slice narrowing cast:
//     const u32_value = std.mem.bytesAsSlice(u32, bytes[0..])[0];
//     try expect(u32_value == 0x12121212);

//     // And even another way, the most straightforward way to do it:
//     try expect(@as(u32, @bitCast(bytes)) == 0x12121212);
// }

// test "pointer child type" {
//     // pointer types have a `child` field which tells you the type they point to.
//     try expect(@typeInfo(*u32).pointer.child == u32);
// }

//  a given load or store should have side effects, such as Memory Mapped Input/Output (MMIO), use volatile
test "volatile" {
    const mmio_ptr: *volatile u8 = @ptrFromInt(0x12345678);
    try expect(@TypeOf(mmio_ptr) == *volatile u8);
}

// allowzero pointer
test "allowzero" {
    var zero: usize = 0; // var to make to runtime-known
    _ = &zero; // suppress 'var is never mutated' error
    const ptr: *allowzero i32 = @ptrFromInt(zero);
    try expect(@intFromPtr(ptr) == 0);
}

// Sentinel-Terminated Pointers
