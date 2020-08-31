FROM gableroux/unity3d:UNITY_VERSION-UNITY_PLATFORM

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]