player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)"
else
    echo ""
fi

# message="$(playerctl metadata artist) - $(playerctl metadata title)"
#
# if [ "$message" = " - " ]; then
#     echo ""
# elif [ "$message" = "No players found" ]; then
#     echo ""
# else
#     echo "$message"
# fi
