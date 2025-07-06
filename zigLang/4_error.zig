const std = @import("std");

const print = std.debug.print;

const MyError = error{ NotFound, PermissionDenied };

pub fn main() !void {
    // // -------------- Defining the error object union with a datatype
    // const number_or_error: anyerror!i32 = error.ArgNotFound;
    // // const number_or_error: anyerror!i32 = 34;

    // print("\nerror union 1\ntype: {}\nvalue: {!}\n", .{
    //     @TypeOf(number_or_error),
    //     number_or_error,
    // });

    // // // using try catch to unwrap this variable
    // const result = number_or_error catch |err| {
    //     std.debug.print("Got error: {}\n", .{err});
    //     return;
    // };
    // // std.debug.print("Number: {}\n", .{result});

    // // using switch to unwrap this variable
    // switch (result) {
    //     error.ArgNotFound => {
    //         std.debug.print("Error: ArgNotFound\n", .{});
    //     },
    //     else => |val| {
    //         std.debug.print("Success: {}\n", .{val});
    //     },
    // }

    // ------Defining Proper error
    const name: ?[]const u8 = null;
    if (name) |val| {
        std.debug.print("Success: {}\n", .{val});
    } else {
        std.debug.print("Warning: {}\n", .{MyError.NotFound});
    }

    //  error set merge
    const A = error{One};
    const B = error{Two};
    (A || B) == error{ One, Two };
}
