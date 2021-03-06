# x10 will store the number of passed tests
jal x1, begin

# Endless loop, FAIL
fail:
jal x1, fail

begin:
li x11, 0x00000001

# Test 1
li x1, 0xFF00FF00
li x2, 0x0F0F0F0F
li x3, 0xFF0FFF0F
or x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 2
li x1, 0x0FF00FF0
li x2, 0xF0F0F0F0
li x3, 0xFFF0FFF0
or x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 3
li x1, 0x00FF00FF
li x2, 0x0F0F0F0F
li x3, 0x0FFF0FFF
or x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 4
li x1, 0xF00FF00F
li x2, 0xF0F0F0F0
li x3, 0xF0FFF0FF
or x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 5
li x1, 0xFF00FF00
li x2, 0xF0F0F0F0
li x3, 0xFFF0FFF0
or x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 6
li x1, 0x0FF00FF0
li x2, 0xF0F0F0F0
li x3, 0xFFF0FFF0
or x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 7
li x1, 0x0FF00FF0
li x2, 0xF0F0F0F0
li x3, 0xFFF0FFF0
or x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 8
li x1, 0xFF00FF00
li x2, 0x0F0F0F0F
li x3, 0xFF0FFF0F
or x4, x1, x2
bne x3, x4, fail
add x10, x10, x11


# Endless loop, SUCCESS
success:
jal x1, success
