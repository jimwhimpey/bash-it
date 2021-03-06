# BarbUk theme

A minimal theme with a clean git prompt

## Provided Information

* Current git remote tool logo (support: github, gitlab, bitbucket)
* Current path (red when user is root)
* Current git info
* Last command exit code (only shown when the exit code is greater than 0)
* user@hostname for ssh connection

## Fonts and glyphs

A font with SCM glyphs is required to display the default tool/host logos.
You can use a font from https://www.nerdfonts.com/ or patch your own font with the tool
provided by https://github.com/ryanoasis/nerd-fonts.

You can also override the default variables if you want to use different glyphs or standard ASCII characters.

### Default theme glyphs

```bash
SCM_GIT_CHAR_GITLAB='  '
SCM_GIT_CHAR_BITBUCKET='  '
SCM_GIT_CHAR_GITHUB='  '
SCM_GIT_CHAR_DEFAULT='  '
SCM_GIT_CHAR_ICON_BRANCH=''
EXIT_CODE_ICON=' '
```

### Customize glyphs

Define your custom glyphs before sourcing bash-it:

```bash
SCM_GIT_CHAR_GITHUB='•'
source "$BASH_IT"/bash_it.sh
```

## SSH prompt

### Usage

When using a ssh session, the theme will display `user@hostname`.
You can disable this information with `BASH_IT_THEME_BARBUK_SSH_INFO`.

The hostname is displayed in the FQDN format by default. You
can use the short hostname format with `BASH_IT_THEME_BARBUK_HOST_INFO`.

```bash
# short or long
export BASH_IT_THEME_BARBUK_HOST_INFO=short
# true or false
export BASH_IT_THEME_BARBUK_SSH_INFO=false
source "$BASH_IT"/bash_it.sh
```

### Keep theme with sudoer

If you want the theme to persist using `sudo -s` in a ssh session, you need to configure sudo to keep the `HOME` and `SSH_CONNECTION` environment variables.

`HOME` contains the path to the home directory of the current user. Keeping it will allow to use your user dotfiles when elevating privileges.

Keeping `SSH_CONNECTION` env is necessary for ssh detection in the theme.

Please refer to the following documentation for more information:
 -  [sudo manual](https://www.sudo.ws/man/1.8.13/sudoers.man.html) for `env_keep` configuration
 -  [openssh manual](https://linux.die.net/man/1/ssh) for information about `SSH_CONNECTION` environment

```bash
cat << EOF > /etc/sudoers.d/keepenv
Defaults env_keep += HOME
Defaults env_keep += SSH_CONNECTION
EOF
chmod 400 /etc/sudoers.d/keepenv
```

## Examples

### Clean

```bash
 ~ ❯ 
```

### Git

```bash
   ~/.dotfiles on  master ⤏  origin ↑2 •7 ✗ ❯
```

### Ssh

```bash
user@hostname in  ~/bash-it on  master ✓ ❯
```
