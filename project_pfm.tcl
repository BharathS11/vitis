# ----------------------------------------------------------------------------
#
#        ** **        **          **  ****      **  **********  ********** ®
#       **   **        **        **   ** **     **  **              **
#      **     **        **      **    **  **    **  **              **
#     **       **        **    **     **   **   **  *********       **
#    **         **        **  **      **    **  **  **              **
#   **           **        ****       **     ** **  **              **
#  **  .........  **        **        **      ****  **********      **
#     ...........
#                                     Reach Further™
#
# ----------------------------------------------------------------------------
# 
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
# 
#  For product information and support questions:
#     https://www.element14.com/community/community/designcenter/zedboardcommunity
# 
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2020 Avnet, Inc.
#                              All rights reserved.
# 
# ----------------------------------------------------------------------------


set platform_name [lindex $argv 0]
puts "platform name             : \"$platform_name\"" 
set xsa_folder [lindex $argv 1]
puts "xsa path                  : \"$xsa_folder\"" 
set pfm_folder [lindex $argv 2]
puts "platform_workspace        : \"$pfm_folder\"" 
set consolidated_folder [lindex $argv 3]
puts "consolidated folder       : \"$consolidated_folder\"" 
set consolidated_boot_folder [lindex $argv 4]
puts "consolidated boot folder  : \"$consolidated_boot_folder\"" 
set consolidated_image_folder [lindex $argv 5]
puts "consolidated image folder : \"$consolidated_image_folder\"" 
set root_folder [lindex $argv 6]
puts "root_folder folder        : \"$root_folder\"" 
set architecture [lindex $argv 7]
puts "architecture              : \"$architecture\"" 
set description [lindex $argv 8]
puts "description               : \"$description\"" 

platform -name $platform_name -desc $description -hw $root_folder/$xsa_folder/$platform_name.xsa -out $root_folder/$pfm_folder

domain -name PetaLinux -proc $architecture -os linux -image $consolidated_folder/image
domain config -boot $root_folder/$consolidated_folder/boot
domain config -bif $root_folder/$consolidated_folder/linux.bif
domain -runtime opencl
#domain -pmuqemu-args $consolidated_folder/src/qemu/lnx/pmu_args.txt
#domain -qemu-args $consolidated_folder/src/qemu/lnx/qemu_args.txt
#domain -qemu-data $consolidated_folder/src/boot
domain -sysroot $root_folder/$consolidated_folder/sysroot

platform -generate
