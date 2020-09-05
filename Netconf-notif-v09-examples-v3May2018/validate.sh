#!/bin/bash
#
# Simple script to validate IETF YANG Push Example Payloads
#

#
# variable that may need customized just now
#
LIBYANG_EXTENSIONS_PLUGINS_DIR=/opt/git-repos/libyang/build/src/extensions
YANGLINT=/opt/git-repos/libyang/build/yanglint
YANGMODELS=/opt/git-repos/clean-yang


#
# Validate an input and output rpc
#
function validate_input_output() {
    err=`LIBYANG_EXTENSIONS_PLUGINS_DIR=$LIBYANG_EXTENSIONS_PLUGINS_DIR \
         $YANGLINT --verbose \
        -p . \
        -p $YANGMODELS/standard/ietf/RFC \
        -p $YANGMODELS/standard/ietf/DRAFT \
        -f xml \
        -t auto \
        ietf-subscribed-notifications.yang \
        ietf-yang-push.yang \
        $2 \
        $1 2>&1`
    if [ $? != 0  ]; then
        printf "validate_input_output: Failed $1 $2:\n$err\n\n"
    fi
}

function validate_edit_config() {
    err=`LIBYANG_EXTENSIONS_PLUGINS_DIR=$LIBYANG_EXTENSIONS_PLUGINS_DIR \
         $YANGLINT --verbose \
        -p . \
        -p $YANGMODELS/standard/ietf/RFC \
        -p $YANGMODELS/standard/ietf/DRAFT \
        -f xml \
        -t edit \
        ietf-subscribed-notifications.yang \
        ietf-yang-push.yang \
        $1 2>&1`
    if [ $? != 0  ]; then
        printf "validate_edit_config: Failed $1:\n$err\n\n"
    fi
}

function validate_notif() {
    err=`LIBYANG_EXTENSIONS_PLUGINS_DIR=$LIBYANG_EXTENSIONS_PLUGINS_DIR \
         $YANGLINT --verbose \
        -p . \
        -p $YANGMODELS/standard/ietf/RFC \
        -p $YANGMODELS/standard/ietf/DRAFT \
        -f xml \
        -t auto \
        ietf-subscribed-notifications.yang \
        ietf-yang-push.yang \
        $1 2>&1`
    if [ $? != 0  ]; then
        printf "validate_notif: Failed $1:\n$err\n\n"
    fi
}

# validate our RPC pairs
validate_input_output \
    netconf-notif-1-establish-stream.xml \
    netconf-notif-2-establish-stream-response.xml

validate_input_output \
    netconf-notif-1-establish-stream.xml \
    netconf-notif-3-establish-stream-response-error.xml

validate_input_output \
    netconf-notif-4-modify-datastore.xml \
    netconf-notif-5-modify-datastore-response-error-hint.xml

validate_input_output \
    netconf-notif-6-delete.xml \
    netconf-notif-7-delete-error.xml

validate_edit_config \
    netconf-notif-8-edit-config.xml

validate_edit_config \
    netconf-notif-10-edit-config-modify.xml

validate_notif \
    netconf-notif-11-subscription-started.xml

validate_notif \
    netconf-notif-12-subscription-completed.xml

validate_notif \
    netconf-notif-13-subscription-terminated.xml


#
#
# simple validation of YANG models
#
function validate_models() {
    echo validating ietf-yang-push@2018-03-07.yang...
    echo $YANGLINT --verbose \
        -p . \
        -p $YANGMODELS/standard/ietf/RFC \
        -p $YANGMODELS/standard/ietf/DRAFT \
        -f tree \
        ietf-yang-push@2018-03-07.yang
    echo validating ietf-subscribed-notifications@2018-02-23.yang...
    echo $YANGLINT --verbose \
        -p . \
        -p $YANGMODELS/standard/ietf/RFC \
        -p $YANGMODELS/standard/ietf/DRAFT \
        -f tree \
        ietf-subscribed-notifications@2018-02-23.yang
}
