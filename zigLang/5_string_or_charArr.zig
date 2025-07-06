const std = @import("std");
const print = std.debug.print;

const mem = @import("std").mem; // will be used to compare bytes

pub fn main() !void {
    // // write code
    // const bytes = "hello";
    // print("{s}\n", .{bytes}); // 'hello'
    // print("{c}\n", .{bytes}); // '{ h, e, l, l, o }
    // print("{d}\n", .{bytes.len}); // 5
    // print("{c}\n", .{bytes[0]}); // 'e'
    // print("{c}\n", .{bytes[1]}); // 'e'
    // print("{c}\n", .{bytes[2]}); // 'e'
    // print("{c}\n", .{bytes[3]}); // 'e'
    // print("{d}\n", .{bytes[4]}); // 111  as d is used in {d} rather than c
    // print("{d}\n", .{bytes[5]}); // 0, why? Zig stores this as a string literal, backed by a null-terminated array

    // print("{}\n", .{@TypeOf(bytes)}); // *const [5:0]u8
    // // print("{d}\n", .{bytes[8]}); //  index 8 outside array of length 5

    // // --------- Other literals that is inmportant
    // print("{}\n", .{'e' == '\x65'}); // true
    // print("{d}\n", .{'\u{1f4a9}'}); // 128169
    // print("{d}\n", .{'💯'}); // 128175
    // print("{u}\n", .{'⚡'});
    // print("{}\n", .{mem.eql(u8, "hello", "h\x65llo")}); // true
    // print("{}\n", .{mem.eql(u8, "💯", "\xf0\x9f\x92\xaf")}); // also true
    // const invalid_utf8 = "\xff\xfe"; // non-UTF-8 strings are possible with \xNN notation.
    // print("0x{x}\n", .{invalid_utf8[1]}); // indexing them returns individual bytes...
    // print("0x{x}\n", .{"💯"[1]}); // ...as does indexing part-way through non-ASCII characters

    // ---- Multiline string literal
    const hello_world_in_c =
        // for comment while \\ for multiline string literal
        \\#include <stdio.h>
        \\
        \\int main(int argc, char **argv) {
        \\    printf("hello world\n");
        \\    return 0;
        \\}
    ;
    print("{s}\n", .{hello_world_in_c});
}
