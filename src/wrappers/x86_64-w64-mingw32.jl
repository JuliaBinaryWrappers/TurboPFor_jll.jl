# Autogenerated wrapper script for TurboPFor_jll for x86_64-w64-mingw32
export libic

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `libic`
const libic_splitpath = ["bin", "libic.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libic_path = ""

# libic-specific global declaration
# This will be filled out by __init__()
libic_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libic = "libic.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"TurboPFor")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libic_path = normpath(joinpath(artifact_dir, libic_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libic_handle = dlopen(libic_path)
    push!(LIBPATH_list, dirname(libic_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(vcat(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ';')

    
end  # __init__()

