# It is recommended to use with a dark background.
#
# EDIT REFER Mar 2013 Yad Smood
# 2019 Yifei0727 

# VCS
YS_VCS_PROMPT_PREFIX1=" %{$fg[gray]%}on%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2=":%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}x"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}git${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}
#
local exit_code="%{$terminfo[bold]%}%(?,%{$fg[green]%}#,%{$fg[red]%}%?)%{$reset_color%}"

# Prompt format:
#
# For example:
#
# #[21:47:42] user@host:~ on git:master x
# $
PROMPT="$exit_code \
%{$fg[magenta]%}[%*] \
%(#,%{$bg[yellow]%}%{$fg[black]%}%n,%{$fg[cyan]%}%n)%{$reset_color%}\
%{$fg[\196]%}@\
%{$fg[blue]%}%m%{$reset_color%}\
%{$fg[\196]%}:\
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${hg_info}\
${git_info}
%{$terminfo[bold]$fg[white]%}$ %{$reset_color%}"
