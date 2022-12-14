#!/bin/zsh

# 毎週決まった時間にbrew updateを行ってくれるスクリプト
# を作りたい
# 決まった時間は今の所、「毎週月曜日午前9時」にしている

now_weekd=`date +%u`
now_time=`date +%H`

if [ "$now_weekd" -eq 1 ];then
    if [ "$now_time" -ge 9 ] && [  ];then
        
    fi
fi

#brew update

