switch (uname)
    case Darwin
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export HOMEBREW_NO_INSTALL_CLEANUP=TRUE
        export HOMEBREW_NO_ENV_HINTS=TRUE
        alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
    case Linux
        set -gx DOCKER_HOST unix:///run/user/1000/podman/podman.sock
        set -gx PATH $PATH /home/karan/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin
    case '*'
        # do things for other OSs
end

set -U fish_greeting

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.lmstudio/bin"

fzf --fish | source
bind -M insert "ç" fzf-cd-widget
