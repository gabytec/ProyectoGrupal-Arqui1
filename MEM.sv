module MEM (input logic [6:0] RdOut, branchResult, input logic [31:0] AluResult, input logic [4:0] OpCode,output logic [31:0] Result,
output logic [6:0] RdWb,output logic Wrenable,output logic [6:0] BranchResultOut);

int Addr;
int pixCounter=0;
int memCounter=0;

//Memorias que contienen la imagen inicial
reg [7:0] DataMemory1 [0:64999];
reg [7:0] DataMemory2 [0:64999];
reg [7:0] DataMemory3 [0:64999];
reg [7:0] DataMemory4 [0:64999];
reg [7:0] DataMemory5 [0:64999];
reg [7:0] DataMemory6 [0:64999];
reg [7:0] DataMemory7 [0:64999];
reg [7:0] DataMemory8 [0:64999];
reg [7:0] DataMemory9 [0:64999];
reg [7:0] DataMemory10 [0:29391];


//Memorias donde se guardan los valores finales
reg [7:0] OutMemory1 [0:65000];

initial begin
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel1.txt", DataMemory1);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel2.txt", DataMemory2);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel3.txt", DataMemory3);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel4.txt", DataMemory4);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel5.txt", DataMemory5);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel6.txt", DataMemory6);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel7.txt", DataMemory7);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel8.txt", DataMemory8);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel9.txt", DataMemory9);
	$readmemb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\Pixel10.txt", DataMemory10);
end

always @(OpCode) begin
	
	if(OpCode == 6) begin
		Addr = AluResult;
		RdWb = RdOut;
		BranchResultOut = branchResult;
		Wrenable =1;
		if(Addr <65000)
			Result = DataMemory1[Addr];
		else if(Addr < 130000)
			Result = DataMemory2[Addr];
		else if(Addr < 195000)
			Result = DataMemory3[Addr];
		else if(Addr < 260000)
			Result = DataMemory4[Addr];
		else if(Addr < 325000)
			Result = DataMemory5[Addr];
		else if(Addr < 390000)
			Result = DataMemory6[Addr];
		else if(Addr < 455000)
			Result = DataMemory7[Addr];
		else if(Addr< 520000) 
			Result = DataMemory8[Addr];
		else if(Addr < 585000)
			Result = DataMemory9[Addr];
		else
			Result = DataMemory10[Addr];
	end 
	
	else if (OpCode == 10) begin
		RdWb = 0;
		BranchResultOut = 0;
		Wrenable =0;
		
		if (pixCounter > 304200) begin
			pixCounter =0;
			$writememb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\OutMemory1.txt",OutMemory1);
		end
		else begin
			OutMemory1[pixCounter]=AluResult[31:0];
			pixCounter = pixCounter +1;
			memCounter = memCounter +1;
			$writememb("C:\\Users\\bryan\\Desktop\\SegundoProyecto\\OutMemory1.txt",OutMemory1);
		end
	end
end
endmodule
		
		/*
		if (pixCounter > 65000) begin
			pixCounter =0;
		end
		
		
		else if(memCounter <65000) begin
			OutMemory1[pixCounter]=AluResult[7:0];
			pixCounter = pixCounter +1;
			memCounter = memCounter +1;
		end
		
		else if(memCounter >=65000 && Addr < 130000) begin
			OutMemory2[pixCounter]=AluResult[7:0];
			pixCounter = pixCounter +1;
			memCounter = memCounter +1;

		end
		else if(memCounter >=130000 && Addr < 195000) begin
			OutMemory3[pixCounter]=AluResult[7:0];
			pixCounter = pixCounter +1;
			memCounter = memCounter +1;
		end
		else if(memCounter >=195000 && Addr < 260000) begin
			OutMemory4[pixCounter]=AluResult[7:0];
			pixCounter = pixCounter +1;
			memCounter = memCounter +1;
		end
		else if(memCounter >=260000) begin
			OutMemory5[pixCounter]=AluResult[7:0];
			pixCounter = pixCounter +1;
			memCounter = memCounter +1;
		end
		
	end
	*/
	
	
 