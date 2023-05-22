@echo off

docker ps -a --filter "name=Yanulov_AI_Docker_for_adm" | findstr "Yanulov_AI_Docker_for_adm"
IF %ERRORLEVEL% EQU 1 (
    docker build -t my-vscode-server .
    docker run --name Yanulov_AI_Docker_for_adm -p 8080:8080 -v "${PWD}:/home/coder/project" my-vscode-server 
) ELSE (
    docker start Yanulov_AI_Docker_for_adm
)
FOR /F "tokens=*" %%A IN ('docker ps -aqf "name=Yanulov_AI_Docker_for_adm"') DO SET CONTAINER_ID=%%A
docker cp %CONTAINER_ID%:/home/coder/.config/code-server/config.yaml "%CD%\config_for_Yanulov_AI_Docker_for_adm.txt"
start "" "http://localhost:8080/"
config_for_Yanulov_AI_Docker_for_adm.txt