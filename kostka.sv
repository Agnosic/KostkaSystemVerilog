
module SVkostka(
    input logic clk,
    input logic button,
    input logic reset,
    output logic [6:0] seg 
); 
typedef enum logic [2:0]{k0, k1, k2, k3, k4, k5, k6} st_typ;
st_typ st_now, st_next;
	initial
	begin
		st_now = k1;
		st_next = k2;
		seg <= "1111111";
	end
    always @ (  posedge clk )
	begin
        if ( reset == 1'b0 ) st_now = k0;
        else st_now = st_next;
    end

   always @ ( posedge clk )
	begin
        case ( st_now ) 
        k1:
        begin
            if ( button == 1'b0 ) 
            begin
                seg <= 7'b1111001;
            end
            else
            begin 
                st_next = k2;
            end
        end
        k2:
        begin
            if ( button == 1'b0 ) 
            begin
                seg <= 7'b0100100;
            end
            else
            begin 
                st_next = k3;
            end
        end
        k3:
        begin
            if ( button == 1'b0 ) 
            begin
                seg <= 7'b0110000;
            end
            else
            begin 
                st_next = k4;
            end
        end
        k4:
        begin
            if ( button == 1'b0 ) 
            begin
                seg <= 7'b0011001;
            end
            else
            begin 
                st_next = k5;
            end
        end
        k5:
        begin
            if ( button == 1'b0 ) 
            begin
                seg <= 7'b0010010;
            end
            else
            begin 
                st_next = k6;
            end
        end
        k6:
        begin
            if ( button == 1'b0 ) 
            begin
                 seg <= 7'b0000010;
            end
            else
            begin 
                st_next = k1;
            end
        end
        k0:
        begin
            seg <= 7'b1111111;
            st_next = k1;
        end
        default :
        begin
            seg <= 7'b1111111;
        end
        endcase
    end
endmodule 
