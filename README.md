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

in the `.bazelrc` file, add the following:
```bash
#####################

# Enable disk cache
build --disk_cache=~/.bazel/disk_cache/

#################################
## Toolchain debugging options ##
#################################

# Verbose output to know what toolchains are selected
build --toolchain_resolution_debug

###################################
## Config options for toolchains ##
###################################

# Do not use automatically generated toolchains
build --action_env=BAZEL_DO_NOT_DETECT_CPP_TOOLCHAIN=1

# Do not use the deprecated toolchain resolution system with --cpu and --crosstool_top
build --incompatible_enable_cc_toolchain_resolution

build --platforms=//platform:windows_x64
build --toolchain_resolution_debug
build --extra_toolchains=//bazel/toolchain:Windows_MSVC
build --verbose_failures
```