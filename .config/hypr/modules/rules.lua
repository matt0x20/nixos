--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })

hl.window_rule({ match = { class = "zen" }, workspace = "2" })
hl.window_rule({ match = { class = "firefox" }, workspace = "2" })
hl.window_rule({ match = { class = "chromium" }, workspace = "2" })
hl.window_rule({ match = { class = "discord" }, workspace = "3" })
hl.window_rule({ match = { class = "cider" }, workspace = "3" })
-- hl.window_rule({ match = { class = "codium" }, workspace = "4" })
hl.window_rule({ match = { class = "xembedsniproxy" } }, workspace = "special:invisible")

hl.window_rule({ match = { workspace = "3" }, float = true })