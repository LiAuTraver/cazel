> This is a fork from the original bazel example.

> IMPORTANT: the path in the bazel foles had been hardcorded to cater for the project and my own personal use. make sure to clone it as `bazel` folder in the root of the project.
```powershell
git clone git@github.com:LiAuTraver/cazel.git bazel
```

plus, add following to the `WORKSPACE.bazel` file:
```python
load("//bazel/third_party:third_party.bzl", "load_third_party_libraries")

load_third_party_libraries()

load("//bazel/third_party:transitive_dependencies.bzl", "load_transitive_dependencies")

load_transitive_dependencies()

register_toolchains(
    "//bazel/toolchain:Windows_MSVC",
)
```

create a new folder `platform` in the root of the project and add the following to the `BUILD.bazel` file:
```python
platform(
    name = "windows_x64",
    constraint_values = [
        "@platforms//os:windows",
        "@platforms//cpu:x86_64",
    ],
    visibility = ["//visibility:public"],
)
```