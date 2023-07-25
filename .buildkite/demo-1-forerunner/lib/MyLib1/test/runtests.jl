using Test, MyLib1

@testset "MyLib2" begin
    buf = IOBuffer()
    greet(buf)
    @test String(take!(buf)) == "Hello World! This is MyLib1!"
end
