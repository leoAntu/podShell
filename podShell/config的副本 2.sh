#!/bin/bash


Cyan='\033[0;36m'
Default='\033[0;m'

projectName=""
httpsRepo=""
sshRepo=""
homePage=""
authorName=""
authorEmail=""
confirmed="n"

getProjectName() {
    read -p "Enter Project Name: " projectName

    if test -z "$projectName"; then
        getProjectName
    fi
}

getHTTPSRepo() {
    read -p "Enter HTTPS Repo URL: " httpsRepo

    if test -z "$httpsRepo"; then
        getHTTPSRepo
    fi
}

getSSHRepo() {
    read -p "Enter SSH Repo URL: " sshRepo

    if test -z "$sshRepo"; then
        getSSHRepo
    fi
}

getHomePage() {
    read -p "Enter Home Page URL: " homePage

    if test -z "$homePage"; then
        getHomePage
    fi
}

getAuthorName() {
read -p "Enter Author Name: " authorName

if test -z "$authorName"; then
getAuthorName
fi
}

getAuthorEmail() {
read -p "Enter Author Email: " authorEmail

if test -z "$authorEmail"; then
getAuthorEmail
fi
}

getInfomation() {
    getProjectName
    getHTTPSRepo
    getSSHRepo
    getHomePage
    getAuthorName
    getAuthorEmail

    echo -e "\n${Default}================================================"
    echo -e "  Project Name  :  ${Cyan}${projectName}${Default}"
    echo -e "  HTTPS Repo    :  ${Cyan}${httpsRepo}${Default}"
    echo -e "  SSH Repo      :  ${Cyan}${sshRepo}${Default}"
    echo -e "  Home Page URL :  ${Cyan}${homePage}${Default}"
    echo -e "  Author Name   :  ${Cyan}${authorName}${Default}"
    echo -e "  Author Email  :  ${Cyan}${authorEmail}${Default}"
    echo -e "================================================\n"
}

echo -e "\n"
while [ "$confirmed" != "y" -a "$confirmed" != "Y" ]
do
    if [ "$confirmed" == "n" -o "$confirmed" == "N" ]; then
        getInfomation
    fi
    read -p "confirm? (y/n):" confirmed
done

mkdir -p "../${projectName}/${projectName}"

licenseFilePath="../${projectName}/FILE_LICENSE"
gitignoreFilePath="../${projectName}/.gitignore"
specFilePath="../${projectName}/${projectName}.podspec"
readmeFilePath="../${projectName}/readme.md"
uploadFilePath="../${projectName}/upload.sh"
podfilePath="../${projectName}/Podfile"
tagFilePath="../${projectName}/tag.sh"

echo "copy to $licenseFilePath"
cp -f ./templates/FILE_LICENSE "$licenseFilePath"
echo "copy to $gitignoreFilePath"
cp -f ./templates/gitignore    "$gitignoreFilePath"
echo "copy to $specFilePath"
cp -f ./templates/pod.podspec  "$specFilePath"
echo "copy to $readmeFilePath"
cp -f ./templates/readme.md    "$readmeFilePath"
echo "copy to $uploadFilePath"
cp -f ./templates/upload.sh    "$uploadFilePath"
echo "copy to $podfilePath"
cp -f ./templates/Podfile      "$podfilePath"
echo "copy to $tagFilePath"
cp -f ./templates/tag.sh       "$tagFilePath"

echo "editing..."
sed -i "" "s%__ProjectName__%${projectName}%g" "$gitignoreFilePath"
sed -i "" "s%__ProjectName__%${projectName}%g" "$readmeFilePath"
sed -i "" "s%__ProjectName__%${projectName}%g" "$uploadFilePath"
sed -i "" "s%__ProjectName__%${projectName}%g" "$podfilePath"
sed -i "" "s%__ProjectName__%${projectName}%g" "$tagFilePath"

sed -i "" "s%__ProjectName__%${projectName}%g"      "$specFilePath"
sed -i "" "s%__HomePage__%${homePage}%g"            "$specFilePath"
sed -i "" "s%__HTTPSRepo__%${httpsRepo}%g"          "$specFilePath"
sed -i "" "s%__AuthorName__%${authorName}%g"        "$specFilePath"
sed -i "" "s%__AuthorEmail__%${authorEmail}%g"      "$specFilePath"
echo "edit finished"

echo "cleaning..."
cd ../$projectName
git init
git remote add origin $sshRepo  &> /dev/null
git rm -rf --cached ./Pods/     &> /dev/null
git rm --cached Podfile.lock    &> /dev/null
git rm --cached .DS_Store       &> /dev/null
git rm -rf --cached $projectName.xcworkspace/           &> /dev/null
git rm -rf --cached $projectName.xcodeproj/xcuserdata/`whoami`.xcuserdatad/xcschemes/$projectName.xcscheme &> /dev/null
git rm -rf --cached $projectName.xcodeproj/project.xcworkspace/xcuserdata/ &> /dev/null
echo "clean finished"
say "finished"
echo "finished"
