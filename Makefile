
#SUBDIRS=$(shell ls -l | grep ^d | awk '{if($$9 != "debug") print $$9}')

dirs:=$(shell find . -maxdepth 1 -type d)
dirs:=$(basename $(patsubst ./%,%,$(dirs)))
dirs:=$(filter-out $(exclude_dirs),$(dirs))
SUBDIRS := $(dirs)

.PHONY:all clean

all:
#	@echo "this Makefile clean the temporary files that created by TexStudio"
	@echo $(SUBDIRS)
	
	



ECHO:
	@echo $(SUBDIRS)
	
clean:
#	@echo "clean temporary files"
	@for dir in `echo $(SUBDIRS) | cut -d' ' -f 1-`;\
  	do \
	   echo "clean subdir $$dir";\
	   rm -rf $$dir/*.aux $$dir/*.bbl $$dir/*.log $$dir/*.gz $$dir/*.toc $$dir/*.out $$dir/_*;\
	done
	
