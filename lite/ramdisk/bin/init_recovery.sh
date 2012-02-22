#!/sbin/bash

echo "Running the initialization script..."

if [ "$1" == "SHOLS" ]; then
	TABLET=0
else
	TABLET=1
fi

#run the initializers
#=======================================

SCRIPTS_DIR=/sdcard/OpenRecovery/scripts

if [ -d $SCRIPTS_DIR ]
then
	for SCRIPT in "$SCRIPTS_DIR/"*.sh; do
		#omit the default one
		if [ "$SCRIPT" != "$SCRIPTS_DIR/*.sh" ]
		then
			dos2unix -u "$SCRIPT"
		fi
	done
fi

#initialize the application menu
#=======================================

if [ -d /sdcard/OpenRecovery/app/ ]
then

	mkdir /app
	cp -fR /sdcard/OpenRecovery/app/ /
	chmod -R 0755 /app
	
	APP_DIR=/app

	for APPINIT in "$APP_DIR/"*.sh; do
		#omit if there is none
		if [ "$APPINIT" != "$APP_DIR/*.sh" ]
		then
			BN_APPINIT=`basename "$APPINIT"`
			echo "Calling application initializer $BN_APPINIT file."
			"$APPINIT"
		fi
	done
fi
