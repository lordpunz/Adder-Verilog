module halfadd(S,C,A,B);
    input A,B;
    output S,C;

    xor xor1(S,A,B);
    and and1(C,A,B);
endmodule

module main;
    reg A,B;
    wire S,C;
    
    halfadd half1(S,C,A,B);
    
    initial begin
        A=1;
        B=0;
        #5;
        $display ("Sum = ",S);
        $display("Carry = ",C);
        
    end
endmodule
