#!/usr/bin/env bash


#ALLJAVA=$(pgrep java | xargs -I {} jstack {})

#THREADS=$(pgrep java | xargs -I {} jstack {} | grep tid | awk -F'nid=' '{print $2"--"$1}' | awk '{print $1"--"$0}' | awk -F'\"' '{print $2"--"$1}' | awk -F'--' '{print "\n"strtonum($2)"\t "$1}' | sort -n)

#CPUUTIL=$(top -H -b -n 1 | grep java | sort -n | grep -v -e '^$' | awk '{print $1"\t"$9"\t"$10}' | sort -n)

join <(top -H -b -n 1 -p $1 | grep java | sort | grep -v -e '^$' | awk '{print $1"\t"$9"\t"$10}' | sort) <(jstack $1 | grep tid | awk -F'nid=' '{print $2"--"$1}' | awk '{print $1"--"$0}' | awk -F'\"' '{print $2"--"$1}' | awk -F'--' '{print "\n"strtonum($2)"\t "$1}' | sort | grep -v -e '^$')


#echo -e $ALLJAVA
#echo "-----------------------"
#echo -e $THREADS
#echo "-----------------------"
#echo -e $CPUUTIL
#echo "-----------------------"






#pgrep java | xargs -I {} jstack {} > tmpA.log

#grep tid tmpA.log | awk -F'nid=' '{print $2"--"$1}' | awk '{print $1"--"$0}' | awk -F'\"' '{print $2"--"$1}' | awk -F'--' '{print strtonum($2)"\t "$1}' | sort -n  > tmpA.log

#top -H -b -n 1 | grep java | sort -n | awk '{print $1}' | grep -v -e '^$' > tids.log

#top -H -b -n 1 | grep java | sort -n | grep -v -e '^$' | awk '{print $1"\t"$9"\t"$10}' | sort -n # > tmpB.log



#top -H -b -n 1 | grep java | sort -n | cut -d' ' -f 1 | grep -v -e '^$' > tids.log
#top -H -b -n 1 | grep java | sort -n | grep -v -e '^$' | awk '{print $1"\t"$9"\t"$10}' | sort -n  > tmpB.log

#join <(cat tmpA.log) <(top -H -b -n 1 | grep java | sort -n | grep -v -e '^$' | awk '{print $1"\t"$9"\t"$10}' | sort -n)
#top -H -b -n 1 | grep java | sort -n | grep -v -e '^$' | awk '{print $1"\t"$9"\t"$10}' | sort -n > lala.txt

