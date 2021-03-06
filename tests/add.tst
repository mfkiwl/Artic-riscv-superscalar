# x10 will store the number of passed tests
jal x1, begin

# Endless loop, FAIL
fail:
jal x1, fail

begin:
li x11, 0x00000001

# Test 1
li x1, 0x00000000
li x2, 0x00000000
li x3, 0x00000000
add x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 2
li x1, 0x00000001
li x2, 0x00000001
li x3, 0x00000002
add x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 3
li x1, 0xFFFF8000
li x2, 0x00000000
li x3, 0xFFFF8000
add x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Test 4
li x1, 0xFFFF8000
li x2, 0x80000000
li x3, 0x7FFF8000
add x4, x1, x2
bne x3, x4, fail
add x10, x10, x11

# Endless loop, SUCCESS
success:
jal x1, success
