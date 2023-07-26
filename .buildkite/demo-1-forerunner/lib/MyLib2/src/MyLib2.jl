module MyLib2


greet(io::IO = stdout) = print(io, "Hello World! This is MyLib2!")

export greet

end # module MyLib2
