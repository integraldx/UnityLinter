ARG unity_version
ARG unity_platform
FROM gableroux/unity3d:$unity_version-$unity_platform

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN mkdir /workspace

ENTRYPOINT [ "/entrypoint.sh" ]