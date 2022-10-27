#: If you come from bash you might have to change your $PATH.

export TZ='Asia/Shanghai'
HIST_STAMPS="mm/dd/yyyy"
export EDITOR="nvim"
export LC_ALL=zh_CN.UTF-8
bindkey ',,' autosuggest-accept

# Edit the current command line in $EDITOR
# You can also use fc to edit the last command in history.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# upload something
sprunge() {
  if [[ $1 ]]; then
    curl -F 'sprunge=<-' "http://sprunge.us" <"$1"
  else
    curl -F 'sprunge=<-' "http://sprunge.us"
  fi
}
transfer_url="https://transfer.sh/"
transfer(){ if [ $# -eq 0  ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file"  ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file"  ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "${transfer_url}$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "${transfer_url}$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "${transfer_url}$file_name"|tee /dev/null;fi; }

csview()
{
local file="$1"
sed "s/,/\t/g" "$file" | less -S
}

mkd() { mkdir -p "$@" && cd "$@"; }
init(){ mkdir -p "$@" && cd "$@" && cap download; }
rmd() {currtDirname=$(basename $(pwd)); cd .. && rm $currtDirname }
extractin() { extract "$@" && rm "$@" && cd $(echo $@ | sed 's/\.[^.]*$//') }
#xls2xlsx() { libreoffice --convert-to xlsx "$@" }
#xlsx2xls() { libreoffice --convert-to xls "$@" }

#Other
bindkey \^K kill-line
bindkey \^U backward-kill-line

# fzf
#export FZF_DEFAULT_ COMMAND="ag -g"
export FZF_DEFAULT_OPTS="--reverse --inline-info"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle    -N    fzf-history-widget-accept
#bindkey '^X' fzf-history-widget-accept
bindkey "^[OA" fzf-history-widget
bindkey "^[[A" fzf-history-widget
bindkey "^[OB" fzf-history-widget
bindkey "^[[B" fzf-history-widget
fzfp() {fzf --preview '[[ $(file --mime {}) =$HOME binary ]] && echo {} is a binary file || (rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'}
alias tt='fzf --preview '"'"'[[ $(file --mime {}) =$HOME binary ]] && echo {} is a binary file || (rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'"'"

#github
gclone()  { git clone --recursive "$@" && cd `echo $@ | sed 's/^.*\///g' | sed 's/\.git$//g'` }
gupload() { git add -A && git commit -m "$@" && sleep 2 && git push }
gautocm() { git add -A; git commit -m "`gcommit`" }

# normal
bak() {if [[ $@ == *.bak ]]; then echo "it have been bak";else mv "$@" "$@.bak";echo "$@.bak";fi}
unbak() {if [[ $@ == *.bak ]]; then name=$(echo "$@" | rev | cut -f 2- -d '.' | rev );mv $@ $name;echo $name;else echo "it have been unbak";fi}
lcp() {sudo cp -rp $1 $(dirname $1)/$2 && echo $(dirname $1)/$2}
lmv() {sudo mv    $1 $(dirname $1)/$2 && echo $(dirname $1)/$2}
get_statuscode() { curl -o /dev/null --silent --head --write-out '%{http_code}\n' "$@" }
runc++() {cpp=`basename $@`;g++ -o ${cpp%%.*}  $@ && ./${cpp%%.*} && rm ${cpp%%.*} }


echo "██╗   ██╗███╗   ███╗      ███╗   ██╗██╗██╗  ██╗";
echo "██║   ██║████╗ ████║      ████╗  ██║██║╚██╗██╔╝";
echo "██║   ██║██╔████╔██║█████╗██╔██╗ ██║██║ ╚███╔╝ ";
echo "╚██╗ ██╔╝██║╚██╔╝██║╚════╝██║╚██╗██║██║ ██╔██╗ ";
echo " ╚████╔╝ ██║ ╚═╝ ██║      ██║ ╚████║██║██╔╝ ██╗";
echo "  ╚═══╝  ╚═╝     ╚═╝      ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝";
echo "                                       by:Eloco";
