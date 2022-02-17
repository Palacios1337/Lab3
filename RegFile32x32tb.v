module RegFile32x32tb;

	reg [4:0]SA;
	reg [4:0]SB;
	reg [4:0]DA;
	reg En;
	reg Reset;
	reg Clock;
	
	reg [31:0]D;
	wire [31:0]A;
	wire [31:0]B;
	
	Registerfile32x32 Test1(.A(A), .B(B), .SA(SA), .SB(SB), .D(D), .DA(DA), .En(En), .Reset(Reset), .Clock(Clock));
	
	always begin
	#50 Clock <= ~Clock;
	end
	
	//initial begin
	//	Clock = 0;
	//	Reset = 1;
	//#50
	//	Reset = 0;
	//	DA = 5'b00101;
	//	SA = 5'b00101;
	//	D = 32'b00111;
	//	SB = 5'b00110;
	//	En = 1;
	//#50
	//	DA = 5'b00110;
	//	D = 32'b01101;
	//	En = 1;
	//#250
	//	$finish;
	//end
	
always begin
	D <= {$random, $random}; // $random is a system 
	//command that generates a 32 random number
	SA <= SA + 5'b1;
	SB <= SB + 5'b1;
	DA <= DA + 5'b1;
	#100;
end

initial begin
	Clock = 0;
	Reset = 0;
	DA <= 0;
	SA <= 0;
	SB <= 0;
	En <= 1;
	#30000;
	En <= 0;
	#20000;
	Reset = 1;
	#20000;
$finish;


end
		
	
endmodule
