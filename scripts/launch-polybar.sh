killall polybar 2> /dev/null
sleep 1 &

polybar -r lapdum &
polybar -r lap &
polybar -r monitdum &
polybar -r monit

wait
