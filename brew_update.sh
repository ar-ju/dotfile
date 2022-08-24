#!/bin/zsh

# 毎週決まった時間にbrew updateを行ってくれるスクリプト

now_weekd=`date +%u`

if [ "$now_weekd" -eq 1 ];then
    now_time=`date +%H`
    if [ "$now_time" -ge 9 ] && [  ];then
        
    fi
fi

#brew update

