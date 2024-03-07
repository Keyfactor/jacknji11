# About

This repository provides a Java PKCS#11 interface that provides low-level interface as close as
possible to the cryptoki C interface and wraps with Java-styled interface providing convenience
methods and using exceptions for error handling.

Uses a provider architecture to allow any implementation of the  native mapping. Includes
[JNA](https://github.com/java-native-access/jna) as default provider to bridge between Java and
native cryptoki library.

## Install

Build with:

```shell
mvn -DskipTests install
```

## Run tests with SoftHSM

The tests, from `src/test/java/org/pkcs11/jacknji11/CryptokiTest.java`, are run on every call to `mvn install`.
In order to run the tests on SoftHSM you can do this:

### Ubuntu

```shell
sudo apt install -y softhsm2
SLOT_ID=$(softhsm2-util --init-token --free --label "test" --pin 1234 --so-pin 1234 | tail -n 1 | awk '{ print $NF }')
export JACKNJI11_TEST_TESTSLOT="$SLOT_ID"
export JACKNJI11_TEST_INITSLOT="$SLOT_ID"
export JACKNJI11_TEST_USER_PIN=1234
export JACKNJI11_TEST_SO_PIN=1234
export JACKNJI11_PKCS11_LIB_PATH=/usr/lib/x86_64-linux-gnu/softhsm/libsofthsm2.so
```

## Make a release

Create a tag and push it to the repository. GitHub will then create a release for you.

```shell
mvn versions:set -DnewVersion=X.Y.Z
git add pom.xml
git commit "feat: release X.Y.Z"
git push
git tag "vX.Y.Z" -m "🚀 Release version X.Y.Z"
git push origin "vX.Y.Z"
```
