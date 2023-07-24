using Test, Tracy, PackageToTest

# Only wait upon Tracy if someone has started up Tracy and notified us of it, as our CI pipeline does
if haskey(ENV, "TRACY_PORT")
    @info("Julia", pid=Base.getpid(), port=ENV["TRACY_PORT"])
    Tracy.wait_for_tracy()
end

@testset_tracepoint "Initial tests" begin
    @testset_tracepoint "Test suite 1" begin
        sleep(0.01)
        @test true
    end

    @testset_tracepoint "Test suite 2" begin
        recursive_function(100)
    end
end
