# Boot animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/coral/aosp_flame.mk)

-include device/google/coral/flame/device-lineage.mk

## Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_flame
PRODUCT_MODEL := Pixel 4
PRODUCT_BRAND := google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flame \
    PRIVATE_BUILD_DESC="flame-user 11 RQ3A.210805.001.A1 7474174 release-keys"

BUILD_FINGERPRINT := google/flame/flame:11/RQ3A.210805.001.A1/7474174:user/release-keys

$(call inherit-product, vendor/google/flame/flame-vendor.mk)
