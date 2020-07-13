module CPU #(parameter NUM = 1)(input logic clk, output logic Done);


//
logic [31:0]branchResultOut;

//MEM->Deco
logic [31:0] Result;
logic [31:0] Instruccion;
logic[8:0] RdWb;

//
logic [4:0] OpCodeID;
logic [31:0]  RdID;
logic [31:0]  RsID;
logic [31:0]  RtID;
logic [31:0]  RsiID;
logic clockOutID;

//
logic [4:0] OpCodeIDEX;
logic [31:0]  RdIDEx;
logic [31:0]  RsIDEx;
logic [31:0]  RtIDEx;
logic [31:0]  RsiIDEx;
logic clockOutIDEx;

//
logic [31:0]RdOut, RdMem,branchResult;
logic [4:0] OpCode;
logic [31:0] AluResult, MemResult, MemOut;

//

logic [4:0] OpCodeOutEXMEM;
logic [8:0] RdOutOutEXMEM, RdMemEXMEM;
logic [31:0]  BranchResultOutEXMEM;
logic [31:0]  AluResultOutEXMEM, MemResultEXMEM, MemOutEXMEM;

//

logic [31:0] resultMEM;
logic [6:0] rdMEM;
logic Wrenable;
logic [6:0] branchResultMEM;

//

logic [31:0] resultMWB;
logic [6:0] rdMWB;
logic WrenableMWB=0;
logic [6:0] branchResultMWB;

/*
//Memoria_Procesador IF(.branchResultOut(branchResultMWB),.clk(clk),.Instruccion(Instruccion),.Done(Done));
Memoria_Procesador IF(.branchResultOut(branchResult),.clk(clk),.Instruccion(Instruccion),.Done(Done));

DECO deco (.Result(AluResult),.RdWb(RdOut),.Wrenable(),.Instruccion(Instruccion),.clock(clk),.OpCode(OpCodeID),.Rd(RdID),.Rs(RsID),.Rsi(RsiID),.Rt(RtID),.clockOut(clockOutID));

RegIDEX regIDEX(.clk(clk),.OpCode(OpCodeID),.Rd(RdID),.Rs(RsID),.Rt(RtID),.Rsi(RsiID),.OpCodeOut(OpCodeIDEX),.RdOut(RdIDEx),.RsOut(RsIDEx),.RtOut(RtIDEx),.RsiOut(RsiIDEx));

ALU alu(.OPCODE(OpCodeIDEX), .Rd(RdIDEx), .Rs(RsIDEx), .Rsi(RsiIDEx), .Rt(RtIDEx),.RdOut(), .RdMem(RdMem), .branchResult(branchResult),.OpCode(OpCode), .AluResult(AluResult), .MemResult(MemResult),.MemOut(MemOut),.Wrenable(Wrenable));

RegEXMEM regEXMEM(.clk(clk),.OpCode(OpCode),.RdOut(),.RdMem(RdMem),.BranchResult(branchResult),.AluResult(AluResult),.MemResult(MemResult),.MemOut(MemOut),.OpCodeOut(OpCodeOutEXMEM),.RdOutOut(RdOutOutEXMEM),.RdMemOut(RdMemEXMEM),.BranchResultOut(BranchResultOutEXMEM),.AluResultOut(AluResultOutEXMEM),.MemResultOut(MemResultEXMEM),.MemOutOut(MemOutEXMEM));

MEM #(NUM) memData(.Wrenable(Wrenable), .RdOut(RdOutOutEXMEM), .RdMem(RdMemEXMEM),.branchResult(BranchResultOutEXMEM),.MemResult(MemResultEXMEM),.MemWB(MemOutEXMEM), .AluResult(AluResultOutEXMEM), .OpCode(OpCodeOutEXMEM),.Result(AluResult),.RdWb(RdOut),.BranchResultOut(branchResultMEM));

RegMEMWB regmemwb(.clk(clk),.Result(resultMEM),.RdWb(rdMEM), .BranchResult(branchResultMEM),.ResultOut(resultMWB),.RdWbOut(rdMWB),.BranchResultOut(branchResultMWB),.WrenableOut(WrenableMWB));

*/
Memoria_Procesador IF(.branchResultOut(branchResult),.clk(clk),.Instruccion(Instruccion),.Done(Done));

DECO deco (.Result(AluResult),.RdWb(RdOut),.Wrenable(Wrenable),.Instruccion(Instruccion),.clock(clk),.OpCode(OpCodeID),.Rd(RdID),.Rs(RsID),.Rsi(RsiID),.Rt(RtID),.clockOut(clockOutID));

RegIDEX regIDEX(.clk(clk),.OpCode(OpCodeID),.Rd(RdID),.Rs(RsID),.Rt(RtID),.Rsi(RsiID),.OpCodeOut(OpCodeIDEX),.RdOut(RdIDEx),.RsOut(RsIDEx),.RtOut(RtIDEx),.RsiOut(RsiIDEx));

ALU alu(.OPCODE(OpCodeIDEX), .Rd(RdIDEx), .Rs(RsIDEx), .Rsi(RsiIDEx), .Rt(RtIDEx),.RdOut(RdOut), .RdMem(RdMem), .branchResult(branchResult),.OpCode(OpCode), .AluResult(AluResult), .MemResult(MemResult),.MemOut(MemOut),.Wrenable(Wrenable));

RegEXMEM regEXMEM(.clk(clk),.OpCode(OpCode),.RdOut(RdOut),.RdMem(RdMem),.BranchResult(branchResult),.AluResult(AluResult),.MemResult(MemResult),.MemOut(MemOut),.OpCodeOut(OpCodeOutEXMEM),.RdOutOut(RdOutOutEXMEM),.RdMemOut(RdMemEXMEM),.BranchResultOut(BranchResultOutEXMEM),.AluResultOut(AluResultOutEXMEM),.MemResultOut(MemResultEXMEM),.MemOutOut(MemOutEXMEM));

MEM #(NUM) memData(.Wrenable(Wrenable), .RdOut(RdOutOutEXMEM), .RdMem(RdMemEXMEM),.branchResult(BranchResultOutEXMEM),.MemResult(MemResultEXMEM),.MemWB(MemOutEXMEM), .AluResult(AluResultOutEXMEM), .OpCode(OpCodeOutEXMEM),.Result(AluResult),.RdWb(RdOut),.BranchResultOut(branchResultMEM));

RegMEMWB regmemwb(.clk(clk),.Result(resultMEM),.RdWb(rdMEM), .BranchResult(branchResultMEM),.ResultOut(resultMWB),.RdWbOut(rdMWB),.BranchResultOut(branchResultMWB),.WrenableOut(WrenableMWB));
endmodule 
