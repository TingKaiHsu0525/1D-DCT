`timescale 1ns/1ns
module loeffler_1d_tb;

parameter clk_time = 5;
parameter max_size = 16;
parameter out_size = 12;

wire [out_size-1:0] out0;
wire [out_size-1:0] out1;
wire [out_size-1:0] out2;
wire [out_size-1:0] out3;
wire [out_size-1:0] out4;
wire [out_size-1:0] out5;
wire [out_size-1:0] out6;
wire [out_size-1:0] out7;


reg rstn, clk;
reg [max_size-1:0] win0, win1, win2, win3, win4, win5, win6, win7;


integer i;
//integer j;
//integer handle1;

loeffler_1d dct_1d ( .clk(clk),
					 .rstn(rstn),
					 .win0(win0), .win1(win1), .win2(win2), .win3(win3), .win4(win4), .win5(win5), .win6(win6), .win7(win7),
					 .out0(out0), .out1(out1), .out2(out2), .out3(out3), .out4(out4), .out5(out5), .out6(out6), .out7(out7)
					);

reg [7:0] mem0 [0:63]; //hex 中的資料是16位數也就是8bits的二位元，所以一排可以存8個資料，共八排

initial begin
	$readmemh("C:/Users/abc12/Downloads/hex.txt", mem0);
end

initial
begin
	clk=0;
	forever
	#clk_time clk=~clk;	//Set clock with a period 10 units  5+5 10ns => 100Mhz
end


initial
begin

    //handle1 = $fopen("out.txt");


    rstn = 1'b0;
    i = 0;

    #10
	
	
    rstn = 1'b1;
	for (i = 0; i < 63; i = i + 8)
		begin
			win0 = mem0[i];
			win1 = mem0[i+1];
			win2 = mem0[i+2];
			win3 = mem0[i+3];
			win4 = mem0[i+4];
			win5 = mem0[i+5];
			win6 = mem0[i+6];
			win7 = mem0[i+7];
			#10;
		end
	#50
    //$fdisplay(handle1," %d, %d, %d, %d, %d, %d, %d, %d,", out0, out1, out2, out3, out4, out5, out6, out7);

	//#200 $fclose(handle1);
    #10 $finish;

end

endmodule
