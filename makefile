make:
	aarch64-linux-gnu-gcc -march=armv8.4-a+sha3 -o test test.c Xoodoo_times4sha_interleaving.s Xoodoo_times4sha_no_interleaving.s Xoodoo_times4ref.c Xoodoo_times4no_sha_interleaving.s Xoodoo_times4no_sha_no_interleaving.s Xoodoo_times1.s Xoodoo_times4decompose.s timing.c

