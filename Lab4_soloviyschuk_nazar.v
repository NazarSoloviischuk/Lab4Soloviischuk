module lab4_soloviishchuk (
    input wire x3,
    input wire x2,
    input wire x1,
    output wire f_ddnf,
    output wire f_dknf,
    output wire f_mdnf,
    output wire f_mknf
);

    // ==========================================
    // 1. PDNF (Perfect Disjunctive Normal Form)
    // Based on the truth table (1 values)
    // ==========================================
    assign f_ddnf = (~x3 & ~x2 & ~x1) | 
                    (~x3 & ~x2 &  x1) | 
                    (~x3 &  x2 &  x1) | 
                    ( x3 & ~x2 &  x1);

    // ==========================================
    // 2. PCNF (Perfect Conjunctive Normal Form)
    // Based on the truth table (0 values)
    // ==========================================
    assign f_dknf = ( x3 | ~x2 |  x1) & 
                    (~x3 |  x2 |  x1) & 
                    (~x3 | ~x2 |  x1) & 
                    (~x3 | ~x2 | ~x1);

    // ==========================================
    // 3. MDNF (Minimized DNF) in NAND basis
    // Splitting into intermediate signals for unique structure
    // ==========================================
    wire m_term1 = ~(~x3 & ~x2);
    wire m_term2 = ~(~x3 &  x1);
    wire m_term3 = ~(~x2 &  x1);
    
    assign f_mdnf = ~(m_term1 & m_term2 & m_term3);

    // ==========================================
    // 4. MCNF (Minimized CNF) in NAND-AND basis
    // Corrected formula to ensure matching waveforms
    // ==========================================
    wire k_term1 = ~( x2 & ~x1);
    wire k_term2 = ~( x3 &  x2);
    wire k_term3 = ~( x3 & ~x1);
    
    // Standard logical AND between the terms
    assign f_mknf = k_term1 & k_term2 & k_term3;

endmodule
