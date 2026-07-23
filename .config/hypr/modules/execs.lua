-------------------
---- AUTOSTART ----
-------------------

local shell       = "noctalia"
local polkit      = "systemctl start --user polkit-gnome-authentication-agent-1"
local kdeconnect  = "sleep 5 && kdeconnect-indicator"

hl.on("hyprland.start", function () 
    hl.exec_cmd(shell)
    hl.exec_cmd(polkit)
    hl.exec_cmd(kdeconnect)
    hl.exec_cmd("gsettings set org.gnome.desktop.wm.preferences button-layout ':'") -- remove window buttons gtk
end)