module stopwatch(

    start, stop, clk, rst, us, zs);



input start, stop, clk, rst;

output [3:0]us;

output [2:0]zs;



wire [3:0] COUNT9;

wire [2:0] COUNT5;

wire F;
wire en;



flag FLAG( .start(start), .stop(stop), .rst(rst), .clk(clk), .F(F) );

counter #( .max_v(9) ) USCounter( .start(F), .clk(clk), .rst(rst), .count(COUNT9), .out_en(en) );

counter #( .max_v(5) ) ZSCounter( .start(en), .clk(clk), .rst(rst), .count(COUNT5) );

assign us = COUNT9;

assign zs = COUNT5;



endmodule