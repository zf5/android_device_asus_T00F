#!/system/bin/sh

# Device Name Fix for ASUS Zenfone 5/6
# Author: Douglas Gadêlha <douglas@gadeco.com.br>
# Version: 20160626
#
# The MIT License (MIT)
#
# Copyright (c) 2016 Douglas Gadêlha. All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# NOTE: This feature is ENABLED by DEFAULT.
# NOTE: By disabling this feature, sensors may not work.

if [ -f "/data/dgadelha/dnfix" ]; then
	ENABLED=$(cat "/data/dgadelha/dnfix")

	if [ "$ENABLED" == "0" ]; then
		log -p i -t dnfix "Device Name Fix is DISABLED"
		log -p i -t dnfix "To enable Device Name Fix please run the following command:"
		log -p i -t dnfix "echo \"1\" > /data/dgadelha/dnfix"
		log -p i -t dnfix "Exiting"
		exit
	fi
fi

PROJECT_ID=$(cat /sys/module/intel_mid_sfi/parameters/project_id)

if [ -n "$PROJECT_ID" ]; then
	if [ "$PROJECT_ID" -ge 0 -a "$PROJECT_ID" -le 4 ]; then
		log -p i -t dnfix "Detected Device: ASUS Zenfone 5"

		VERSION=$(getprop dgadelha.dnfix)

		if [ "$VERSION" == "20160626" ]; then
			log -p i -t dnfix "Device Name Fix is up-to-date."
		else
			log -p i -t dnfix "Device Name Fix is outdated, updating..."

			log -p i -t dnfix "Re-mounting System as Read-Write..."
			mount -o remount,rw /system

			log -p i -t dnfix "Updating build.prop..."
			printf "\ndgadelha.dnfix=20160626\n" >> /system/build.prop

			log -p i -t dnfix "Updating Sensors Service..."
			mv /system/bin/akmd09911 /system/bin/a500cg_akmd09911
			ln -s /system/lib/a500cg_akmd09911 /system/bin/akmd09911

			log -p i -t dnfix "Re-inforcing permissions of modified files..."
			chmod 0755 /system/bin/akmd09911
			chmod 0755 /system/bin/a500cg_akmd09911
			chmod 0755 /system/bin/a600cg_akmd09911

			log -p i -t dnfix "Re-mounting System as Read-Only..."
			mount -o remount,ro /system

			log -p i -t dnfix "Device Name Fix installed."
		fi

		log -p i -t dnfix "Starting AKMD sensor service..."
		start akmd_a500cg

		log -p i -t dnfix "Finished. Exiting"
		exit
	elif [ "$PROJECT_ID" -eq 5 -o "$PROJECT_ID" -eq 7 ]; then
		log -p i -t dnfix "Detected Device: ASUS Zenfone 6"

		VERSION=$(getprop dgadelha.dnfix)

		if [ "$VERSION" == "20160626" ]; then
			log -p i -t dnfix "Device Name Fix is up-to-date."
		else
			log -p i -t dnfix "Device Name Fix is outdated, updating..."

			log -p i -t dnfix "Re-mounting System as Read-Write..."
			mount -o remount,rw /system

			UPDATED_05281=$(getprop dgadelha.dnfix.updated.201605281)

			if [ "$UPDATED_05281" == "true" ]; then
				# user flashed a kernel in a dirty install
				log -p i -t dnfix "Updating build.prop..."
				printf "\ndgadelha.dnfix=20160626\n" >> /system/build.prop

				log -p i -t dnfix "Updating Sensors Service..."
				mv /system/bin/akmd09911 /system/bin/a500cg_akmd09911
				ln -s /system/lib/a600cg_akmd09911 /system/bin/akmd09911

				log -p i -t dnfix "Re-inforcing permissions of modified files..."
				chmod 0755 /system/bin/akmd09911
				chmod 0755 /system/bin/a500cg_akmd09911
				chmod 0755 /system/bin/a600cg_akmd09911
			else
				log -p i -t dnfix "Updating build.prop..."
				sed -i 's/T00F/T00G/g' /system/build.prop
				printf "\ndgadelha.dnfix=20160626\n" >> /system/build.prop

				log -p i -t dnfix "Updating Sensors Library..."
				rm /system/lib/hw/sensors.redhookbay.so
				ln -s /system/lib/hw/a600cg.sensors.redhookbay.so /system/lib/hw/sensors.redhookbay.so

				log -p i -t dnfix "Updating Sensors Service..."
				mv /system/bin/akmd09911 /system/bin/a500cg_akmd09911
				ln -s /system/lib/a600cg_akmd09911 /system/bin/akmd09911

				log -p i -t dnfix "Updating Camera DIT Libraries..."
				rm /system/lib/libxditk_DIT_Manager.so
				ln -s /system/lib/ditlib_a600cg/libxditk_DIT_Manager.so /system/lib/libxditk_DIT_Manager.so
				rm /system/lib/libxditk_DIT_CloverTrailPlus.so
				ln -s /system/lib/ditlib_a600cg/libxditk_DIT_CloverTrailPlus.so /system/lib/libxditk_DIT_CloverTrailPlus.so

				log -p i -t dnfix "Re-inforcing permissions of modified files..."
				chmod 0755 /system/bin/akmd09911
				chmod 0755 /system/bin/a500cg_akmd09911
				chmod 0755 /system/bin/a600cg_akmd09911
				chmod 0644 /system/lib/hw/a500cg.sensors.redhookbay.so
				chmod 0644 /system/lib/hw/a600cg.sensors.redhookbay.so
				chmod 0644 /system/lib/hw/sensors.redhookbay.so
				chmod 0644 /system/lib/ditlib_a500cg/libxditk_DIT_Manager.so
				chmod 0644 /system/lib/ditlib_a500cg/libxditk_DIT_CloverTrailPlus.so
				chmod 0644 /system/lib/ditlib_a600cg/libxditk_DIT_Manager.so
				chmod 0644 /system/lib/ditlib_a600cg/libxditk_DIT_CloverTrailPlus.so
				chmod 0644 /system/lib/libxditk_DIT_Manager.so
				chmod 0644 /system/lib/libxditk_DIT_CloverTrailPlus.so
				chmod 0644 /system/build.prop
			fi

			log -p i -t dnfix "Re-mounting System as Read-Only..."
			mount -o remount,ro /system

			log -p i -t dnfix "Device Name Fix installed. You may need to reboot to apply the changes"
		fi

		log -p i -t dnfix "Starting AKMD sensor service..."
		start akmd_a600cg

		log -p i -t dnfix "Finished. Exiting"
		exit
	else
		log -p i -t dnfix "Unknown device. Exiting"
		exit
	fi
fi
