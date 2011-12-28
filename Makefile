JAVA_HOME?=/usr/lib/jvm/java-6-sun
JAVA_CFLAGS?=-I$(JAVA_HOME)/include -I$(JAVA_HOME)/include/linux
JAVA_LDFLAGS?=-ljvm -L$(JAVA_HOME)/jre/lib/amd64/server

CFLAGS?=-Wall -pedantic
CFLAGS+=$(JAVA_CFLAGS)
LDFLAGS+=-ldl -lpthread $(JAVA_LDFLAGS)

ifdef CAPS_SUPPORT
CFLAGS+=-D CAPS_SUPPORT
LDFLAGS+=-lcap
endif

all: jexec

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

jexec: jexec.o
	$(CC) $(LDFLAGS) $^ -o $@

clean:
	rm -f *.o jexec
