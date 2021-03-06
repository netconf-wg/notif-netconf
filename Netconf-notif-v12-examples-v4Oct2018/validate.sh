#!/bin/bash
#
# validate sample XML files
#
# NOTE: This script has paths local to the author's filesystem that
# will need changed for anyone else!!
#
PATHFLAGS="-p . -p /opt/git-repos/clean-yang/standard/ietf/RFC -p /opt/git-repos/clean-yang/standard/ietf/DRAFT -p /opt/git-repos/clean-yang/experimental/ietf-extracted-YANG-modules"
 #
# uncomment this to display a tree of the models
#
# yanglint $PATHFLAGS -f tree ietf-subscribed-notifications.yang ietf-yang-push.yang
 echo netconf-notif-2-establish-stream-response.xml/netconf-notif-1-establish-stream.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 example.yang \
	 netconf-notif-2-establish-stream-response.xml \
	 netconf-notif-1-establish-stream.xml
 echo netconf-notif-3-establish-stream-response-error.xml/netconf-notif-1-establish-stream.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 example.yang \
	 netconf-notif-3-establish-stream-response-error.xml \
	 netconf-notif-1-establish-stream.xml
 echo netconf-notif-5-modify-datastore-reponse-error-hint.xml/netconf-notif-4-modify-datastore.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 example-datastore.yang \
	 netconf-notif-5-modify-datastore-reponse-error-hint.xml \
	 netconf-notif-4-modify-datastore.xml
 echo netconf-notif-7-delete-error.xml/netconf-notif-6-delete.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 netconf-notif-7-delete-error.xml \
	 netconf-notif-6-delete.xml
 echo netconf-notif-11-subscription-started.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-subscribed-notifications.yang \
	 ietf-foo-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 example.yang \
	 netconf-notif-11-subscription-started.xml
 echo netconf-notif-12-subscription-completed.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 netconf-notif-12-subscription-completed.xml
 echo netconf-notif-13-subscription-terminated.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 netconf-notif-13-subscription-terminated.xml
 echo netconf-notif-14-vrrp-event-record.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-vrrp@2018-03-13.yang \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 netconf-notif-14-vrrp-event-record.xml
 echo netconf-notif-15-vrrp-xpath-filter.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-vrrp@2018-03-13.yang \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 netconf-notif-15-vrrp-xpath-filter.xml
 echo netconf-notif-16-vrrp-subtree-filter.xml
yanglint $PATHFLAGS -i -t auto \
	 ietf-vrrp@2018-03-13.yang \
	 ietf-subscribed-notifications.yang \
	 ietf-yang-push.yang \
	 netconf-notif-16-vrrp-subtree-filter.xml