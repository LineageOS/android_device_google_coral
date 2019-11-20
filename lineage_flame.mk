# Boot animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/coral/aosp_flame.mk)

-include device/google/coral/device-lineage.mk

## Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_DEVICE := flame
PRODUCT_MODEL := Pixel 4
PRODUCT_NAME := lineage_flame
TARGET_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flame \
    PRIVATE_BUILD_DESC="flame-user 10 QQ3A.200805.001 6578210 release-keys" \

BUILD_FINGERPRINT := google/flame/flame:10/QQ3A.200805.001/6578210:user/release-keys

# Include flame before coral to use flame versions of blobs if they exist
$(call inherit-product-if-exists, vendor/google/flame/flame-vendor.mk)
$(call inherit-product-if-exists, vendor/google/coral/coral-vendor.mk)
