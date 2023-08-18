# zig-wcwidth

Port of [Termux's wcwidth implementation](https://github.com/termux/wcwidth) to
the Zig programming language. Follows Zig master.

## Usage

zig-wcwidth exposes only one function, `wcWidth`.
The signature is

```zig
fn(u21) u2;
```

This function returns the terminal display width of the given codepoint.
All ASCII control characters (including tabs, newlines and carriage returns)
return 0.

### Package manager

Add the package as a dependency to your `build.zig.zon`:

```zig
.{
  .name = "myproject",
  .version = "0.0.1",
  .dependencies = .{
    .@"zig-wcwidth" = .{
      /// Change 'COMMIT-HASH-HERE' to the hash of the zig-wcwidth commit you wish to use.
      .url = "https://github.com/efjimm/zig-wcwidth/archive/COMMIT-HASH-HERE.tar.gz",
    }
  }
}
```

The Zig compiler will instruct you to add a `.hash` field to the file.

The dependency can then be used in your `build.zig`:

```zig
pub fn build(b: *std.Build) void {
    // ... snip ...

    const wcwidth = b.dependency("zig-wcwidth", .{
        .target = target,
        .optimize = optimize,
    }).module("wcwidth");

    /// Add the module to your compile step.
    exe.addModule("wcwidth", wcwidth);

}
```

You can then `@import("wcwidth");` in your Zig code.
