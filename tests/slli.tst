# x10 will store the number of passed tests
jal x1, begin

# Endless loop, FAIL
fail:
jal x1, fail

begin:
li x11, 0x00000001

# Test 1
li x1, 0x00000001
li x3, 0x00000001
slli x4, x1, 0x000
bne x3, x4, fail
add x10, x10, x11

# Test 2
li x1, 0x00000001
li x3, 0x00000002
slli x4, x1, 0x001
bne x3, x4, fail
add x10, x10, x11

# Test 3
li x1, 0x00000001
li x3, 0x00000080
slli x4, x1, 0x007
bne x3, x4, fail
add x10, x10, x11

# Test 4
li x1, 0x00000001
li x3, 0x00004000
slli x4, x1, 0x00E
bne x3, x4, fail
add x10, x10, x11

# Test 5
li x1, 0x00000001
li x3, 0x80000000
slli x4, x1, 0x01F
bne x3, x4, fail
add x10, x10, x11

# Test 6
li x1, 0xFFFFFFFF
li x3, 0xFFFFFFFF
slli x4, x1, 0x000
bne x3, x4, fail
add x10, x10, x11

# Test 7
li x1, 0xFFFFFFFF
li x3, 0xFFFFFFFE
slli x4, x1, 0x001
bne x3, x4, fail
add x10, x10, x11

# Test 8
li x1, 0xFFFFFFFF
li x3, 0xFFFFFF80
slli x4, x1, 0x007
bne x3, x4, fail
add x10, x10, x11

# Endless loop, SUCCESS
success:
jal x1, success
