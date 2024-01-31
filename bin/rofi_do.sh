#!/bin/sh

FILE=~/.config/rofi/menu
DMENU='rofi -dmenu'

IFS=" "
read -r cmd1 cmd2 rest

case "$cmd1" in
	"add")
		alias | which -ai $cmd2 > /dev/null 2>&1 && \
		echo "$cmd2" >> $FILE && \
		sort $FILE -o $FILE
		cat $FILE | $DMENU | rofi_do.sh
		;;
	"del")
		sed -i "/^$cmd2/d" $FILE
		cat $FILE | $DMENU | rofi_do.sh
		;;
	*)
		echo "$cmd1 $cmd2 $rest"
esac
