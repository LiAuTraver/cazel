"""
File with all 3rd party dependencies needed for the project

They are loaded but without loading the transitive dependencies, this is done in
a separated file transitive_dependencies.bzl
"""

load("//bazel/third_party/bazel_skylib:direct.bzl", "load_bazel_skylib")
load("//bazel/third_party/buildtools:direct.bzl", "load_buildtools")
load("//bazel/third_party/protobuf:direct.bzl", "load_protobuf")
load("//bazel/third_party/rules_go:direct.bzl", "load_rules_go")

def load_third_party_libraries():
    """Load source code of all direct and transitive dependencies"""
    load_bazel_skylib()
    load_buildtools()
    load_protobuf()
    load_rules_go()
