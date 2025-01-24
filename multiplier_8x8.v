
module mul2x2(
input [1:0]a,
input [1:0]b,
output [3:0]out
);

wire w1,w2,w3,w4;
and A1(w1,a[1],b[1]);
and A2(w2,a[1],b[0]);
and A3(w3,a[0],b[1]);
and A4(out[0],a[0],b[0]);
and A5(out[3],w1,w4);
and A6(w4,w2,w3);
xor x1(out[2],w1,w4);
xor x2(out[1],w2,w3);
endmodule

///////////////////////////////////////////////////////

module mul4x4 
(
    input [3:0]A,
    input [3:0]B,
    output [7:0]C
);
 wire [3:0] tmp1, tmp2, tmp3, tmp4;
    mul2x2 mu1(A[3:2], B[3:2], tmp1);
    mul2x2 mu2(A[1:0], B[3:2], tmp2);
    mul2x2 mu3(A[3:2], B[1:0], tmp3);
    mul2x2 mu4(A[1:0], B[1:0], tmp4);

assign C=((tmp1)<<4)+((tmp2)<<2)+((tmp3)<<2)+((tmp4));
endmodule
module mul8x8
(
    input [7:0]A,
    input [7:0]B,
    output wire [15:0]C
);
    wire [7:0] tmp1, tmp2, tmp3, tmp4;
    mul4x4 mul1(A[7:4], B[7:4], tmp1);
    mul4x4 mul2(A[3:0], B[7:4], tmp2);
    mul4x4 mul3(A[7:4], B[3:0], tmp3);
    mul4x4 mul4(A[3:0], B[3:0], tmp4);
    assign C = ((tmp1)<<8)+((tmp2)<<4)+((tmp3)<<4)+((tmp4));        
endmodule
