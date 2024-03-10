
module contador_163_5k ( input clock       , 
                      input clr         , 
                      input ld          , 
                      input ent         , 
                      input enp         , 
                      input [3:0] D     , 
                      output reg [15:0]Q, 
                      output reg rco
                    );

	 initial begin
		Q = 16'd0;
    end
	 
    always @ (posedge clock)
        if (~clr)               Q <= 16'd0;
        else if (~ld)           Q <= D;
        else if (ent && enp)    Q <= Q + 1;
        else                    Q <= Q;
 
    always @ (Q or ent)
        if (ent && (Q == 16'd10))   rco = 1;
        else                          rco = 0;
endmodule