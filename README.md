# macdirtycow

Flutter plugin for exploiting the MacDirtyCow vulnerability ([CVE-2022-46689](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-46689)) to gain full FileSystem access on iOS versions <= 16.1.2

As per the MDC exploit, you must add the "NSAppleMusicUsageDescription" key to your Info.plist, the value of this key being shown upon exploit sandbox usage request.
