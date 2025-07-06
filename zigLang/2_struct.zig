// implementing a

fn type_or_void(comptime c: bool, comptime t: type) type {
    if (c) {
        return t;
    } else {
        return void;
    }
}

fn value_or_void(comptime c: bool, v: anytype) type_or_void(c, @TypeOf(v)) {
    if (c) {
        return v;
    } else {
        return {};
    }
}
const enable_j: bool = true;

const Person = struct {
    id: type_or_void(enable_j, u8) = value_or_void(enable_j, 0),
    sno: ?u8 = null,
    name: []const u8,

    pub fn setName(self: *Person, prop: []const u8) !void {
        self.name = prop;
    }

    /// Custom formatter for std.debug.print and std.fmt
    /// If you want "avi" instead of { 97, 118, 105 } while printing the struct object, you must override format() to explicitly print {s} for the string field.
    // Thus, Level 2, using custom formatter

    pub fn format(
        self: Person,
        comptime _: []const u8,
        _: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        // Customize how the struct is printed
        try writer.print("Person(id: {}, name: \"{s}\")", .{ self.id, self.name });
    }
};

const std = @import("std");
pub fn main() !void {
    var a = Person{ .name = "avinash" };
    a.name = "Sandeep";
    // When you write {}, {any}, or {d} with a struct,
    std.debug.print("{d}\n", .{a});
}
