// FA_Gate.v
// Gate-level model of a 1-bit full adder. No delays yet -- that starts in
// Task 2. This task is purely about gate ordering.
//
// Part (a): leave this file exactly as it is, compile, and simulate.
// Part (b): AFTER completing part (a), come back and reorder the five gate
//           instantiations below into any different sequence, then
//           re-simulate with the same tb.v and compare.

module FA_Gate(
  input  a,
  input  b,
  input  cin,
  output sum,
  output cout
);
  wire ps, pc1, pc2;

// We moved the final OR gate to the very top, and mixed the rest.
  or  (cout, pc1, pc2);
  and (pc1, a,   b);
  xor (sum, cin, ps);
  and (pc2, cin, ps);
  xor (ps,  a,   b);

endmodule

/*
TASK 1 QUESTION ANSWER:
1(b) vs 1(a): The waveform does not change. 
              Verilog gate-level modeling describes physical circuit structure, meaning all statements are executed in parallel. 
              Reordering the text does not change how the hardware is physically wired.

1(c) vs 1(a): The waveform does change
              Adding the delay value using # models the physical time it takes for a signal to transition through a logic gate. 
              Because the final outputs depend on intermediate internal wires, these gate delays stack, causing the outputs to update later in time.
*/