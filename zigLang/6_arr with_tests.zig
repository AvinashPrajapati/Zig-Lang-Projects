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

// // ------A string literal is a single-item pointer to an array.
// const same_message = "hello";
// comptime {
//     assert(mem.eql(u8, &message, same_message));
// }

// test "iterate over an array" {
//     var sum: usize = 0;
//     for (message) |byte| {
//         sum += byte;
//     }
//     try expect(sum == 'h' + 'e' + 'l' * 2 + 'o');
// }

// // -- modifieding array
// var some_integers: [100]i32 = undefined;

// test "modify an array" {
//     for (&some_integers, 0..) |*item, i| {
//         item.* = @intCast(i);
//     }
//     try expect(some_integers[10] == 10);
//     try expect(some_integers[99] == 99);
// }

// // array concatenation works if the values are known
// // at compile time
// const part_one = [_]i32{ 1, 2, 3, 4 };
// const part_two = [_]i32{ 5, 6, 7, 8 };
// const all_of_it = part_one ++ part_two;
// comptime {
//     assert(mem.eql(i32, &all_of_it, &[_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }));
// }

// -------  ** does repeating patterns
const pattern = "ab" ** 3;
comptime {
    assert(mem.eql(u8, pattern, "ababab"));
}
