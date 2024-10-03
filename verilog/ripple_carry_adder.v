module halfadd(S,C,A,B);
    input A,B;
    output S,C;
    
    xor xor1(S,A,B);
    and and1(C,A,B);

endmodule

module fulladd(S,Cout,A,B,Cin);
    input A,B,Cin;
    output S,Cout;
    wire w1,w2,w3;

    halfadd half1(w1,w2,A,B);
    halfadd half2(S,w3,Cin,w1);
    or or1(Cout,w2,w3);
endmodule


module rippleadd4h(S,A,B); //with halfadd

    input [3:0] A,B;
    output [4:0] S;
    output Cout;
    wire [3:1] C;

    halfadd half1(S[0],C[1],A[0],B[0]);

    fulladd full1(S[1],C[2],C[1],A[1],B[1]);
    fulladd full2(S[2],C[3],C[2],A[2],B[2]);
    fulladd full3(S[3],S[4],C[3],A[3],B[3]);

endmodule

module rippleadd4f(S,A,B,Cin); //with just fulladds
    input [3:0] A,B;
    input Cin;
    output [4:0] S;
    output Cout;
    wire [3:1] C;

    fulladd full1(S[0],C[1],Cin,A[0],B[0]);
    fulladd full2(S[1],C[2],C[1],A[1],B[1]);
    fulladd full3(S[2],C[3],C[2],A[2],B[2]);
    fulladd full4(S[3],S[4],C[3],A[3],B[3]);

endmodule
module rippleadd8(S,A,B);
    input [7:0] A,B;
    output [8:0] S;
    output Cout;
    wire [7:1] C;

    halfadd half1(S[0],C[1],A[0],B[0]);

    fulladd full1(S[1],C[2],C[1],A[1],B[1]);
    fulladd full2(S[2],C[3],C[2],A[2],B[2]);
    fulladd full3(S[3],C[4],C[3],A[3],B[3]);
    fulladd full4(S[4],C[5],C[4],A[4],B[4]);
    fulladd full5(S[5],C[6],C[5],A[5],B[5]);
    fulladd full6(S[6],C[7],C[6],A[6],B[6]);
    fulladd full7(S[7],S[8],C[7],A[7],B[7]);
    
endmodule

module main;
    reg [3:0] A1,B1;
    reg [7:0] A2,B2;
    reg Cin;
    wire [4:0] S1;
    wire [8:0] S2;
    wire Cout;

    rippleadd4f r4pple1(S1,A1,B1,Cin);
    rippleadd8 r8pple8(S2,A2,B2);

    initial
        begin
            A1=4'b0110;
            B1=4'b1110;
            Cin=0;
            A2=8'b10101101;
            B2=8'b00101001;

            #5;
            $display(A1,"+",B1," = ",S1);
            $display("%b",A1,"+","%b",B1," = %b",S1,"\n");
            $display(A2,"+",B2," = ",S2);
            $display("%b",A2,"+","%b",B2," = %b",S2);

        end

endmodule
