#!/bin/bash

echo "Intalling IntelliJ configs..."
CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/configs"

for i in $HOME/Library/Preferences/IntelliJIdea*  \
         $HOME/Library/Preferences/IdeaIC*        \
         $HOME/Library/Preferences/AndroidStudio* \
         $HOME/.IntelliJIdea*/config              \
         $HOME/.IdeaIC*/config                    \
         $HOME/.AndroidStudio*/config
do
  if [[ -d $i ]]; then

    # Install codestyles
    mkdir -p $i/codestyles
    cp -frvL "$CONFIGS/codestyles"/* $i/codestyles

    # Install inspections
    # mkdir -p $i/inspection
    # Scp -frv "$CONFIGS/inspection"/* $i/inspection

    # Install options ("Exclude from Import and Completion")
    mkdir -p $i/options
    cp -frLv "$CONFIGS/options"/* $i/options
  fi
done

echo "Done."
echo ""
