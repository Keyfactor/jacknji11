# Set up SoftHSM and environment variables for JackNJI unit tests
SLOT_ID=$(softhsm2-util --init-token --free --label "test" --pin 1234 --so-pin 1234 | tail -n 1 | awk '{ print $NF }')
export JACKNJI11_TEST_TESTSLOT=$SLOT_ID
export JACKNJI11_TEST_INITSLOT=$SLOT_ID
export JACKNJI11_TEST_USER_PIN=1234
export JACKNJI11_TEST_SO_PIN=1234
export JACKNJI11_PKCS11_LIB_PATH=/usr/lib64/libsofthsm2.so