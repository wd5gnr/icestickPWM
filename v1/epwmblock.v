`default_nettype none
  // Handy wrapper for equal area
module epwmblock #(parameter CNT_WIDTH=8, DIV_WIDTH=8)
  (input clk, input reset, input [CNT_WIDTH-1:0] endval,
   input [CNT_WIDTH-1:0] match, input [DIV_WIDTH-1:0] scale, output pwm);
  pwmblock #(.CNT_WIDTH(CNT_WIDTH), .DIV_WIDTH(DIV_WIDTH)) pwmb(clk,reset,1,endval,match,scale,pwm,);
endmodule
