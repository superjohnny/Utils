
#test for appledoc presence
which appledoc

if [ $? -eq 0 ]; then

    #see if the docs need to be recompiled
    cmdout=$(find . -name '*.[hm]' -exec ls -t {} + | head -1)
    latest_edited_file=$(echo $cmdout)

    #find the latest file that was edited and compare the last time the help docs have been compiled
    if [ "/tmp/compile_help.stamp" -nt "$latest_edited_file" ]; then
        echo "no changes detected, nothing to do..."
    else

        clear

        echo "Compiling the complete docset..."

        appledoc Vanguard/AppledocSettings-complete.plist .
        rm -rf Documentation/Complete/Publish
        rm -rf Documentation/Complete/docset
        echo "Compiling the complete docset...done"
        osascript -e 'display notification "The complete help compilation has been completed" with title "AppleDocs" subtitle "Complete doc set" sound name "Frog"'

        clear

        echo "Compiling the public only docset..."
        appledoc Vanguard/AppledocSettings-public.plist .
        rm -rf Documentation/Public/Publish
        rm -rf Documentation/Public/docset
        echo "Compiling the public only docset...done"
        osascript -e 'display notification "The public help compilation has been completed" with title "AppleDocs" subtitle "Public doc set" sound name "Glass"'

        #touch the timestamp
        touch /tmp/compile_help.stamp
    fi

    exit 0
else

    osascript -e 'tell app "Xcode" to display dialog "Appledocs not found. \r\n\r\nInstall it from https://github.com/tomaz/appledoc\r\n\r\nBuild it and copy it to your /usr/bin folder. Type echo $PATH to find this folder." with title "Cannot compile documentation"'

    exit 1
fi