#!/sbin/bash

#basic initialization
#===============================================================================

#mount cdrom partition
mount -a

#initialize the Nandroid menu
#=======================================
export NAND_MENU_FILE="/menu/nand.menu"
export INIT_MENU_FILE="/menu/init.menu"

echo "Nandroid" > "$NAND_MENU_FILE"
echo "Go Back:menu:.." >> "$NAND_MENU_FILE"
echo "Backup:scripted_menu:nandroid_backup.menu:menu_nandroid_backup.sh" >> "$NAND_MENU_FILE"
echo "Restore:scripted_menu:nandroid_restore.menu:menu_nandroid_restore.sh" >> "$NAND_MENU_FILE"
echo "Delete:scripted_menu:nandroid_delete.menu:menu_nandroid_delete.sh" >> "$NAND_MENU_FILE"

sed -i '/Enable Nandroid/c\Nandroid:menu:nand.menu' $INIT_MENU_FILE

echo "Done."

#Restart Open Recovery
#==============================================================================
#just call post_switch.sh
post_switch.sh	
