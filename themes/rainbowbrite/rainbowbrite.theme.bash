#!/usr/bin/env bash

# based off of n0qorg
# looks like, if you're in a git repo:
# ± ~/path/to (branch ✓) $
# in glorious red / blue / yellow color scheme

prompt_setter() {
  # Save history
  history -a
  history -c
  history -r
  # displays user@server in purple
  # PS1="$red$(scm_char) $purple\u@\h$reset_color:$blue\w$yellow$(scm_prompt_info)$(ruby_version_prompt) $black\$$reset_color "
  # no user@server
  PS1="${purple}\w$white$(scm_prompt_info) ${white}➡️ $normal "
  PS2='> '
  PS4='+ '
}

safe_append_prompt_command prompt_setter

SCM_NONE_CHAR='·'
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"
SCM_THEME_PROMPT_PREFIX=" ("
SCM_THEME_PROMPT_SUFFIX="${white})"
RVM_THEME_PROMPT_PREFIX=" ("
RVM_THEME_PROMPT_SUFFIX=")"
