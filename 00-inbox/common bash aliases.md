# Common Bash Aliases




![](../-assets/common%20bash%20aliases-2025-08-25-1302.png)

{ env, ... }:
 Common aliases for all shells

commonAliases = {
 List directory contents
l = "eza -lah";
ls = "eza";
tree
= "eza -tree --git-ignore";
 
 Utilities
cat = "bat";
top = "btop";
man = "batman";
 df = "duf";

 Misc
c = "clear";
h = "history";
mk = "(){ mkdir -p $1 && cd $1 }";
cdp = "pwd | xclip -selection clipboard";  copy dir path
cfp = "(){ readlink -f $1 | xclip -selection clipboard }";  copy file path
ports = "netstat -tulanp";
serve = "python3 -m http.server";
ゴ= "just"；

 Safety nets
ср = "ср -i";  Confirm before overwriting
 mv = "mv -i";  Confirm before overwriting
 rm= "rm -i";  Confirm before removing
rm = "gio trash";
 
 shortcuts
g = "lazygit";
y = "yazi";
ng = "bunx @angular/cli";
cc = "bunx @anthropic-ai/claude-code";
oc = "bunx opencode-ai";
gc = "bunx @google/gemini-cli";

 clean old user generations
 sudo nix-collect-garbage --delete-old
 
 clean system-wide garbage
 sudo /run/current-system/bin/switch-to-configuration boot  clean boot entries
 sudo nix flake update
 update flake inputs