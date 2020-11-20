#/bin/bash

echo $[$(echo +{1..100})]
echo $[(100+1)*(100/2)]
seq -s '+' 100 |bc