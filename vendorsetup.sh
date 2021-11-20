# Considering logged in username as maintainer name.
export maintainer="$(whoami) (Generated by device tree.)"

export device="teos"

# Write a simple configuration file for AOSiP.
if [[ -d vendor/aosip/products ]]
then
    echo ""
    echo "Considering logged in username as maintainer, please review vendor/aosip/products/aosip_teos.mk once envsetup is done."
    echo "# Simple configuration file for ${device}" > vendor/aosip/products/aosip_${device}.mk
    echo "\$(call inherit-product, device/vestel/teos/aosp_${device}.mk)" >> vendor/aosip/products/aosip_${device}.mk
    echo "PRODUCT_BUILD_PROP_OVERRIDES := DEVICE_MAINTAINERS=\"${maintainer}\"" >> vendor/aosip/products/aosip_${device}.mk
    sed -i 's/aosp\/common.mk/aosip\/config\/common_full_phone.mk/' device/vestel/teos/aosp_teos.mk
    sed -i 's/aosp_teos/aosip_teos/' device/vestel/teos/aosp_teos.mk
    add_lunch_combo aosip_${device}-eng
    add_lunch_combo aosip_${device}-userdebug
    add_lunch_combo aosip_${device}-user
    echo ""
fi
