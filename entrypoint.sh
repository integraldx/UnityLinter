#!/bin/bash -l

wait_file() {
    local file="$1"; shift
    local wait_seconds="${1:-10}"; shift

    until test $((wait_seconds--)) -eq 0 -o -e "$file" ; do sleep 1; done

    ((++wait_seconds))
}

if [ -d "/workspace" ]
then
    echo "Running unity..."
    /opt/Unity/Editor/Unity -serial "${UNITY_SERIAL}" -username "${UNITY_USERNAME}" -password "${UNITY_PASSWORD}" -batchmode -nographics -projectPath /workspace -runTests -testResults /workspace/testResults.xml -logFile /workspace/Editor.log
    echo "Waiting for test result..."
    wait_file /workspace/testResults.xml 60
    cat /workspace/testResults.xml
    cat /workspace/Editor.log
    cat /workspace/ProjectSettings/ProjectSettings.asset
    /opt/Unity/Editor/Unity -returnlicense -batchmode -quit
    sleep 10
else
    echo "Error: /workspace not found."
    exit 1
fi

echo "::set-output name=testResultFile::testResults.xml" 
echo "::set-output name=editorLogFile::Editor.log" 
