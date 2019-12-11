module flag(

    start, stop, rst, clk, F);



input start, stop, rst, clk;

output F;


reg F_reg, F_next;



always @(*) begin
    F_next = F_reg;
    if( stop ) begin
        F_next = 1'b0;
    end
    else
	if( start ) begin
            F_next = 1'b1;
    end

end



always @(posedge clk, negedge rst) begin

    if( !rst )

        F_reg <= 1'b0;

    else

        F_reg <= F_next;

end



assign F = F_reg;



endmodule