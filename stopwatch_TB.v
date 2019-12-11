module stopwatch_TB;


reg start, stop, clk, rst;

wire [3:0]us;

wire [2:0]zs;



stopwatch STOPWATCH( .start(start), .stop(stop), .clk(clk), .rst(rst), .us(us), .zs(zs) );



always begin

#5 clk = !clk;

end



initial begin

clk = 1'b0;

rst = 1'b0;

start = 1'b0;

stop = 1'b0;

#10 rst = 1'b1;

#2 start = 1'b1;

#20 start = 1'b0;

#2000 stop = 1'b1;

#20 stop = 1'b0;

end



endmodule