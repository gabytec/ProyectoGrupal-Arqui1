module ResultMem320(
input  clk,
input  [9:0] H_Count_Value,
input  [9:0] V_Count_Value,
output logic [7:0] R,
output logic [7:0] G,
output logic [7:0] B
);

	
	logic [7:0]  result;
	logic [17:0] contadorDir = 0;
	
	Mem320 mem(.address(contadorDir), .result(result));
	
	always@(posedge clk) begin
		if(H_Count_Value <= 479 && V_Count_Value <= 319) begin
				R = result;
				G = result;
				B = result;
				contadorDir <= contadorDir + 1;
		end
		else begin
				R = 8'bx;
				G = 8'bx;
				B = 8'bx;
		end
	end



endmodule 