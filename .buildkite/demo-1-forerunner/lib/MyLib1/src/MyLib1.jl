module MyLib1

greet(io::IO = stdout) = print(io, "Hello World! This is MyLib1!")

export greet

end # module MyLib1
