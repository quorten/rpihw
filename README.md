`rpihw` -- My First Raspberry Pi Hardware Project
=================================================

Background Info
---------------

This is first large-scale Raspberry Pi hardware project.  The original
overly large goals of my Raspberry Pi hardware project was to have one
Raspberry Pi hardware device with all imaginable peripheral interfaces
I could ever conceivably need, so I could just plug in what I need for
a particular session.  But, since that's too large sweeping of a goal
to achieve... let's simply state what my actual design does.

This is my first iteration at designing a Raspberry Pi SPI devices
board.  The path to this real implementation started out by playing
with the Texas Instruments SN74HC595N shift register from an Arduino
parts pack.  Cool, it's an integrated circuit, but dang,
intimidating... how am I going to program this shift register?  But
then, I wired up 4 tactile switches, 1 pull-up resistor, 3 pull-down
resistors, and a 7-segment LED with decimal point.  Then... wow, I was
hooked, it's so easy and simple, and it could in theory be
daisy-chained to control an unlimited number of devices... limited
only by signal timing constraints.

I also went reading in more detail about SPI (Serial Peripheral
Interface), and I realized, hey, SPI is really just a glorified
interface to a plain old shift register integrated circuit.  I should
really try making a board that exposes some plain old shift registers
to Raspberry Pi as SPI devices.  So, that's what I started out doing.

What the main board does
------------------------

1. SPI Display/Keypad controller: 8-bit input word, 8-bit output word
   SPI device.  You program an 8-bit shift register that controls the
   display contents of one 7-segment LED digit, including decimal
   point.  An internal counter circuit automatically advances the
   current digit, so that when you write on the next cycle, you will
   set the contents of the next digit.  The input is the contents of
   one row (or column, depending on wiring) of the keyboard.  By
   reading/writing in rapid succession, you can control an 8-digit
   multiplexed LED digit display and read a 64-key keyboard.

   Technically, with one more demultiplexer chip, the circuit could
   easily be extended to a 16-digit display and a 128-key keyboard.

2. SPI motor controller: 8-bit output word SPI device.  Since this is
   an asymmetric SPI device, you must take corresponding caution when
   daisy-chaining it.  Two L293D motor controllers with some glue
   logic chips to reduce the number of bits to program them.  Can
   control up to 4 DC motors or 8 solenoids.  2 bits indicate one of 4
   states for each motor: (0) coast, (1) forward, (2) reverse, (3)
   brake.

3. Miscellaneous GPIO device control: Other single pin connections for
   controlling some LEDs, a PWM buzzer, and an arbitrary
   higher-powered device.

Of course, there is still more plenty of expansion capability for
connecting off-board SPI devices, provided that the distance is not so
long that capacitance and signaling delays becomes a problem.  In
theory, UART transceivers are an easy and cheap way to connect distant
devices to a daisy-chained SPI bus.

Oh, and I didn't even cover I2C yet.  Sure, you can populate
connectors and solder on headers for modular connection to that as you
please.

What the auxiliary boards do
----------------------------

* SPI Debug Board: a fancier, more formal recreation of my original
  breadboard design for playing with the shift register, give yourself
  a nice permanent fixture for those four buttons and the official
  connector interface I use for my SPI devices on this board design.
  Also, this is a great first time perboard project to build.

* Additional I/O connectors and device interface board: Everything
  that didn't fit on the first Eurocard perfboard that I bought, I put
  on a piece of my own "cardboard circuit board" when building the
  perfboard prototype.

Credits
-------

* Digi-Key: I used Digi-Key to prepare the Bill of Materials from my
  initial design specifications.  Also, I used the Digi-Key KiCad
  parts library when designing the formal schematics in KiCad.

* KiCad: The formal design documentation for this project is drafted
  in KiCad.  That is, anything that is not specified straight up in
  generic documentation formats like Markdown, HTML, SVG graphics,
  PDFs, spreadsheets, etc.

* UltraLibrarian: I used UltraLibrarian to get KiCad library files for
  some of the Digi-Key parts.  It's not great, and had I known in
  advance, I should have used the Digi-Key KiCad parts library for as
  many of the parts that were available over there.

* KiBoM: Some of the early versions of KiCad (if you're stuck using an
  older Debian-based distro for various odd reasons) don't have very
  nice BOM generators bundled by default, KiBoM is a fairly nice BOM
  generator to use in these cases.  It might also provide some other
  useful advanced features not in the BOM generators in the newer
  KiCad versions.

N.B.: Modern versions of KiCad don't have the simple internal
autorouter, it wasn't forward ported when was Pcbnew was extensively
refactored.  That's another benefit of the older versions, if you just
want to play around with simple auto-routing because you can.  I'm
still developing this project in KiCad 4 rather than the latest
version.

Copyright Info
--------------

The rest of this project, i.e. the board design itself excluding the
library files, is in public domain via the UNLICENSE.

The Digi-Key KiCad parts library uses the Creative Commons
Share-Alike, with a special exemption that tantamounts to "fair use"
under copyright law if only bits and pieces are used for a particular
project, as opposed to most of the library.

The UltraLibrarian library parts are under proprietary copyright, but
also come with a special exemption that tantamounts to "fair use"
under copyright law if only bits and pieces are used for a particular
project, as opposed to most of the library.
