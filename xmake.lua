target("mklittlefs-v1")
set_kind("binary")
add_files("main.cpp")
add_files("littlefs/v1/*.c")
add_includedirs(".")
add_includedirs("include")
add_includedirs("littlefs/v1")
add_defines("LFS_NAME_MAX=256", "BUILD_CONFIG_NAME=\"-generic\"", "BUILD_CONFIG=\"\"")
add_cxxflags("-std=gnu++11", "-DSPIFFS_USE_MAGIC_LENGTH=0", "-DSPIFFS_ALIGNED_OBJECT_INDEX_TABLES=1")
add_ldflags("-static-libstdc++","-static", "-static-libgcc")
before_build(function(target)
    outdata = os.iorun("git describe --tags --always")
    outdata = string.gsub(outdata, "\r", "")
    outdata = string.gsub(outdata, "\n", "")
    outdata = "VERSION=\""..outdata.."\""
    print(outdata)
    target:add("defines", outdata)

    outdata = os.iorun("git -C littlefs/v1 describe --tags")
    outdata = string.gsub(outdata, "\r", "")
    outdata = string.gsub(outdata, "\n", "")
    outdata = "LITTLEFS_VERSION=\""..outdata.."\""
    print(outdata)
    target:add("defines", outdata)
end)

target("mklittlefs-v2")
    set_kind("binary")
    add_files("main.cpp")
    add_files("littlefs/v2/*.c")
    add_includedirs(".")
    add_includedirs("include")
    add_includedirs("littlefs/v2")
    add_defines("LFS_NAME_MAX=256", "BUILD_CONFIG_NAME=\"-generic\"", "BUILD_CONFIG=\"\"")
    add_cxxflags("-std=gnu++11", "-DSPIFFS_USE_MAGIC_LENGTH=0", "-DSPIFFS_ALIGNED_OBJECT_INDEX_TABLES=1")
    add_ldflags("-static-libstdc++","-static", "-static-libgcc")
    before_build(function(target)
        outdata = os.iorun("git describe --tags --always")
        outdata = string.gsub(outdata, "\r", "")
        outdata = string.gsub(outdata, "\n", "")
        outdata = "VERSION=\""..outdata.."\""
        print(outdata)
        target:add("defines", outdata)

        outdata = os.iorun("git -C littlefs/v2 describe --tags")
        outdata = string.gsub(outdata, "\r", "")
        outdata = string.gsub(outdata, "\n", "")
        outdata = "LITTLEFS_VERSION=\""..outdata.."\""
        print(outdata)
        target:add("defines", outdata)
    end)


