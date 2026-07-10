rule = {
    matches = {
        {
            {"node.name", "equals", "alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo"},
        },
    },

    apply_properties = {
        ["node.description"] = "USB Audio Device",
        ["node.nick"] = "USB Audio Device",
        ["priority.session"] = 1050,
    },
}

table.insert(alsa_monitor.rules, rule)
