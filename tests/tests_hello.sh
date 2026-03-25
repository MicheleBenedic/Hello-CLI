#!/usr/bin/bash

echo "!!!HELLO-CLI PROGRAM TEST VERIFICATION!!!"
echo " "

world="Hello, World!"
mario="Hello, Mario!"
friends="Hello, Mario!
Hello, Luigi!
Hello, Peach!"
surname="Hello, De Rossi!"
party=""
exit='0'
version="HELLO-CLI program in C, Version: 1.0.0"

output_world=$(./hello)
output_mario=$(./hello Mario)
output_friends=$(./hello Mario Luigi Peach)
output_party=$(./hello $(seq -f "name%g" 1 100) > /dev/null)
output_help=$(./hello --help > /dev/null) 
output_exit=$(echo $?)
output_surname=$(./hello "De Rossi")
output_version=$(./hello --version)


if [[ "$output_world" == "$world" ]]; then
    echo "Hello World Test passed"
else
    echo "Test 0 failed: expected 'Hello, World!', got '$output_world'"
fi   

if [[ "$output_mario" == "$mario" ]]; then
    echo "Hello Mario Test passed"
else
    echo "Test 1 failed: expected 'Hello, Mario!', got '$output_mario'"
fi

if [[ "$output_friends" == "$friends" ]]; then
    echo "Hello Friends Test passed"
else
    echo "Test 2 failed: expected $friends, got '$output_friends'"
fi

if [[ "$output_party" == "$party" ]]; then
    echo "Info Test passed"
else
    echo "Test 3 failed: expected $party, got '$output_party'"
fi

if [[ "$output_exit" == "$exit" ]]; then
    echo "Info Test passed"
else
    echo "Test 3 failed: expected $help, got '$output_help'"
fi

if [[ "$output_surname" == "$surname" ]]; then
    echo "Surname Test passed"
else
    echo "Test 4 failed: expected $surname, got '$output_surname'"
fi

if [[ "$output_version" == "$version" ]]; then
    echo "Version Test passed"
else
    echo "Test 5 failed: expected $version, got '$output_version'"
fi