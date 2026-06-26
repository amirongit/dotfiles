killall polybar 2> /dev/null
sleep 1 &

polybar -r lapdum &
polybar -r lap &
polybar -r monittopdum &
polybar -r monittop &
polybar -r monitbotdum &
polybar -r monitbot

wait
