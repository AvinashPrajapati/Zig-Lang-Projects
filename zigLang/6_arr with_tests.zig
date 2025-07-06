const expect = @import("std").testing.expect;

// Level 2
const assert = @import("std").debug.assert;
const mem = @import("std").mem;
// array literal
const message = [_]u8{ 'h', 'e', 'l', 'l', 'o' };

// alternative initialization using result location
const alt_message: [5]u8 = .{ 'h', 'e', 'l', 'l', 'o' };

// assert is basically a small check for safety
comptime {
    assert(mem.eql(u8, &message, &alt_message));
}
// get the size of an array
comptime {
    assert(message.len == 5);
}

// ------A string literal is a single-item pointer to an array.
const same_message = "hello";
comptime {
    assert(mem.eql(u8, &message, same_message));
}

test "iterate over an array" {
    var sum: usize = 0;
    for (message) |byte| {
        sum += byte;
    }
    try expect(sum == 'h' + 'e' + 'l' * 2 + 'o');
}
