#!/bin/sh -l

/opt/Unity/Editor/Unity -batchmode -projectPath /project -runTests -testResults /project/testResults.xml -logFile /project/Editor.log -quit
echo "::set-output name=testResultFile::testResults.xml" 
echo "::set-output name=editorLogFile::Editor.log" 
