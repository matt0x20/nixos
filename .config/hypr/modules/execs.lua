-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function () 
    hl.exec_cmd(shell)
    hl.exec_cmd(polkit)
    hl.exec_cmd(kdeconnect)
    hl.exec_cmd("gsettings set org.gnome.desktop.wm.preferences button-layout ':'") -- remove window buttons gtk
end)