
target := tb

vhdl_src := cfuncs.vhd tb.vhd
c_src := custom.c

workdir := obj/work
c_objdir := obj/c

c_obj := $(patsubst %.c,$(c_objdir)/%.o,$(c_src))

comma := ,
ghdl := ghdl-gcc
ghdl_args := --workdir=$(workdir)

all: $(target)

$(target): $(c_obj) $(vhdl_src) | $(workdir)
	$(ghdl) -i $(ghdl_args) $(vhdl_src)
	$(ghdl) -m $(ghdl_args) $(patsubst %,-Wl$(comma)%,$(c_obj)) $(target)

$(c_objdir)/%.o: %.c | $(c_objdir)
	gcc -Wall -Wextra -Werror -c -o $@ $<

$(workdir) $(c_objdir):
	mkdir -p $@

clean:
	rm -vf ./e~$(target).o $(target)
	rm -rvf $(workdir) $(c_objdir)

test: $(target)
	./$(target)
