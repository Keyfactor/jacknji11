# JackNJI

Provides a Java PKCS#11 interface that provides low-level interface
as close as possible to the cryptoki C interface and wraps with
Java-styled interface providing convenience methods and using
exceptions for error handling.

Uses a provider architecture to allow any implementation of the
native mapping. Includes [JNA](https://github.com/java-native-access/jna)
as default provider to bridge between Java and native cryptoki lib.

We use this library as the [foundational building block for our PKCS#11
provider P11NG](https://neo.repoman.primekey.com/keyfactor-commons/jacknji11).

This repository is a fork of [github.com/JoelHockey/jacknji11](https://github.com/joelhockey/jacknji11).

## Use

### Maven

Put the following dependency in your ``pom.xml``:

```xml
<dependency>
    <groupId>com.keyfactor</groupId>
    <artifactId>jacknji11</artifactId>
    <version>1.2.12</version>
</dependency>
```
## Building

You need to connect to `vpn.primekey.com` to resolve internal build dependencies.

Then build with Maven:

```
mvn versions:set -DnewVersion=$(git tag -l | tail -n 1 | tr -d 'v')
mvn package source:jar -DskipTests
```

This will produce both the `.jar` and the `-sources.jar` in the `target` folder
without running the tests.

## Release

Jenkins X will automatically create a new release when commits are made to the `release/keyfactor` branch.

The `jar` file is published to [Artifactory](https://artifactory.primekey.com/ui/packages/gav:%2F%2Fcom.keyfactor:jacknji11?name=jacknji&type=packages).

Before release, integration testing is done against [SoftHSM 2](https://github.com/opendnssec/SoftHSMv2).

## Contribute upstream

Improvements and bug fixes should be contributed upstream. The `master` branch is kept in sync with [our fork on GitHub](https://github.com/Keyfactor/jacknji11).

Check [the documentation](https://docs.k8s.primetest.se/development/contribute-upstream.html) for details how to push to GitHub and create a PR.
