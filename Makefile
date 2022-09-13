
CXX:=mpicxx

USE_TAUPROF=0
ifeq ($(USE_TAUPROF),1)
TAU=/soft/perftools/tau/tau-2.29/craycnl/lib
CXX = tau_cxx.sh -tau_makefile=$(TAU)/Makefile.tau-intel-papi-mpi-pdt 
endif
# use -xmic-avx512 instead of -xHost for Intel Xeon Phi platforms
OPTFLAGS = -Ofast -ipo -xHost -qopenmp -DPRINT_DIST_STATS
#OPTFLAGS = -Ofast -ipo -xHost -qopenmp -DPRINT_DIST_STATS
#OPTFLAGS = -O3 -ipo -xHost -qopenmp -DPRINT_DIST_STATS
#OPTFLAGS += -DPRINT-EXTRA-NEDGES -DDEBUG_PRINTF
#OPTFLAGS += -DPRINT_LCG_DOUBLE_LOHI_RANDOM_NUMBERS -DPRINT_LCG_DOUBLE_RANDOM_NUMBERS -DPRINT_RANDOM_XY_COORD
#OPTFLAGS += -DUSE_32_BIT_GRAPH
#OPTFLAGS += -DUSE_MPI_RMA
#OPTFLAGS += -DUSE_MPI_RMA -DUSE_MPI_ACCUMULATE
#OPTFLAGS += -DUSE_MPI_SENDRECV
#OPTFLAGS += -DUSE_MPI_COLLECTIVES
# use export ASAN_OPTIONS=verbosity=1 to check ASAN output
SNTFLAGS = -std=c++17 -fopenmp -fsanitize=address -O1 -fno-omit-frame-pointer
CXXFLAGS = -std=c++17 -static -g $(OPTFLAGS)

OBJ = main.o
TARGET = miniVite

all: $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $^

$(TARGET):  $(OBJ)
	$(CXX) $^ $(OPTFLAGS) -o $@

.PHONY: clean

clean:
	rm -rf *~ $(OBJ) $(TARGET)
