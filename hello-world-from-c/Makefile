
target := tb

vhdl_src := cfuncs.vhd tb.vhd
c_src := custom.c

objdir := build

obj := $(patsubst %.vhd,$(objdir)/%.o,$(vhdl_src))
c_obj := $(patsubst %.c,$(objdir)/%.o,$(c_src))

COMMA := ,
GHDL := ghdl-gcc
GHDL_ARGS := --workdir=$(objdir)

all: $(target)

$(target): $(c_obj) | $(objdir)
	$(GHDL) -i $(GHDL_ARGS) $(vhdl_src)
	$(GHDL) -e $(GHDL_ARGS) $(patsubst %,-Wl$(COMMA)%,$(c_obj)) $(target)

$(objdir)/%.o: %.c | $(objdir)
	gcc -Wall -Wextra -Werror -c -o $@ $<

$(objdir)/%.o: %.vhd | $(objdir)
	$(GHDL) -a $(GHDL_ARGS) $<

$(objdir):
	mkdir -p $(objdir)

clean:
	rm -vf ./e~$(target).o $(target)
	rm -rvf $(objdir)

test: $(target)
	./$(target)
