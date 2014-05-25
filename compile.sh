#!/bin/bash

REALSTEP=1.0
COMPILER="mpicc"
GCCARGS="-O3  -D TIME_ONE_STEP=$REALSTEP -D_POSIX_C_SOURCE=199309L -lrt -lm -std=c99"

if [ -e "Engine" ]
then
	if [ -f "Engine" ]
	then
		echo "rm Engine"
		rm Engine
	else
		echo "no hay Engine"
	fi
else
	echo "no hay Engine"
fi

export PATH=$PATH:/usr/lib64/mpich2/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/mpich2/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib


echo "$COMPILER -Wall $GCCARGS -c RNGs.c"
$COMPILER -Wall $GCCARGS -c RNGs.c

echo "$COMPILER -Wall $GCCARGS -c parson.c"
$COMPILER -Wall $GCCARGS -c parson.c

echo "$COMPILER -Wall $GCCARGS -c jsonHelper.c"
$COMPILER -Wall $GCCARGS -c jsonHelper.c

echo "$COMPILER -Wall $GCCARGS -c genericNode.c"
$COMPILER -Wall $GCCARGS -c genericNode.c

echo "$COMPILER -Wall $GCCARGS -c queue.c"
$COMPILER -Wall $GCCARGS -c queue.c

echo "$COMPILER -Wall $GCCARGS -c combi.c"
$COMPILER -Wall $GCCARGS -c combi.c

echo "$COMPILER -Wall $GCCARGS -c normal.c"
$COMPILER -Wall $GCCARGS -c normal.c

echo "$COMPILER -Wall $GCCARGS -c function.c"
$COMPILER -Wall $GCCARGS -c function.c

echo "$COMPILER -Wall $GCCARGS -c counter.c"
$COMPILER -Wall $GCCARGS -c counter.c

echo "$COMPILER -Wall $GCCARGS -c printer.c"
$COMPILER -Wall $GCCARGS -c printer.c

echo "$COMPILER -Wall $GCCARGS -c raffler.c"
$COMPILER -Wall $GCCARGS -c raffler.c

echo "$COMPILER -Wall $GCCARGS -c scheduler.c"
$COMPILER -Wall $GCCARGS -c scheduler.c

echo "$COMPILER -Wall $GCCARGS RNGs.o parson.o jsonHelper.o raffler.o printer.o genericNode.o queue.o combi.o normal.o function.o counter.o scheduler.o -o Engine main.c"
$COMPILER -Wall $GCCARGS RNGs.o parson.o jsonHelper.o raffler.o printer.o genericNode.o queue.o combi.o normal.o function.o counter.o scheduler.o -o Engine main.c

rm *.o
