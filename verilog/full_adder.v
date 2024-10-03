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
    or or2(Cout,w2,w3);

endmodule

module main;
    reg A,B,Cin;
    wire S,Cout;

    fulladd full1(S,Cout,A,B,Cin);

    initial
        begin
            A=1;
            B=1;
            Cin=0;
            #5;
            $display("Sum = ",S);
            $display("Cout = ",Cout);
        end
endmodule
