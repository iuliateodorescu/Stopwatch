module counter #(
    parameter max_v,
	parameter w = $clog2(max_v),
    parameter initial_v = {w{1'b0}})(
    clk, rst, start, count, out_en);
    
input clk, rst, start;
output [w-1:0]count;
output out_en;

reg [w-1:0]count_reg, count_next;
reg out_en_next, out_en_reg;


always @(*) begin
    count_next = count_reg;
	out_en_next = out_en_reg;
    if( start ) begin
        if( count_reg < max_v ) begin

            count_next = count_reg + 1'b1;
			
		end

        else begin

            count_next = initial_v;
			
		end
		
		if( count_reg == max_v-1 ) begin
		    out_en_next = 1'b1;
		end
		else begin
		    out_en_next = 1'b0;
		end

    end

end



always @(posedge clk, negedge rst) begin
    if( !rst ) begin

      count_reg <= initial_v;
	  out_en_reg <= 1'b0;

	end
    else begin

      count_reg <= count_next;
	  out_en_reg <= out_en_next;
	  
	end

end



assign count = count_reg;
assign out_en = out_en_reg;



endmodule