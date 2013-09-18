#!/bin/bash --login

ruby_version="1.9.3"
gemset_name="plcocoapods"

if [ "$#" == "0" ]; then
    echo "Usage: './setup.sh NEW_APP_NAME'"
    echo "Make sure you only call this from the root of PLTemplate (i.e. not '../setup.sh')"
    exit 1
fi

# Ensure dependencies are all present
declare -a required_programs
#make sure ruby is installed
command -v ruby >/dev/null 2>&1 || required_programs=("${required_programs[@]}" "ruby")
# check if bundler is installed
command -v bundle >/dev/null 2>&1 || required_programs=("${required_programs[@]}" "bundler")
command -v rvm >/dev/null 2>&1 || required_programs=("${required_programs[@]}" "rvm")
if [[ ${#required_programs[@]} > 0 ]]; then
    echo Missing required programs: "${required_programs[@]}" >&2
    exit 1
fi

# Create gemset for this project
echo "Create .versions.conf for this project: "$ruby_version@$gemset_name"..."
rvm --create --versions-conf use "$ruby_version@$gemset_name"

# Install cocoapods
echo "Install Cocoapods and other gems..."
bundle install

# Install pods
echo "Install pods..."
pod install

# Check for outdated pods
echo "Check for outdated pods in the CocoaPods Podfile..."
pod outdated

exit

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

