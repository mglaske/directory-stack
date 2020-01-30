#!/bin/bash

# wdaliases 
#  A series of aliases for the wd commands
#  This file needs to be sourced from .bashrc or something similar
#

if [ -z "$WDHOME" ]; then
  export WDHOME=$HOME/.wd
fi

if [ -z "$WDSIZE" ]; then
  export WDSIZE=10
fi

# add bash completion
if [ ! -z "$BASH" ]; then
  source $WDHOME/completion.sh
fi

# slurp current scheme
wdscheme=`cat $WDHOME/currentscheme`

if [ -z "$wdscheme" ]; then
  export wdscheme=default
fi

# Change to the default stored directory (position 0)
alias wd="cd \"\`$WDHOME/cdretr.pl 0\`\""
alias wd0='wd'

# wd1-wdN change into their respective stored directories
for ((i=0; i<=$WDSIZE; i++)); do
  alias wd${i}="cd \"\`$WDHOME/cdretr.pl ${i}\`\""
done

# Store the current directory into the default position
alias wds='$WDHOME/cdstore.pl 0'
alias wds0='wds'

# wds1-wdsN store the current directory the respective position (1 thru $WDSIZE-1)
for ((i=0; i<=$WDSIZE; i++)); do
  alias wds${i}='$WDHOME/cdstore.pl '${i}
done

# wdl lists all stored directories for the current scheme.
alias wdl='$WDHOME/wdlist.pl'

# wdc clears the stored list of directories
alias wdc="echo -n '' >\"\`$WDHOME/wdscheme.pl\`\""

# changes schemes: wdscheme <scheme>
alias wdscheme='$WDHOME/wdscheme.sh'

# dumps working dirs to environment vars
alias wdenv="$WDHOME/wdenv.pl > $WDHOME/wdenv && source $WDHOME/wdenv"

