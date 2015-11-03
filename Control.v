`timescale 1ns / 100ps

module MIPS_control_unit (ALUOp,
                          SrcA,
                          SrcB,
                          MemtoReg,
                          RegDest,
                          RegWrite, 
                          MemRead,
                          MemWrite,
 //                       IorD,
                          IRWrite, 
                          PCWrite,
//                        PCWriteCond,
                          PCSrc,
                          Opcode,
                          current_state,
                          next_state,
                          CLK,
                          Reset,
								  
								  MemSrc,
								  OutputWrite,
								  BranchCond
                          );

   output [1:0] ALUOp;
   output [1:0] PCSrc;
   output [1:0] SrcB;
   output       SrcA;
   output [1:0] MemtoReg;
   output       RegDest;
   output       RegWrite;
   output       MemRead;
   output       MemWrite;
 //output       IorD;
   output       IRWrite;
   output       PCWrite;
   output       PCWriteCond;
   output [3:0] current_state;
   output [3:0] next_state;
	output		 MemSrc;
	output       OutputWrite;
	output       BranchCond;
	

   input [3:0]  Opcode;
   input        CLK;
   input        Reset;

   reg [1:0]    ALUOp;
   reg [1:0]    PCSrc;
   reg [1:0]    SrcB;
   reg          SrcA;
   reg          MemtoReg;
   reg          RegDest;
   reg          RegWrite;
   reg          MemRead;
   reg          MemWrite;
   reg          IorD;
   reg          IRWrite;
   reg          PCWrite;
   reg          PCWriteCond;

   //state flip-flops
   reg [3:0]    current_state;
   reg [3:0]    next_state;

   //state definitions
   parameter    Fetch = 0;
   parameter    Decode = 1;
   parameter    Mem1 = 2;
   parameter    LW1 = 3;
   parameter    LW2 = 4;
   parameter    SW1 = 5;
   parameter    R_Execution = 6;
   parameter    R_Write = 7;
   parameter    Branch = 8;
   parameter    Jump = 9;

   //register calculation
   always @ (posedge CLK, posedge Reset)
     begin
        if (Reset)
          current_state = Fetch;
        else 
          current_state = next_state;
     end


   //OUTPUT signals for each state (depends on current state)
   always @ (current_state)
     begin
        //Reset all signals that cannot be don't cares
        RegWrite = 0; 
        MemRead = 0;
        MemWrite = 0; 
        IRWrite = 0; 
        PCWrite = 0;
        PCWriteCond = 0;
        
        case (current_state)
          
          Fetch:
            begin
               MemRead = 1;
               SrcA = 0;
               IorD = 0;
               IRWrite =  1;
               SrcB = 1;
               ALUOp = 0;
               PCWrite = 1;
               PCSrc = 0;
            end 
                         
          Decode:
            begin
               SrcA = 0;
               SrcB = 3;
               ALUOp = 0;
            end
        
          R_Execution:
            begin
               SrcA = 1;
               SrcB = 0;
               ALUOp = 2;
            end
        
          R_Write:
            begin
               RegDest = 1;
               RegWrite = 1;
               MemtoReg = 0;
            end
        
          Branch:
            begin
               SrcA = 1;
               SrcB = 0;
               ALUOp = 1;
               PCWriteCond = 1;
               PCSrc = 1;
            end
        
          Jump:
            begin
               PCWrite = 1;
               PCSrc = 2;
            end
          
          Mem1:
            begin
               $display ("Mem1 outputs not implemented"); 
            end
        
        
          default:
            begin $display ("not implemented"); end
          
        endcase
     end
                
   //NEXT STATE calculation (depends on current state and opcode)       
   always @ (current_state, next_state, Opcode)
     begin         

        $display("The current state is %d", current_state);
        
        case (current_state)
          
          Fetch:
            begin
               next_state = Decode;
               $display("In Fetch, the next_state is %d", next_state);
            end
          
          Decode: 
            begin       
               $display("The opcode is %d", Opcode);
               case (Opcode)
                 0:
                   begin
                      next_state = R_Execution;
                      $display("The next state is R");
                   end
                 2:
                   begin
                      next_state = Jump;
                      $display("The next state is Jump");
                   end
                 4:
                   begin
                      next_state = Branch;
                      $display("The next state is Branch");
                   end
                 35:
                   begin
                      next_state = Mem1;
                      $display("The next state is Mem");
                   end
                 43:
                   begin next_state = Mem1;
                      $display("The next state is Mem");
                   end
                 default:
                   begin 
                      $display(" Wrong Opcode %d ", Opcode);  
                      next_state = Fetch; 
                   end
               endcase  
               
               $display("In Decode, the next_state is %d", next_state);
            end
          
          R_Execution:
            begin
               next_state = R_Write;
               $display("In R_Exec, the next_state is %d", next_state);
            end
          
          R_Write:
            begin
               next_state = Fetch;
               $display("In R_Write, the next_state is %d", next_state);
            end
          
          Branch:
            begin
               next_state = Fetch;
               $display("In Branch, the next_state is %d", next_state);
            end

          Mem1:
            begin
               //not implemented - forcing return to cycle 1
               next_state = Fetch;
               $display("In Mem1, the next_state is %d", next_state);
            end
          
          Jump:
            begin
               next_state = Fetch;
               $display("In Jump, the next_state is %d", next_state);
            end
          
          default:
            begin
               $display(" Not implemented!");
               next_state = Fetch;
            end
          
        endcase
        
        $display("After the tests, the next_state is %d", next_state);
                
     end

endmodule