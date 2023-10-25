#!/bin/zsh

TRACKED_HEADSET="bluez_sink.2C_27_9E_70_79_97.a2dp_sink"
TRACKED_MIC="alsa_input.usb-FongLun_USB_Microphone_201605-00.analog-stereo"

is_headset_connected() {
	if [ "$(pactl get-default-sink)" = "$TRACKED_HEADSET" ]; then
		return 0
	else
		return 1
	fi
}

not_headset_muted() {
	if [ "$(pactl get-sink-mute $TRACKED_HEADSET)" = "Mute: yes" ]; then
		return 1
	else
		return 0
	fi
}

is_mic_muted() {
	if [ "$(pactl get-source-mute $TRACKED_MIC)" = "Mute: yes" ]; then
		return 0
	else
		return 1
	fi
}



date=$(date +%y%m%d)
time=$(date +%H%M)

if [[ $((10#$time)) < 1030 ]];then moment="EARLY AM"
elif [[ $((10#$time)) < 1200 ]];then moment="LATE AM"
elif [[ $((10#$time)) < 1400 ]];then moment="MID DAY"
elif [[ $((10#$time)) < 1600 ]];then moment="EARLY PM"
elif [[ $((10#$time)) < 1800 ]];then moment="LATE PM"
elif [[ $((10#$time)) < 2200 ]];then moment="EVENING"
else moment="NIGHT"
fi

next_e="RESATIME"
next_e_time="09:00" # reads 09:00AM
next_e_time_h=$(($(echo "$next_e_time" | awk -F ":" '{print $1}')))
next_e_time_sec=$(($(($(echo "$next_e_time" | awk -F ":" '{print $2}') * 60)) + $next_e_time_h * 60 * 60))

now=$(date +%H:%M)
now_min=$(($(echo "$now" | awk -F ":" '{print $1}')))
now_sec=$(($(($(echo "$now" | awk -F ":" '{print $2}') * 60)) + $now_min * 60 * 60))

result=$(($(($next_e_time_sec - $now_sec))/60))

if [ $((result)) > 0 ]; then
	timer=$result
else
	timer=""
fi

if is_headset_connected && not_headset_muted; then
	hs="hs_on"
else
	hs="hs_off"
fi

if is_mic_muted; then
	mic="mic_off"
else
	mic="mic_on"
fi

echo "$date;$time;$moment;$next_e;$timer;$hs;$mic"

