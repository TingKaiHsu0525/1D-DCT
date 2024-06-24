
module loeffler_1d(
    input clk,
    input rstn,
    input signed [15:0] win0, win1, win2, win3, win4, win5, win6, win7,
    output reg signed[11:0] out0, out1, out2, out3, out4, out5, out6, out7
);

// 定義DCT轉換需要的係數（假定以固定點表示）
// 這裡的係數為簡化示例，實際應用應根據DCT公式進行準確計算
parameter PI = 3; // 3.141592654 * 2^15
parameter PT = 6; // 1.414213562 * 2^15


localparam A = 35; // 0.5 * cos(PI * 6 / 16) * 2^16
localparam B = 84; // 0.5 * sin(PI * 6 / 16) * 2^16
localparam C = 53; // cos(PI * 3 / 16) * 2^16
localparam D = 35; // sin(PI * 3 / 16) * 2^16
localparam E = 63; // cos(PI / 16) * 2^16
localparam F = 12; // sin(PI / 16) * 2^16



// 暫存器用於計算中間結果，這裡僅示範部分中間變量
reg signed [11:0] tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;
reg signed [11:0] tmp8, tmp9, tmp10, tmp11;

//reg [7:0] mem0 [0:63]; //hex 中的資料是16位數也就是8bits的二位元，所以一排可以存8個資料，共八排




always @(posedge clk or negedge rstn) begin

    if (!rstn) begin
        //Clear out
        out0 = 12'd0; out1 = 12'd0; out2 = 12'd0; out3 = 12'd0;
        out4 = 12'd0; out5 = 12'd0; out6 = 12'd0; out7 = 12'd0;
        /*//Clear tmp
        tmp0 = 32'd0; tmp1 = 32'd0; tmp2 = 32'd0; tmp3 = 32'd0; 
        tmp4 = 32'd0; tmp5 = 32'd0; tmp6 = 32'd0; tmp7 = 32'd0; 
        tmp8 = 32'd0; tmp9 = 32'd0; tmp10 = 32'd0; tmp11 = 32'd0;*/

    end else begin
        // Calculation
        //layer 1
        tmp0 <= win0 + win7; // vp0
        tmp1 <= win1 + win6; // vp1
        tmp2 <= win2 + win5; // vp2
        tmp3 <= win3 + win4; // vp3

        tmp4 <= win0 - win7;	// vn0
        tmp5 <= win1 - win6;	// vn1
        tmp6 <= win2 - win5;	// vn2
        tmp7 <= win3 - win4;	// vn3

        //layer 2
        tmp8 = tmp0 + tmp3;  // vp0+vp3
        tmp9 = tmp1 + tmp2;  // vp1+vp2
        tmp10 = tmp0 - tmp3; // vp0-vp3
        tmp11 = tmp1 - tmp2; // vp1-vp2

		
		//layer 3
        //*************施工*************
		out0 = (tmp8 + tmp9);
		out1 = ((((-tmp7)*D+tmp4*C)+(tmp6*E+tmp5*F))+((tmp7*C+tmp4*D) + ((-tmp6)*F+tmp5*E)))>>6;
		out2 = (tmp11*A+tmp10*B)>>6;
		out3 = (PT*(((-tmp7)*D+tmp4*C)-(tmp6*E+tmp5*F)))>>8;
		out4 = (tmp8 -tmp9);
		out5 = (PT*((tmp7*C+tmp4*D)-((-tmp6)*F+tmp5*E)))>>8;  
		out6 = ((-tmp11)*B+tmp10*A)>>6;
		out7 = ((((-tmp7)*D+tmp4*C)+(tmp6*E+tmp5*F))-((tmp7*C+tmp4*D) + ((-tmp6)*F+tmp5*E)))>>6;
		
		
    end
end

endmodule