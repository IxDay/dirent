const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const dirent = b.addStaticLibrary(.{
        .name = "dirent",
        .optimize = optimize,
        .target = target,
    });
    dirent.addCSourceFile(.{ .file = .{ .path = "src/dirent.c" }, .flags = &.{} });
    dirent.addLibraryPath(.{ .path = "src" });
    dirent.linkLibC();
    b.installArtifact(dirent);
}
