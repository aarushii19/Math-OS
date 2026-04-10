all:
	nasm -f bin boot.asm -o boot.bin
	nasm -f bin kernel.asm -o kernel.bin

	dd if=/dev/zero of=mathos.bin bs=512 count=2880
	dd if=boot.bin of=mathos.bin conv=notrunc
	dd if=kernel.bin of=mathos.bin bs=512 seek=1 conv=notrunc

run:
	qemu-system-i386 -drive format=raw,file=mathos.bin

clean:
	rm -f *.bin
