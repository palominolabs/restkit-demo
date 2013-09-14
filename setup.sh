#!/bin/bash

if [ "$#" == "0" ]; then
    echo "Usage: './setup.sh NEW_APP_NAME'"
    echo "Make sure you only call this from the root of PLTemplate (i.e. not '../setup.sh')"
    exit 1
fi


new_app_name=$1

echo "Replacing all instances of 'PLTemplate' in files with '$new_app_name'"
grep -rIlZ --null "PLTemplate" PLTemplate* | xargs -0 sed -i '' "s/PLTemplate/$new_app_name/g"

echo "Rename all files and directories with 'PLTemplate' in the name to instead have '$new_app_name'"

# For each file (or directory) with PLTemplate in the name
while IFS= read -r -d $'\0' file_to_rename; do
  # If we have a case like 'PLTemplateTests/PLTemplateTest.h' we want to move to 'PLTemplateTests/NEWAPPNAMETest.h' not 'NEWAPPNAMETests/NEWAPPNAMETest.h'
  # ...because the directory will be moved later (due to '-d' passed to 'find')
  basename=$(basename "$file_to_rename")
  replaced_basename=${basename//PLTemplate/$new_app_name}
  if [[ $replaced_basename == $basename ]]; then
    continue
  fi
  replaced_file_path=${file_to_rename/%$basename/$replaced_basename}

  # Find out if the file is in git ('git mv' if so, 'mv' if not)
  git ls-files "$file_to_rename" --error-unmatch > /dev/null 2> /dev/null
  if [[ $? == 0 ]]; then
    git mv "$file_to_rename" "$replaced_file_path"
  else
    mv -v "$file_to_rename" "$replaced_file_path"
  fi
done < <(find -d . -name "*PLTemplate*" -print0)

# Check for outdated pods
echo "Check for outdated pods in the CocoaPods Podfile"
pod outdated
