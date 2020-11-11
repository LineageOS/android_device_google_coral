/****************************************************************************
 ****************************************************************************
 ***
 ***   This header was automatically generated from a Linux kernel header
 ***   of the same name, to make information necessary for userspace to
 ***   call into the kernel available to libc.  It contains only constants,
 ***   structures, and macros generated from the original header, and thus,
 ***   contains no copyrightable information.
 ***
 ***   To edit the content of this header, modify the corresponding
 ***   source file (e.g. under external/kernel-headers/original/) then
 ***   run bionic/libc/kernel/tools/update_all.py
 ***
 ***   Any manual change here will be lost the next time this script will
 ***   be run. You've been warned!
 ***
 ****************************************************************************
 ****************************************************************************/
#ifndef __MSM_DRM_H__
#define __MSM_DRM_H__
#include "drm.h"
#include "sde_drm.h"
#ifdef __cplusplus
extern "C" {
#endif
#define MSM_PIPE_NONE 0x00
#define MSM_PIPE_2D0 0x01
#define MSM_PIPE_2D1 0x02
#define MSM_PIPE_3D0 0x10
#define MSM_PIPE_ID_MASK 0xffff
#define MSM_PIPE_ID(x) ((x) & MSM_PIPE_ID_MASK)
#define MSM_PIPE_FLAGS(x) ((x) & ~MSM_PIPE_ID_MASK)
struct drm_msm_timespec {
  __s64 tv_sec;
  __s64 tv_nsec;
};
#define HDR_PRIMARIES_COUNT 3
#define HDR_EOTF_SDR_LUM_RANGE 0x0
#define HDR_EOTF_HDR_LUM_RANGE 0x1
#define HDR_EOTF_SMTPE_ST2084 0x2
#define HDR_EOTF_HLG 0x3
#define DRM_MSM_EXT_HDR_METADATA
struct drm_msm_ext_hdr_metadata {
  __u32 hdr_state;
  __u32 eotf;
  __u32 hdr_supported;
  __u32 display_primaries_x[HDR_PRIMARIES_COUNT];
  __u32 display_primaries_y[HDR_PRIMARIES_COUNT];
  __u32 white_point_x;
  __u32 white_point_y;
  __u32 max_luminance;
  __u32 min_luminance;
  __u32 max_content_light_level;
  __u32 max_average_light_level;
};
#define DRM_MSM_EXT_HDR_PROPERTIES
struct drm_msm_ext_hdr_properties {
  __u8 hdr_metadata_type_one;
  __u32 hdr_supported;
  __u32 hdr_eotf;
  __u32 hdr_max_luminance;
  __u32 hdr_avg_luminance;
  __u32 hdr_min_luminance;
};
#define MSM_PARAM_GPU_ID 0x01
#define MSM_PARAM_GMEM_SIZE 0x02
#define MSM_PARAM_CHIP_ID 0x03
#define MSM_PARAM_MAX_FREQ 0x04
#define MSM_PARAM_TIMESTAMP 0x05
#define MSM_PARAM_GMEM_BASE 0x06
struct drm_msm_param {
  __u32 pipe;
  __u32 param;
  __u64 value;
};
#define MSM_BO_SCANOUT 0x00000001
#define MSM_BO_GPU_READONLY 0x00000002
#define MSM_BO_CACHE_MASK 0x000f0000
#define MSM_BO_CACHED 0x00010000
#define MSM_BO_WC 0x00020000
#define MSM_BO_UNCACHED 0x00040000
#define MSM_BO_FLAGS (MSM_BO_SCANOUT | MSM_BO_GPU_READONLY | MSM_BO_CACHED | MSM_BO_WC | MSM_BO_UNCACHED)
struct drm_msm_gem_new {
  __u64 size;
  __u32 flags;
  __u32 handle;
};
#define MSM_INFO_IOVA 0x01
#define MSM_INFO_FLAGS (MSM_INFO_IOVA)
struct drm_msm_gem_info {
  __u32 handle;
  __u32 flags;
  __u64 offset;
};
#define MSM_PREP_READ 0x01
#define MSM_PREP_WRITE 0x02
#define MSM_PREP_NOSYNC 0x04
#define MSM_PREP_FLAGS (MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_NOSYNC)
struct drm_msm_gem_cpu_prep {
  __u32 handle;
  __u32 op;
  struct drm_msm_timespec timeout;
};
struct drm_msm_gem_cpu_fini {
  __u32 handle;
};
struct drm_msm_gem_submit_reloc {
  __u32 submit_offset;
#ifdef __cplusplus
  __u32 or_val;
#else
  __u32 or;
#endif
  __s32 shift;
  __u32 reloc_idx;
  __u64 reloc_offset;
};
#define MSM_SUBMIT_CMD_BUF 0x0001
#define MSM_SUBMIT_CMD_IB_TARGET_BUF 0x0002
#define MSM_SUBMIT_CMD_CTX_RESTORE_BUF 0x0003
struct drm_msm_gem_submit_cmd {
  __u32 type;
  __u32 submit_idx;
  __u32 submit_offset;
  __u32 size;
  __u32 pad;
  __u32 nr_relocs;
  __u64 relocs;
};
#define MSM_SUBMIT_BO_READ 0x0001
#define MSM_SUBMIT_BO_WRITE 0x0002
#define MSM_SUBMIT_BO_FLAGS (MSM_SUBMIT_BO_READ | MSM_SUBMIT_BO_WRITE)
struct drm_msm_gem_submit_bo {
  __u32 flags;
  __u32 handle;
  __u64 presumed;
};
#define MSM_SUBMIT_NO_IMPLICIT 0x80000000
#define MSM_SUBMIT_FENCE_FD_IN 0x40000000
#define MSM_SUBMIT_FENCE_FD_OUT 0x20000000
#define MSM_SUBMIT_FLAGS (MSM_SUBMIT_NO_IMPLICIT | MSM_SUBMIT_FENCE_FD_IN | MSM_SUBMIT_FENCE_FD_OUT | 0)
struct drm_msm_gem_submit {
  __u32 flags;
  __u32 fence;
  __u32 nr_bos;
  __u32 nr_cmds;
  __u64 bos;
  __u64 cmds;
  __s32 fence_fd;
};
struct drm_msm_wait_fence {
  __u32 fence;
  __u32 pad;
  struct drm_msm_timespec timeout;
};
#define MSM_MADV_WILLNEED 0
#define MSM_MADV_DONTNEED 1
#define __MSM_MADV_PURGED 2
struct drm_msm_gem_madvise {
  __u32 handle;
  __u32 madv;
  __u32 retained;
};
#define DISPLAY_PRIMARIES_WX 0
#define DISPLAY_PRIMARIES_WY 1
#define DISPLAY_PRIMARIES_RX 2
#define DISPLAY_PRIMARIES_RY 3
#define DISPLAY_PRIMARIES_GX 4
#define DISPLAY_PRIMARIES_GY 5
#define DISPLAY_PRIMARIES_BX 6
#define DISPLAY_PRIMARIES_BY 7
#define DISPLAY_PRIMARIES_MAX 8
struct drm_panel_hdr_properties {
  __u32 hdr_enabled;
  __u32 display_primaries[DISPLAY_PRIMARIES_MAX];
  __u32 peak_brightness;
  __u32 blackness_level;
};
struct drm_msm_event_req {
  __u32 object_id;
  __u32 object_type;
  __u32 event;
  __u64 client_context;
  __u32 index;
};
struct drm_msm_event_resp {
  struct drm_event base;
  struct drm_msm_event_req info;
  __u8 data[];
};
struct drm_msm_power_ctrl {
  __u32 enable;
  __u32 flags;
};
#define DRM_MSM_GET_PARAM 0x00
#define DRM_MSM_GEM_NEW 0x02
#define DRM_MSM_GEM_INFO 0x03
#define DRM_MSM_GEM_CPU_PREP 0x04
#define DRM_MSM_GEM_CPU_FINI 0x05
#define DRM_MSM_GEM_SUBMIT 0x06
#define DRM_MSM_WAIT_FENCE 0x07
#define DRM_MSM_GEM_MADVISE 0x08
#define DRM_SDE_WB_CONFIG 0x40
#define DRM_MSM_REGISTER_EVENT 0x41
#define DRM_MSM_DEREGISTER_EVENT 0x42
#define DRM_MSM_RMFB2 0x43
#define DRM_MSM_POWER_CTRL 0x44
#define DRM_EVENT_HISTOGRAM 0x80000000
#define DRM_EVENT_AD_BACKLIGHT 0x80000001
#define DRM_EVENT_CRTC_POWER 0x80000002
#define DRM_EVENT_SYS_BACKLIGHT 0x80000003
#define DRM_EVENT_SDE_POWER 0x80000004
#define DRM_EVENT_IDLE_NOTIFY 0x80000005
#define DRM_EVENT_PANEL_DEAD 0x80000006
#define DRM_EVENT_SDE_HW_RECOVERY 0X80000007
#define DRM_IOCTL_MSM_GET_PARAM DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
#define DRM_IOCTL_MSM_GEM_NEW DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
#define DRM_IOCTL_MSM_GEM_INFO DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_INFO, struct drm_msm_gem_info)
#define DRM_IOCTL_MSM_GEM_CPU_PREP DRM_IOW(DRM_COMMAND_BASE + DRM_MSM_GEM_CPU_PREP, struct drm_msm_gem_cpu_prep)
#define DRM_IOCTL_MSM_GEM_CPU_FINI DRM_IOW(DRM_COMMAND_BASE + DRM_MSM_GEM_CPU_FINI, struct drm_msm_gem_cpu_fini)
#define DRM_IOCTL_MSM_GEM_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_SUBMIT, struct drm_msm_gem_submit)
#define DRM_IOCTL_MSM_WAIT_FENCE DRM_IOW(DRM_COMMAND_BASE + DRM_MSM_WAIT_FENCE, struct drm_msm_wait_fence)
#define DRM_IOCTL_MSM_GEM_MADVISE DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_MADVISE, struct drm_msm_gem_madvise)
#define DRM_IOCTL_SDE_WB_CONFIG DRM_IOW((DRM_COMMAND_BASE + DRM_SDE_WB_CONFIG), struct sde_drm_wb_cfg)
#define DRM_IOCTL_MSM_REGISTER_EVENT DRM_IOW((DRM_COMMAND_BASE + DRM_MSM_REGISTER_EVENT), struct drm_msm_event_req)
#define DRM_IOCTL_MSM_DEREGISTER_EVENT DRM_IOW((DRM_COMMAND_BASE + DRM_MSM_DEREGISTER_EVENT), struct drm_msm_event_req)
#define DRM_IOCTL_MSM_RMFB2 DRM_IOW((DRM_COMMAND_BASE + DRM_MSM_RMFB2), unsigned int)
#define DRM_IOCTL_MSM_POWER_CTRL DRM_IOW((DRM_COMMAND_BASE + DRM_MSM_POWER_CTRL), struct drm_msm_power_ctrl)
#ifdef __cplusplus
}
#endif
#endif
