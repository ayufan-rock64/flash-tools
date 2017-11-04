.PHONY: all
all: build

.PHONY: build
build: rkdeveloptool/rkdeveloptool rkflashtool/rkflashtool

.PHONY: install
install: rkandroid_flash rklinux_flash rkdeveloptool/rkdeveloptool rkflashtool/rkflashtool
	cp $^ /usr/local/bin/

rkdeveloptool:
	git clone https://github.com/rockchip-linux/rkdeveloptool

rkdeveloptool/Makefile: rkdeveloptool
	cd rkdeveloptool && autoreconf -i && ./configure

rkdeveloptool/rkdeveloptool: rkdeveloptool/Makefile
	make -C rkdeveloptool

rkflashtool:
	git clone https://github.com/rockchip-linux/rkflashtool

rkflashtool/rkflashtool: rkflashtool
	make -C rkflashtool
