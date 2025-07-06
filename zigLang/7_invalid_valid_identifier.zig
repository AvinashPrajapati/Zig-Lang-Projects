const std = @import("std");
const print = std.debug.print;

const @"identifier with spaces in it" = 0xff;
const @"1SmallStep4Man" = 112358;

const c = @import("std").c;
pub extern "c" fn @"error"() void;
pub extern "c" fn @"fstat$INODE64"(fd: c.fd_t, buf: *c.Stat) c_int;

const Color = enum {
    red,
    @"really red",
};

pub fn main() !void {
    const color: Color = .@"really red";
    print("{}\n", .{color});

    print("{}", .{@"identifier with spaces in it"});

    // write code
}
