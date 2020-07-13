all: buildit.pdf

buildit.pdf: rpihw.pdf pinouts.pdf
	./mkbuildit.sh

datasheets:
	./mkdatasheets.sh

clean:
	rm -f buildit.pdf
	rm -rf datasheets
