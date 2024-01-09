const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("wcwidth", .{
        .root_source_file = .{ .path = "src/wcwidth.zig" },
        .target = target,
        .optimize = optimize,
    });

    const tests = b.addTest(.{
        .root_source_file = .{ .path = "src/wcwidth.zig" },
        .target = target,
        .optimize = optimize,
    });
    const run_tests = b.addRunArtifact(tests);
    const test_step = b.step("test", "Run all tests");
    test_step.dependOn(&run_tests.step);
}
