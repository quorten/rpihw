/* Hardware design to simulate my rpihw first hardware project board's
   glue logic.  Good sanity check, to make sure that the board at
   least works at a superficial level.  Yeah I wish the software were
   better integrated, but this is good enough for the time being.

   N.B. In the future we could turn this into an actual FPGA design.
   Or we could just leave it to an AVR microcontroller to perform the
   equivalent as it seems they're good enough when you'd otherwise
   want low-speed, simple, and cheap FPGA design.  */

`ifndef RPIHW_V
`define RPIHW_V

`include "common.vh"
`include "stdlogic.v"

/* L293D: Motor driver IC model in Verilog.  Obviously this can't be
   substituted in an FPGA for a real chip unless you have an FPGA with
   a lot of drive current.  N.B.: See `l293_hbctl()` for a sane
   alternative to place within an FPGA.  */
module l293d(en1, in1, out1, gnd1, gnd2, out2, in2, vs,
	     en2, in3, out3, gnd3, gnd4, out4, in4, vss);
   input wire en1, in1;
   output wire out1;
   `power wire gnd1, gnd2;
   output wire out2;
   input wire in2;
   `power wire vs;
   input wire en2, in3;
   output wire out3;
   `power wire gnd3, gnd4;
   output wire out4;
   input wire in4;
   `power wire vss;

   assign out1 = (en1) ? in1 : 1'bz;
   assign out2 = (en1) ? in2 : 1'bz;
   assign out3 = (en2) ? in3 : 1'bz;
   assign out4 = (en2) ? in4 : 1'bz;
endmodule

/* L293(D)-like module mainly as a combinatorial logic front-end to
   prevent risky, invalid drive wire values from being sent to an
   external H-bridge motor driver circuit.  Assumes NPN transistor
   style drivers.  */
module l293_hbctl(en1, in1, in2,
		  out1h, out1l, out2h, out2l);
   input wire en1, in1, in2;
   output wire out1h, out1l, out2h, out2l;
   assign out1h = (en1) ?  in1 : 0;
   assign out1l = (en1) ? ~in1 : 0;
   assign out2h = (en1) ?  in2 : 0;
   assign out2l = (en1) ? ~in2 : 0;
endmodule

// SPI 7-segment, 8-digit display and 16-keypad controller circuit
module spi7seg(vcc, gnd,
	       n_rst, ss, sclk, mosi, miso,
	       n_rst_d, ss_d, sclk_d, mosi_d, miso_d,
	       in1, in2, in3, in4, in5, in6, in7, in8,
	       la, lb, lc, ld, le, lf, lg, ldp,
	       sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8);
   `power wire vcc, gnd;
   input wire n_rst, ss, sclk, mosi;
   output wire miso;
   output wire n_rst_d, ss_d, sclk_d, mosi_d;
   input wire miso_d;
   // Keypad scan input wires.
   input wire in1, in2, in3, in4, in5, in6, in7, in8;
   // LED display connection and and keypad scan output wires.
   output wire la, lb, lc, ld, le, lf, lg, ldp;
   output wire sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8;

   // Internal logic connection wires.
   wire a0, a1, a2, n_ss;

   // TODO FIXME: These should be aliases to the same net, not diode
   // isolated.  Use `alias` or similar, not `assign`.
   assign n_rst_d = n_rst;
   assign ss_d = ss;
   assign sclk_d = sclk;

   // N.B. Here we swap the bit endian on purpose because we want the
   // least significant bit to be the bit that is shifted out first by
   // the master.
   ls595 u1(lg, lf, le, ld, lc, lb, la, gnd,
	    mosi_d, n_rst, sclk, ss, 1'b0, mosi, ldp, vcc);
   ls161 u2(n_rst, ss, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, gnd,
	    1'b1, 1'b1, , a2, a1, a0, , vcc);
   // NOT USED: U3
   // f08 u3(1'b0, 1'b0, , 1'b0, 1'b0, , gnd,
   // 	  , 1'b0, 1'b0, , 1'b0, 1'b0, vcc);
   f04 u4(ss, n_ss, 1'b0, , 1'b0, , gnd,
	  , 1'b0, , 1'b0, , 1'b0, vcc);
   f238 u5(a0, a1, a2, 1'b0, 1'b0, 1'b1, sc8, gnd,
	   sc7, sc6, sc5, sc4, sc3, sc2, sc1, vcc);
   ls165 u6(n_ss, sclk, in4, in3, in2, in1, , gnd,
	    miso, miso_d, in8, in7, in6, in5, 1'b0, vcc);
   // N.B.: Use MISO_D and pull-down resistor.  Likewise pull-down
   // resistor for all in? inputs.
endmodule

// SPI quad motor controller circuit
module spimtr(vcc, gnd, vs, gnd_s,
	      n_rst, ss, sclk, mosi, miso, pwm,
	      n_rst_d, ss_d, sclk_d, mosi_d, miso_d,
	      out1, out2, out3, out4, out5, out6, out7, out8);
   `power wire vcc, gnd, vs, gnd_s;
   input wire n_rst, ss, sclk, mosi;
   output wire miso;
   input wire pwm;
   output wire n_rst_d, ss_d, sclk_d, mosi_d;
   input wire miso_d;
   output wire out1, out2, out3, out4, out5, out6, out7, out8;

   wire in1, in2, in3, in4, in5, in6, in7, in8;
   wire en1, en2, en3, en4;
   wire pwen1, pwen2, pwen3, pwen4;

   // TODO FIXME: These should be aliases to the same net, not diode
   // isolated.  Use `alias` or similar, not `assign`.
   assign n_rst_d = n_rst;
   assign ss_d = ss;
   assign sclk_d = sclk;
   assign miso = miso_d;

   // N.B. Here we swap the bit endian on purpose because we want the
   // least significant bit to be the bit that is shifted out first by
   // the master.
   ls595 u7(in7, in6, in5, in4, in3, in2, in1, gnd,
	    mosi_d, n_rst, sclk, ss, 1'b0, mosi, in8, vcc);
   f32 u8(in1, in2, en1, in3, in4, en2, gnd,
	  en3, in5, in6, en4, in7, in8, vcc);
   f08 u9(pwm, en1, pwen1, pwm, en2, pwen2, gnd,
	  pwen3, pwm, en3, pwen4, pwm, en4, vcc);
   l293d cr1(pwen1, in1, out1, gnd_s, gnd, out2, in2, vs,
	     pwen2, in3, out3, gnd, gnd, out4, in4, vcc);
   l293d cr2(pwen3, in5, out5, gnd_s, gnd, out6, in6, vs,
	     pwen4, in7, out7, gnd, gnd, out8, in8, vcc);
endmodule

// Daisy-chain together the SPI 7-segment keypad controller and SPI
// motor controller onto a single board.
module spiboard(vcc, gnd, vs, gnd_s,
		n_rst, ss, sclk, mosi, miso,
		in1, in2, in3, in4, in5, in6, in7, in8,
		la, lb, lc, ld, le, lf, lg, ldp,
		sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8,
		pwm, out1, out2, out3, out4, out5, out6, out7, out8);
   `power wire vcc, gnd, vs, gnd_s;
   input wire n_rst, ss, sclk, mosi;
   output wire miso;
   input wire in1, in2, in3, in4, in5, in6, in7, in8;
   output wire la, lb, lc, ld, le, lf, lg, ldp;
   output wire sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8;
   input wire pwm;
   output wire out1, out2, out3, out4, out5, out6, out7, out8;

   // SPI 7-seg daisy-chain output, SPI motor input.
   wire n_rst_sd, ss_sd, sclk_sd, mosi_sd, miso_sd;
   wire miso_d;

   assign miso_d = 1'b0; // pull-down resistor termination

   spi7seg bu0(vcc, gnd,
	       n_rst, ss, sclk, mosi, miso,
	       n_rst_sd, ss_sd, sclk_sd, mosi_sd, miso_sd,
	       in1, in2, in3, in4, in5, in6, in7, in8,
	       la, lb, lc, ld, le, lf, lg, ldp,
	       sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8);
   spimtr bu1(vcc, gnd, vs, gnd_s,
	      n_rst_sd, ss_sd, sclk_sd, mosi_sd, miso_sd, pwm,
	      , , , , miso_d,
	      out1, out2, out3, out4, out5, out6, out7, out8);
endmodule

`endif // not RPIHW_V
