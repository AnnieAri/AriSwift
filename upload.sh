#!/bin/bash

git stash
git pull origin master --tags
git stash pop
podLibName=AriPod
moduleName=AriSwift
VersionString=`grep -E 's.version.*=' ${moduleName}.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`

NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' ${moduleName}.podspec | cut -d : -f1`
sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" ${moduleName}.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git add .
git commit -am ${NewVersionNumber}
git tag ${NewVersionNumber}
git push origin master --tags

cd ~/.cocoapods/repos/${podLibName} && git pull origin master && cd - && pod repo push ${podLibName} ${moduleName}.podspec --verbose --allow-warnings --use-libraries

