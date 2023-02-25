from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

# Startup hook
import os
import subprocess

from libqtile import hook


@hook.subscribe.startup
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([home])


# End of startup hook


mod = "mod4"
terminal = "alacritty"

# Keybindings
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Control window sizes
    Key([mod], "i", lazy.layout.grow(), desc="Grow focused window"),
    Key([mod], "o", lazy.layout.shrink(), desc="Shrink focused window"),
    Key([mod], "n", lazy.layout.reset(), desc="Reset all windows to default size"),
    Key(
        [mod],
        "m",
        lazy.layout.maximize(),
        desc="Toggle focused window between it's maximum and minumum sizes",
    ),
    # Flip master pane
    Key(
        [mod, "shift"],
        "space",
        lazy.layout.flip(),
        desc="Flip master pane between left and right",
    ),
    # Launch terminal
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Basic functionality
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Custom keybinds
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle focused window to fullscreen",
    ),
    Key(
        [mod, "shift"],
        "f",
        lazy.window.toggle_floating(),
        desc="Toggle focused window to floating",
    ),
    Key([mod, "shift"], "s", lazy.spawn("flameshot gui"), desc="Run flameshot gui"),
    Key(
        [mod],
        "r",
        lazy.spawn(
            "rofi -modi drun -show drun -display-drun 'RUN' -font 'JetBrainsMono Nerd Font 12' -show-icons"
        ),
        desc="Spawn rofi",
    ),
]

# Colors
# Snazzy
snazzy = [
    ["#282a36", "#282a36"],  # bg         [0]
    ["#eff0eb", "#eff0eb"],  # fg         [1]
    ["#686868", "#686868"],  # black      [2]
    ["#ff5c57", "#ff5c57"],  # red        [3]
    ["#5af78e", "#5af78e"],  # green      [4]
    ["#f3f99d", "#f3f99d"],  # yellow     [5]
    ["#57c7ff", "#57c7ff"],  # blue       [6]
    ["#ff6ac1", "#ff6ac1"],  # magenta    [7]
    ["#9aedfe", "#9aedfe"],  # cyan       [8]
    ["#f1f1f0", "#f1f1f0"],  # white      [9]
]

# Horizon Dark
colors = [
    ["#1c1e26", "#1c1e26"],  # bg         [0]
    ["#e0e0e0", "#e0e0e0"],  # fg         [1]
    ["#5b5858", "#5b5858"],  # black      [2]
    ["#e95678", "#ec6a88"],  # red        [3]
    ["#29d398", "#3fdaa4"],  # green      [4]
    ["#fab795", "#fbc3a7"],  # yellow     [5]
    ["#26bbd9", "#3fc4de"],  # blue       [6]
    ["#ee64ac", "#f075b5"],  # magenta    [7]
    ["#59e1e3", "#6be4e6"],  # cyan       [8]
    ["#d5d8da", "#d5d8da"],  # white      [9]
]


# Groups/Workspaces
groups = [
    Group("1", label="一"),
    Group("2", label="二", matches=[Match(wm_class=["firefox"])]),
    Group(
        "3",
        label="三",
        matches=[Match(wm_class=["jetbrains-studio", "Postman", "VSCodium"])],
    ),
    Group("4", label="四", matches=[Match(wm_class=["Pcmanfm"])]),
    Group("5", label="五", matches=[Match(wm_class=["Spotify"])]),
    Group("6", label="六", matches=[Match(wm_class=["discord"])]),
    Group(
        "7",
        label="七",
        matches=[
            Match(wm_class=["Nitrogen", "Lxappearance", "Xfce4-power-manager-settings"])
        ],
    ),
    # Group("8", label="八"),
    # Group("9", label="九", matches=[Match(wm_class=["Nitrogen", "Lxappearance", "Xfce4-power-manager-settings"])]),
]

for i in groups:
    keys.extend(
        [
            # mod + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + letter of group = move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="move focused window to group {}".format(i.name),
            ),
        ]
    )

# Scratchpads
groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown("term", "alacritty", width=0.75, height=0.75, x=0.125, y=0.125),
            DropDown(
                "pulsemixer",
                "alacritty -e pulsemixer",
                width=0.50,
                height=0.50,
                x=0.25,
                y=0.25,
            ),
        ],
    )
)

# Scratchpad keybinds
keys.extend(
    [
        Key([mod, "shift"], "return", lazy.group["scratchpad"].dropdown_toggle("term")),
        Key(
            [mod, "shift"], "v", lazy.group["scratchpad"].dropdown_toggle("pulsemixer")
        ),
    ]
)

# Layout Theme
layout_theme = {
    "margin": 8,
    "border_width": 2,
    "border_focus": colors[3],
    "border_normal": colors[0],
}

# Layouts
layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Floating(),
    # layout.Matrix(),
    # layout.MonadThreeCol(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Slice(),
    # layout.Spiral(),
    # layout.Stack(num_stacks=2),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# Widgets
widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=18,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.TextBox(
                #  padding=0,
                #  text='',
                #  fontsize= 27,
                #  foreground= colors[6],
                # ),
                widget.CurrentLayoutIcon(
                    scale=0.75,
                    background=colors[6],
                ),
                widget.TextBox(
                    padding=0,
                    text="",
                    fontsize=37,
                    foreground=colors[0],
                    background=colors[6],
                ),
                widget.CurrentLayout(
                    foreground=colors[0],
                    background=colors[6],
                ),
                widget.TextBox(
                    padding=0,
                    text="",
                    fontsize=32,
                    foreground=colors[6],
                    background=colors[5],
                ),
                widget.Memory(
                    format=" : {MemUsed:.0f} {mm}B",
                    update_interval=3.0,
                    foreground=colors[0],
                    background=colors[5],
                ),
                widget.TextBox(
                    padding=0,
                    text="",
                    fontsize=32,
                    foreground=colors[5],
                    background=colors[7],
                ),
                widget.CPU(
                    format=" : {load_percent} %",
                    update_interval=3.0,
                    foreground=colors[0],
                    background=colors[7],
                ),
                widget.TextBox(
                    padding=0,
                    text="",
                    fontsize=32,
                    foreground=colors[7],
                ),
                widget.Spacer(),
                # widget.TextBox(
                #  padding=0,
                #  text='',
                #  fontsize= 47,
                #  foreground= colors[1],
                # ),
                widget.Sep(
                    padding=15,
                    size_percent=100,
                    foreground=colors[1],
                ),
                widget.GroupBox(
                    fontsize=22,
                    padding=10,
                    disable_drag=True,
                    active=colors[1],
                    inactive=colors[2],
                    background=colors[0],
                    highlight_method="line",
                    this_current_screen_border=colors[3],
                    highlight_color=colors[0],
                ),
                widget.Sep(
                    padding=15,
                    size_percent=100,
                    foreground=colors[1],
                ),
                # widget.TextBox(
                #    padding=0,
                #    text='',
                #    fontsize= 47,
                #    foreground= colors[1],
                # ),
                widget.Spacer(),
                widget.TextBox(
                    padding=0,
                    text="",
                    fontsize=32,
                    foreground=colors[2],
                ),
                widget.Systray(
                    background=colors[2],
                ),
                # widget.TextBox(
                #    padding=0,
                #    text='',
                #    fontsize= 32,
                #    foreground= colors[7],
                #    background= colors[2],
                # ),
                # widget.CapsNumLockIndicator(
                #    foreground= colors[0],
                #    background= colors[7],
                # ),
                widget.TextBox(
                    padding=0,
                    text="",
                    fontsize=32,
                    foreground=colors[5],
                    background=colors[2],
                ),
                widget.Battery(
                    charge_char="",
                    discharge_char="",
                    full_char="",
                    unknown_char="",
                    show_short_text=False,
                    format="{char}: {percent:2.0%}",
                    update_interval=300,
                    foreground=colors[0],
                    background=colors[5],
                ),
                widget.TextBox(
                    padding=0,
                    text="",
                    fontsize=32,
                    foreground=colors[6],
                    background=colors[5],
                ),
                widget.Clock(
                    format=" : %H:%M",
                    foreground=colors[0],
                    background=colors[6],
                ),
                # widget.TextBox(
                #   padding=0,
                #   text='',
                #   fontsize= 27,
                #   foreground= colors[6],
                # ),
            ],
            size=33,
            margin=[8, 8, 0, 8],
            opacity=0.80,
            background=colors[0],
            border_width=[6, 3, 6, 3],
            border_color="#1c1e26",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

wmname = "Qtile"
