{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
#--- КЛАВИША МОДИФИКАТОР ------------------------------------------------------
      "$mainMod" = "SUPER";

#--- ПЕРЕМЕННЫЕ ---------------------------------------------------------------
      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hyprland.org/Configuring/Keywords/

      # Set programs that you use
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

#--- НАСТРОЙКА МОНИТОРОВ ------------------------------------------------------
      ################
      ### MONITORS ###
      ################

      # See https://wiki.hyprland.org/Configuring/Monitors/

      monitor = ",preferred,auto";
      monitor = ",preferred,auto,1";

#--- ПЕРЕМЕННЫЕ ОКРУЖЕНИЯ -----------------------------------------------------
      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hyprland.org/Configuring/Environment-variables/

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,36"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

#--- УСТРОЙСТВА ВВОДА ---------------------------------------------------------
      #############
      ### INPUT ###
      #############

      # https://wiki.hyprland.org/Configuring/Variables/#input

      input = {
        kb_layout = "us,ru";
        kb_variant = "lang";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        numlock_by_default = true ;
      };

#--- НАСТРОЙКА УСТРОЙСТВ ------------------------------------------------------

      # device = {
      #   name = "epic-mouse-v1";
      #   sensitivity = "-0.5";
      # }

#--- ГАПСЫ, БОРДЕРЫ, ЦВЕТА... -------------------------------------------------
      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hyprland.org/Configuring/Variables/

      # https://wiki.hyprland.org/Configuring/Variables/#general

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(f2cdcdee) rgba(f5e0dcee) 45deg";
        "col.inactive_border" = "rgba(1e1e2eff)";
        resize_on_border = false;
        allow_tearing = false;

        layout = "dwindle";

        no_cursor_warps = false;
      };

#--- ДЕКОРАЦИИ ОКОН -----------------------------------------------------------
      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
          vibrancy = 0.1696
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

#--- АНИМАЦИИ -----------------------------------------------------------------
      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

#--- НАСТРОЙКА ЛАЙОУТОВ -------------------------------------------------------
      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
        new_is_master = true;
      };

#--- ЖЕСТЫ --------------------------------------------------------------------
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

#--- ВКЛЮЧИТЬ ДЕФОЛТНЫЕ ОБОИ --------------------------------------------------
      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

#--- ПРАВИЛА ОКОН -------------------------------------------------------------
# hyprctl clients - что бы узнать класс приложения
      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

      windowrule = [
        "float, ^(imv)$"
        "float, ^(mpv)$"
      ];

#--- АВТОСТАРТ ----------------------------------------------------------------
      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:

      exec-once = [
        "swww init"
        "swww img ~/Downloads/nixos-chan.png"
        "waybar & mako & firefox & pipewire"
        "telegram-desktop -startintray"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      ####################
      ### KEYBINDINGSS ###
      ####################

      # See https://wiki.hyprland.org/Configuring/Keywords/

      bind = [
#--- ЗАПУСК ПРИЛОЖЕНИЙ --------------------------------------------------------
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

        "$mainMod, Return, exec, alacritty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, dolphin"
        "$mainMod, F, togglefloating,"
        "$mainMod, D, exec, wofi --show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"

#--- ПЕРЕКЛЮЧЕНИЕ ФОКУСА ------------------------------------------------------
        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

#--- ПЕРЕМЕЩЕНИЕ ПЛАВАЮЩИИХ ОКОН ----------------------------------------------
        "$mainMod ALT, right, moveactive, 50 0"
        "$mainMod ALT, left, moveactive, -50 0"
        "$mainMod ALT, up, moveactive, 0 -50"
        "$mainMod ALT, down, moveactive, 0 50"

#--- ПЕРЕМЕЩЕНИЕ ОКОН --------------------------------------------------------
        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

#--- СКРАЧПАД -----------------------------------------------------------------
        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

#--- РЕСАЙЗ -------------------------------------------------------------------
        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

#--- ПЕРЕКЛЮЧЕНИЕ ВОРКСПЕЙСОВ -------------------------------------------------
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

#--- ПЕРЕМЕЩЕНИЕ ОКОН НА ДРУГОЙ ВОРКСПЕЙС -------------------------------------
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

#--- ПЕРЕХОД ПО ВОРКСПЕЙСАМ КОЛЕСОМ МЫШИ --------------------------------------
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Keyboard backlight
        "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        
        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

        # Configuration files
        ''$mainMod SHIFT, N, exec, alacritty -e sh -c "rb"''
        ''$mainMod SHIFT, C, exec, alacritty -e sh -c "conf"''
        ''$mainMod SHIFT, H, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/wms/hyprland.nix"''
        ''$mainMod SHIFT, W, exec, alacritty -e sh -c "nvim ~/nix/home-manager/modules/wms/waybar.nix''
        '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

        # Waybar
        "$mainMod, B, exec, pkill -SIGUSR1 waybar"
        "$mainMod, W, exec, pkill -SIGUSR2 waybar"

        # Disable all effects
        "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "
      ];

#--- ПЕРЕМЕЩЕНИЕ И РЕСАЙЗ ОКОН МЫШЬЮ ------------------------------------------
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
