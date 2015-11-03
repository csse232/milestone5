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
 //output       PCWriteCond;
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
   reg          IRWrite;
   reg          PCWrite;

   //state flip-flops
   reg [4:0]    current_state;
   reg [4:0]    next_state;

   //state definitions
   parameter    Fetch = 0;
   parameter    Other = 1;
   parameter    RType = 2;
	parameter    RWrite = 3;
	parameter    LWSW = 4;
	parameter    SW = 5;
	parameter    LW1 = 6;
	parameter    LW2 = 7;
	parameter    Imm = 8;
	parameter    Imm2 = 9;
	parameter    Jal1 = 10;
	parameter    Jal2 = 11;
	
	parameter    jr = 12;
	parameter    jump = 13;
	parameter    brancheq = 14;
	parameter    branchne = 15;
	
	parameter    in = 16;
	parameter    out = 17;

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
        
        case (current_state)
          
          Fetch:
            begin
					MemSrc = 0;
               MemRead = 1;
               IRWrite =  1;
					PCWrite = 1;
					SrcA = 0;
               SrcB = 1;
               
               
               ALUOp = 3'b010;
               
            end 
                         
          Other:
            begin
               SrcA = 1;
               SrcB = 0;
               ALUOp = 3'b010;
            end
        
          RType:
				begin
					SrcA = 1;
					SrcB = 0;
					ALUOp = Opcode;
				end
			RWrite:
				begin
					RegWrite = 1;
					MemtoReg = 2'b01;
					RegDest = 1;
				end
			LWSW:
				begin
					SrcA = 1;
					SrcB = 2'b10;
					ALUOp = 3'b010;
				end
			SW:
				begin
					MemWrite = 1;
					MemSrc = 1;
				end
			LW1:
				begin
					MemRead = 1;
					MemSrc = 1;
				end
			LW2:
				begin
				//make sure this is right
					RegWrite = 1;
					MemToReg = 0;
				end
			Imm:
				begin
					SrcA = 1;
					SrcB = 2'b10;
					ALUOp = Opcode;
				end
			Imm2:
				begin
					RegWrite = 1;
					MemtoReg = 2'b01;
					RegDest = 1;
				end
			Jal1:
				begin
					SrcA = 0;
					SrcB = 2'b01;
					ALUOp = 3'b010;
				end
			Jal2:
				begin
					RegWrite = 1;
					MemtoReg = 2'b01;
					RegDest = 3;//ra
					PCWrite = 1;
					PCSrc = 1;
				end
				
			jr:
				begin
					SrcA = 1;
					SrcB = 0;
					ALUOp = 3'b010;
					PCWrite = 1;
					PCSrc = 0;
				end
			
			jump:
				begin
					PCWrite = 1;
					PCSrc = 2'b01;
				end
			brancheq:
				begin
					SrcA = 1;
					SrcB = 0;
					ALUOp = 3'b011;
					BranchCond = 1;
					PCWrite = 1;
					PCSrc = 0;
				end
			branchne:
				begin
					SrcA = 1;
					SrcB = 0;
					ALUOp = 3'b011;
					BranchCond = 0;
					PCWrite = 1;
					PCSrc = 0;
				end
				
			in:
				begin
					RegWrite = 1;
					MemToReg = 2'b10;
					RegDest = 1;
				end
			out:
				begin
					OutputWrite = 1;
				end
			
          default:
            begin $display ("%i not implemented", current_state); end
          
        endcase
     end
                
   //NEXT STATE calculation (depends on current state and opcode)       
   always @ (current_state, next_state, Opcode)
     begin         

        $display("The current state is %d", current_state);
        
        case (current_state)
          
          Fetch:
            begin
               next_state = Other;
               $display("In Fetch, the next_state is %d", next_state);
            end
          
          Other: 
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
               
               $display("In Other, the next_state is %d", next_state);
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