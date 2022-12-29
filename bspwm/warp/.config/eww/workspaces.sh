#!/bin/bash

alert='⚠'
empty='◇'
occupied='◈'
focused='◆'

bspc subscribe report | while read -r line; do
  workspaces=''
  IFS=':' read -r -a desktops <<<$line
  for index in ${!desktops[@]}; do
    desktopname=${desktops[index]#?}
    case ${desktops[index]} in
    U*)
      workspaces+="(label :text \"${alert}\" :class \"urgent focused\")"
      ;;
    u*)
      workspaces+="(label :text \"${alert}\" :class \"urgent\")"
      ;;
    O*)
      workspaces+="(label :text \"${focused}\" :class \"occupied focused\")"
      ;;
    o*)
      workspaces+="(label :text \"${occupied}\" :class \"occupied\")"
      ;;
    F*)
      workspaces+="(label :text \"${empty}\" :class \"empty focused\")"
      ;;
    f*)
      workspaces+="(label :text \"${empty}\" :class \"empty\")"
      ;;
    esac
  done
  printf "(box :orientation \"v\" :class \"workspaces\" ${workspaces})\n"
done
