#!/bin/bash

./compile.sh

#mpd &
#cp Pruebas/benchmark/k3/modelo.json input/input.json
cp benchmark/k3/modelo.json input/input.json
for i in {1..38}
do
   echo "1-$i"
   #mpiexec -recvtimeout 200 -l -n 6 ./Engine 
   mpirun -np 6 ./Engine 
done
cp output/benchmark.csv output/benchmark6.csv
rm output/benchmark.csv
#cp Pruebas/benchmark/k4/modelo.json input/input.json
cp benchmark/k4/modelo.json input/input.json
for i in {1..38}
do
   echo "2-$i"
   #mpiexec -recvtimeout 200 -l -n 7 ./Engine 
   mpirun -np 7 ./Engine 
done 
cp output/benchmark.csv output/benchmark7.csv
rm output/benchmark.csv
#cp Pruebas/benchmark/k5/modelo.json input/input.json
cp benchmark/k5/modelo.json input/input.json
for i in {1..38}
do
   echo "3-$i"
   #mpiexec -recvtimeout 200 -l -n 8 ./Engine 
   mpirun -np 8 ./Engine 
done 
cp output/benchmark.csv output/benchmark8.csv

#mpdallexit
