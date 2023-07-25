using Test, MyLib2

@testset "MyLib2" begin
    buf = IOBuffer()
    greet(buf)
    @test String(take!(buf)) == "Hello World! This is MyLib2!"
end
