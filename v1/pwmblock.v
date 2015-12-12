`default_nettype none

module pwmblock #(parameter CNT_WIDTH=8, DIV_WIDTH=8)
(input clk, input reset,
 input [CNT_WIDTH-1:0] increment, input [CNT_WIDTH-1:0] endval, input [CNT_WIDTH-1:0] match,
 input [DIV_WIDTH-1:0] scale, output reg epwm, output ppwm);

  reg [DIV_WIDTH-1:0] prescale;  // clock divider count down
  reg [CNT_WIDTH:0] counter;     // PWM counter (1 bit longer than actual count)

  assign ppwm=counter[CNT_WIDTH];  // proprotional output is carry bit

// Handle clock prescale
  always @(posedge clk)
    if (reset)
      prescale<=0;
    else
        if (prescale==0) prescale<=scale; else prescale<=prescale-1;
 
// Calculate equal area PWM
  always @(posedge clk)
    if (reset)
      epwm<=1'b0;
  else if (prescale==0)
    if (counter[CNT_WIDTH-1:0]>=match) epwm<=1'b0; else epwm<=1'b1;

// Add to counter
  always @(posedge clk)
    if (reset)
      counter<=0;
    else if (prescale==0)
      if (endval && counter=={ 1'b0, endval} ) counter<=0;
  else counter<= { 1'b0, counter[CNT_WIDTH-1:0] } + { 1'b0, increment};


   
endmodule

