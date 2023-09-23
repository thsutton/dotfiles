#!/bin/sh
#
# Re-/configure X when screens are hotplugged.
#

laptop="AF06403D00000000"
hdmi_1="2D4C0D205A5A5042"

case "${SRANDRD_EVENT}" in
    connected)
        case "${SRANDRD_EDID}" in
            "$hdmi_1")
                xrandr --output "${SRANDRD_OUTPUT}" --auto --above eDP-1
                ;;
        esac
        ;;
    disconnected)
        xrandr --output "${SRANDRD_OUTPUT}" --off
        ;;
esac
