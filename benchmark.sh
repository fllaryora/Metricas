#!/bin/bash

./compile.sh

mpd &
cp Pruebas/benchmark/k13/modelo.json input/input.json
for i in {1..32}
do
   echo "1-$i"
   mpiexec -recvtimeout 200 -l -n 13 ./Engine 
done
cp output/benchmark.csv output/benchmark13.csv
rm output/benchmark.csv
cp Pruebas/benchmark/k18/modelo.json input/input.json
for i in {1..32}
do
   echo "2-$i"
   mpiexec -recvtimeout 200 -l -n 18 ./Engine 
done 
cp output/benchmark.csv output/benchmark18.csv
rm output/benchmark.csv
cp Pruebas/benchmark/k23/modelo.json input/input.json
for i in {1..32}
do
   echo "3-$i"
   mpiexec -recvtimeout 200 -l -n 23 ./Engine 
done 
cp output/benchmark.csv output/benchmark23.csv

mpdallexit
