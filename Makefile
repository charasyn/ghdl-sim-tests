subdirs := hello-world-from-c

all_sub := $(patsubst %,tgtall_%,$(subdirs))
test_sub := $(patsubst %,tgttest_%,$(subdirs))
clean_sub := $(patsubst %,tgtclean_%,$(subdirs))
testclean_sub := $(patsubst %,tgttestclean_%,$(subdirs))

all: $(all_sub)
test: $(test_sub)
clean: $(clean_sub)
testclean: $(testclean_sub)

$(all_sub):
	$(MAKE) -C $(patsubst tgtall_%,%,$@) all

$(test_sub):
	$(MAKE) -C $(patsubst tgttest_%,%,$@) test

$(clean_sub):
	$(MAKE) -C $(patsubst tgtclean_%,%,$@) clean

$(testclean_sub):
	$(MAKE) -C $(patsubst tgttestclean_%,%,$@) test
	$(MAKE) -C $(patsubst tgttestclean_%,%,$@) clean

.PHONY: all test clean testclean $(all_sub) $(test_sub) $(clean_sub) $(testclean_sub)
