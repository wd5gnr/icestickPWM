`default_nettype none
// Handy wrapper for proportional
module ppwmblock #(parameter CNT_WIDTH=8, DIV_WIDTH=8)
  (input clk, input reset, input [CNT_WIDTH-1:0] duty, input [DIV_WIDTH-1:0] scale, output pwm);
  pwmblock #(.CNT_WIDTH(CNT_WIDTH), .DIV_WIDTH(DIV_WIDTH)) pwmb(clk,reset,duty,0,0,scale,,pwm);
endmodule
