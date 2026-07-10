rule = {
    matches = {
        {
            {"node.name", "equals", "alsa_input.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.mono-fallback"},
        },
    },

    apply_properties = {
        ["node.description"] = "USB Audio Device",
        ["node.nick"] = "USB Audio Device",
        ["priority.session"] = 2050,
    },
}

table.insert(alsa_monitor.rules, rule)
