module PackageToTest
using Test, Tracy

export @testset_tracepoint, recursive_function

# This macro just allows us to more easily write:
#
# @testset "Foo" begin
#     @tracepoint "Foo" begin
#         ...
#     end
# end
#
# as just:
# @testsuite_tracepoint "Foo" begin
#     ...
# end
macro testset_tracepoint(name, body)
    body_with_tracepoint =
        Expr(:block, Expr(:macrocall, Symbol("@tracepoint"), __source__, name, esc(body)))
    return Expr(:macrocall, Symbol("@testset"), __source__, name, body_with_tracepoint)
end

# Test function that does recursion to showcase how `@tracepoint` works
function recursive_function(N)
    @tracepoint "recursive_function" begin
        if N <= 1
            @info("Hit the base case!")
            sleep(0.01)
            @test true
            return 1
        end
        return recursive_function(div(N, 2))
    end
end

end # module
