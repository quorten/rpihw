all: buildit.pdf

buildit.pdf: rpihw.pdf pinouts.pdf
	./mkbuildit.sh

datasheets:
	./mkdatasheets.sh

test_rpihw.vvp: test_rpihw.v rpihw.v stdlogic.v common.vh
	iverilog -Wanachronisms -Wimplicit -Wportbind -Wselect-range \
	  -Winfloop -Wsensitivity-entire-vector \
	  -Wsensitivity-entire-array \
	  -o $@ $<

test_rpihw.vcd: test_rpihw.vvp
	./$<

clean:
	rm -f buildit.pdf
	rm -rf datasheets
	rm -f test_rpihw.vvp test_rpihw.vcd
