#!/bin/bash -l

wait_file() {
    local file="$1"; shift
    local wait_seconds="${1:-10}"; shift

    until test $((wait_seconds--)) -eq 0 -o -e "$file" ; do sleep 1; done

    ((++wait_seconds))
}

if [ -d /project ]; then
    /opt/Unity/Editor/Unity -batchmode -nographics -projectPath /project -runTests -testResults /project/testResults.xml -logFile /project/Editor.log
    wait_file /project/testResults.xml 60
else
    echo "Error: /project not found."
    exit 1
fi

echo "::set-output name=testResultFile::testResults.xml" 
echo "::set-output name=editorLogFile::Editor.log" 
