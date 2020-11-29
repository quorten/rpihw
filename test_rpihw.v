/* Hardware simulation test bench to simulate my rpihw first hardware
   project board's glue logic.  Good sanity check, to make sure that
   the board at least works at a superficial level.  Yeah I wish the
   software were better integrated, but this is good enough for the
   time being.  */

`timescale 1us/100ns

`include "rpihw.v"

`include "test_stdlogic.v"

module test_spi7seg();
   wire vcc, gnd;
   reg n_rst;
   reg clock;

   wire sclk, mosi, miso;
   reg 	ss;
   wire n_rst_d, ss_d, sclk_d, mosi_d, miso_d;
   reg in1, in2, in3, in4, in5, in6, in7, in8;
   wire la, lb, lc, ld, le, lf, lg, ldp;
   wire sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8;

   // Make things easy for us to test by giving ourselves a shift
   // register for output/input.
   reg [7:0] mosh, mish;

   assign vcc = 1;
   assign gnd = 0;

   assign sclk = ss | clock; // Nullify SCLK when slave is not selected.
   assign mosi = mosh[7];
   assign miso_d = 1'b0; // Nothing to daisy chain for now.

   spi7seg u0_spi7seg(vcc, gnd,
		      n_rst, ss, sclk, mosi, miso,
		      n_rst_d, ss_d, sclk_d, mosi_d, miso_d,
		      in1, in2, in3, in4, in5, in6, in7, in8,
		      la, lb, lc, ld, le, lf, lg, ldp,
		      sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8);

   // SPI parameters:
   // * Slave Select (SS) is active low
   // * Clock polarity = 1, "idle" at logic level one
   // * Clock phase = 0, change output data on rising edge, read input
   //   data on falling edge
   // * Master output writes least significant bit first
   // * TODO FIX SCHEMATIC: Master input reads least significant bit first

   // Together, these ensure that the rising edge shifts the data, and
   // that we read the first bit before attempting to shift the first
   // time.  This allows us to use standard logic shift registers
   // directly with SPI.

   // N.B. Technically from a software control standpoint we're
   // shifting out the wrong side here, but this makes testing easier
   // so we do it anyways.  We just logically consider the register
   // contents backwards.
   always @(posedge sclk) begin
      mosh <= { mosh[6:0], 1'b0 };
      mish <= { mish[6:0], miso };
   end

   // Trigger RESET at beginning of simulation.  Make sure there is an
   // initial falling edge.
   initial begin
      n_rst = 1;
      #20 n_rst = 0;
      #180 n_rst = 1;
   end

   // Initialize clock.  For SPI we want our clock to "idle" at one,
   // so initialize to one at the start of the simulation.
   initial begin
      clock = 1;
   end

   // 100 unit clock cycle (100 microseconds).
   always
     #50 clock = ~clock;

   // Generate the test input signals.
   initial begin
      ss = 1;
      in1 = 0; in2 = 0; in3 = 0; in4 = 0; in5 = 0; in6 = 0; in7 = 0;
      in8 = 0;
      #200 mosh = 8'h00;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'hcf;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'hdb; in3 = 1;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h92; in3 = 0; in7 = 1;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h07; in7 = 0; in2 = 1;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h14; in2 = 0;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h5b;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h5b; in4 = 1;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h5b; in4 = 0; in1 = 1;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h5b; in1 = 0; in8 = 1;
      #100 ss = 0;
      #850 ss = 1;
      #50 in8 = 0;
   end
endmodule

module test_spimtr();
   wire vcc, gnd, vs, gnd_s;
   reg n_rst;
   reg clock;

   wire sclk, mosi, miso;
   reg ss;
   wire n_rst_d, ss_d, sclk_d, mosi_d, miso_d;
   wire out1, out2, out3, out4, out5, out6, out7, out8;
   reg pwm;

   // Make things easy for us to test by giving ourselves a shift
   // register for output/input.
   reg [7:0] mosh, mish;

   assign vcc = 1;
   assign gnd = 0;
   assign vs = 1;
   assign gnd_s = 0;

   assign sclk = ss | clock; // Nullify SCLK when slave is not selected.
   assign mosi = mosh[7];
   assign miso_d = 1'b0; // Nothing to daisy chain for now.

   spimtr u0_spimtr(vcc, gnd, vs, gnd_s,
		    n_rst, ss, sclk, mosi, miso, pwm,
		    n_rst_d, ss_d, sclk_d, mosi_d, miso_d,
		    out1, out2, out3, out4, out5, out6, out7, out8);

   // SPI parameters:
   // * Slave Select (SS) is active low
   // * Clock polarity = 1, "idle" at logic level one
   // * Clock phase = 0, change output data on rising edge, read input
   //   data on falling edge
   // * Master output writes least significant bit first
   // * Master input reads least significant bit first

   // Together, these ensure that the rising edge shifts the data, and
   // that we read the first bit before attempting to shift the first
   // time.  This allows us to use standard logic shift registers
   // directly with SPI.

   // N.B. Technically from a software control standpoint we're
   // shifting out the wrong side here, but this makes testing easier
   // so we do it anyways.  We just logically consider the register
   // contents backwards.
   always @(posedge sclk) begin
      mosh <= { mosh[6:0], 1'b0 };
      mish <= { mish[6:0], miso };
   end

   // Trigger RESET at beginning of simulation.  Make sure there is an
   // initial falling edge.
   initial begin
      n_rst = 1;
      #20 n_rst = 0;
      #180 n_rst = 1;
   end

   // Initialize clock.  For SPI we want our clock to "idle" at one,
   // so initialize to one at the start of the simulation.
   initial begin
      clock = 1;
   end

   // 100 unit clock cycle (100 microseconds).
   always
     #50 clock = ~clock;

   // Generate the test input signals.
   initial begin
      // Easy way to test all L293D combinatorial control signal
      // inputs with one shift register value: 8'h1b = 8'b00011011.
      ss = 1;
      pwm = 1;
      #200 mosh = 8'h00;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h1b;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h1b;
      #100 ss = 0; pwm = 0;
      #850 ss = 1;
      #50 mosh = 8'h1b;
      #100 ss = 0; pwm = 1;
      #850 ss = 1;
      #50 mosh = 8'h1b;
      #100 ss = 0; pwm = 0;
      #850 ss = 1;
      #50 mosh = 8'h1b; pwm = 1;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h5a;
      #100 ss = 0;
      #850 ss = 1;
      #50 mosh = 8'h00;
      #100 ss = 0;
      #850 ss = 1;
   end
endmodule

module test_spiboard();
   wire vcc, gnd, vs, gnd_s;
   reg n_rst;
   reg clock;

   wire sclk, mosi, miso;
   reg ss;
   reg in1, in2, in3, in4, in5, in6, in7, in8;
   wire la, lb, lc, ld, le, lf, lg, ldp;
   wire sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8;
   wire out1, out2, out3, out4, out5, out6, out7, out8;
   reg pwm;

   // Make things easy for us to test by giving ourselves a shift
   // register for output/input.
   reg [15:0] mosh, mish;

   assign vcc = 1;
   assign gnd = 0;
   assign vs = 1;
   assign gnd_s = 0;

   assign sclk = ss | clock; // Nullify SCLK when slave is not selected.
   assign mosi = mosh[15];

   spiboard u0_spiboard
     (vcc, gnd, vs, gnd_s,
      n_rst, ss, sclk, mosi, miso,
      in1, in2, in3, in4, in5, in6, in7, in8,
      la, lb, lc, ld, le, lf, lg, ldp,
      sc1, sc2, sc3, sc4, sc5, sc6, sc7, sc8,
      pwm, out1, out2, out3, out4, out5, out6, out7, out8);

   // SPI parameters:
   // * Slave Select (SS) is active low
   // * Clock polarity = 1, "idle" at logic level one
   // * Clock phase = 0, change output data on rising edge, read input
   //   data on falling edge
   // * Master output writes least significant bit first
   // * Master input reads least significant bit first

   // Together, these ensure that the rising edge shifts the data, and
   // that we read the first bit before attempting to shift the first
   // time.  This allows us to use standard logic shift registers
   // directly with SPI.

   // N.B. Technically from a software control standpoint we're
   // shifting out the wrong side here, but this makes testing easier
   // so we do it anyways.  We just logically consider the register
   // contents backwards.
   always @(posedge sclk) begin
      mosh <= { mosh[14:0], 1'b0 };
      mish <= { mish[14:0], miso };
   end

   // Trigger RESET at beginning of simulation.  Make sure there is an
   // initial falling edge.
   initial begin
      n_rst = 1;
      #20 n_rst = 0;
      #180 n_rst = 1;
   end

   // Initialize clock.  For SPI we want our clock to "idle" at one,
   // so initialize to one at the start of the simulation.
   initial begin
      clock = 1;
   end

   // 100 unit clock cycle (100 microseconds).
   always
     #50 clock = ~clock;

   // Generate the test input signals.
   initial begin
      // Easy way to test all L293D combinatorial control signal
      // inputs with one shift register value: 8'h1b = 8'b00011011.
      // Since the motor controller is on the second part of the daisy
      // chain and our test bench is shifting most significant bits
      // first, the motor control bits are the 8 most significant
      // bits.
      ss = 1;
      in1 = 0; in2 = 0; in3 = 0; in4 = 0; in5 = 0; in6 = 0; in7 = 0;
      in8 = 0;
      pwm = 1;
      #200 mosh = 16'h0000;
      #100 ss = 0;
      #1650 ss = 1;
      #50 mosh = 16'h1bcf;
      #100 ss = 0;
      #1650 ss = 1;
      #50 mosh = 16'h1bdb; in3 = 1;
      #100 ss = 0; pwm = 0;
      #1650 ss = 1;
      #50 mosh = 16'h1b92; in3 = 0; in7 = 1;
      #100 ss = 0; pwm = 1;
      #1650 ss = 1;
      #50 mosh = 16'h1b07; in7 = 0; in2 = 1;
      #100 ss = 0; pwm = 0;
      #1650 ss = 1;
      #50 mosh = 16'h1b14; in2 = 0; pwm = 1;
      #100 ss = 0;
      #1650 ss = 1;
      #50 mosh = 16'h5a5b;
      #100 ss = 0;
      #1650 ss = 1;
      #50 mosh = 16'h005b; in4 = 1;
      #100 ss = 0;
      #1650 ss = 1;
      #50 mosh = 16'h005b; in4 = 0; in1 = 1;
      #100 ss = 0;
      #1650 ss = 1;
      #50 mosh = 16'h005b; in1 = 0; in8 = 1;
      #100 ss = 0;
      #1650 ss = 1;
      #50 in8 = 0;
   end
endmodule

module test_rpihw();
   // Instantiate the individual test modules.
   test_ls161 tu0_ls161();
   test_spi7seg tu1_spi7seg();
   test_spimtr tu2_spimtr();
   test_spiboard tu3_spiboard();

   // Perform the remainder of global configuration here.

   // Set simulation time limit.
   initial begin
      #24000 $finish;
   end

   // We can use `$display()` for printf-style messages and implement
   // our own automated test suite that way if we wish.
   initial begin
      $display("Example message: Start of simulation.  ",
	       "(time == %1.0t)", $time);
   end

   // Log to a VCD (Variable Change Dump) file.
   initial begin
      $dumpfile("test_rpihw.vcd");
      $dumpvars;
   end
endmodule
