# ==========================================
# Testbench stimulus file for lab4_soloviishchuk
# Generates a 3-bit binary counter (x3, x2, x1)
# ==========================================

# Clocking x3 (MSB): 40ns low, 40ns high, repeats every 80ns
force x3 0 0ns, 1 {40ns} -repeat 80ns

# Clocking x2: 20ns low, 20ns high, repeats every 40ns
force x2 0 0ns, 1 {20ns} -repeat 40ns

# Clocking x1 (LSB): 10ns low, 10ns high, repeats every 20ns
force x1 0 0ns, 1 {10ns} -repeat 20ns

# Run simulation for one full cycle (8 states * 10ns)
run 80ns