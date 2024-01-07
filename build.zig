const std = @import("std");

pub fn build(b: *std.Build) void {
    _ = b.addModule("wcwidth", .{
        .root_source_file = .{ .path = "src/wcwidth.zig" },
    });

    const tests = b.addTest(.{
        .root_source_file = .{ .path = "src/wcwidth.zig" },
    });
    const run_tests = b.addRunArtifact(tests);
    const test_step = b.step("test", "Run all tests");
    test_step.dependOn(&run_tests.step);
}
