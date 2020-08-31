FROM gableroux/unity3d:UNITY_VERSION-UNITY_PLATFORM

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]