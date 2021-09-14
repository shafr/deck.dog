#!/bin/bash

declare -a FEATURES=(power_delivery type_c usb_3 usb_2 ethernet display_DP display_HDMI display_VGA audio_DP audio_HDMI audio_AUX)

read -d '' SINGLE_CHECK <<EOF
				<!-- ___ -->
				{% if device.___ %}
					{% assign ___ = yt %}
				{% elsif device.___ == false %}
					{% assign ___ = nw %}
				{% else %}
					{% assign ___ = nt %}
				{% endif %}

EOF

for FEATURE in ${FEATURES[@]}; do
    echo $SINGLE_CHECK | sed "s;___;$FEATURE;g"
done
