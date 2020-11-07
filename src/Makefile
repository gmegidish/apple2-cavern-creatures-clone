
all: scroller.dsk

clean:
	rm -f scroller.dsk

main.bin: main.s scroll.s
	asm6f $<

scroll.s: generate-lookup.php
	php generate-lookup.php > scroll.s

scroller.dsk: main.bin HELLO
	cp -f PRODOS.DSK $@
	java -jar AppleCommander-ac-1.6.0.jar -d $@ STARTUP
	java -jar AppleCommander-ac-1.6.0.jar -d $@ MAIN
	java -jar AppleCommander-ac-1.6.0.jar -bas $@ STARTUP < HELLO
	java -jar AppleCommander-ac-1.6.0.jar -p $@ MAIN BIN 0x800 < main.bin
	java -jar AppleCommander-ac-1.6.0.jar -p $@ PIC BIN 0x2000 < PIC
	java -jar AppleCommander-ac-1.6.0.jar -p $@ PIC2.A2FC BIN 0x2000 < PIC2.A2FC
