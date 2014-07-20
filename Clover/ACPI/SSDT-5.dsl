/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20131218-64 [Jan  8 2014]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of iASLtJytU5.aml, Thu Jul 17 16:59:20 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000803 (2051)
 *     Revision         0x02
 *     Checksum         0xB0
 *     OEM ID           "ASUS "
 *     OEM Table ID     "SsdtIon1"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20131218 (538120728)
 */
DefinitionBlock ("SSDT-5.aml", "SSDT", 2, "ASUS ", "SsdtIon1", 0x00001000)
{
    External (OBTG, MethodObj)
    External (OLBG, MethodObj)
    External (OTPG, MethodObj)
    External (OBTS, MethodObj)
    External (OLBS, MethodObj)
    External (OWLS, MethodObj)
    External (OTPS, MethodObj)
    External (\_SB_.PCI0, DeviceObj)
    External (\_SB_.PCI0.HDEF, DeviceObj)
    External (\_SB_.PCI0.IMAP, DeviceObj)
    External (\_SB_.PCI0.IXVE, DeviceObj)
    External (\_SB_.PCI0.SATA, DeviceObj)
    External (\_SB_.PCI0.SBUS, DeviceObj)
    External (\_SB_.PCI0.LPCB, DeviceObj)
    External (\_SB_.PCI0.IXVE.IGPU, DeviceObj)
    External (\_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (\_SB_.PCI0.LPCB.PS2M, DeviceObj)
    External (\_SB_.PCI0.RP06.GIGE, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (MCHC)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x02)
                    {
                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0xDE, 0x10, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

        Device (MCH2) // nVidia Corporation MCP79 Memory Controller
        {
            Name (_ADR, One)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x02)
                    {
                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0xDE, 0x10, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

        Device (P4MI) // nVidia Corporation MCP79 Memory Controller
        {
            Name (_ADR, 0x00030003)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x02)
                    {
                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0xDE, 0x10, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

        Device (NVPM) // nVidia Corporation MCP79 Co-processor
        {
            Name (_ADR, 0x00030005)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x02)
                    {
                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                            0xDE, 0x10, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }

        Scope (\_SB.PCI0.LPCB) // nVidia Corporation MCP79 LPC Bridge
        {
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    Store (Package (0x02)
                        {
                            "subsystem-vendor-id", 
                            Buffer (0x04)
                            {
                                 0xDE, 0x10, 0x00, 0x00
                            }
                        }, Local0)
                    DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                    Return (Local0)
                }
        }

        Scope (\_SB.PCI0.IXVE.IGPU)
        {

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x2A)
                    {
                        "hda-gfx", 
                        Buffer (0x0A)
                        {
                            "onboard-1"
                        }, 
                        
                        // Properties required to treat the LVDS panel as backlight-control capable
                        // In conjunction with ACPIBacklight brightness control requires PNLF device to work 
                        "AAPL,HasPanel", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00
                        }, 

                        "AAPL,Haslid", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00
                        }, 

                        "AAPL,backlight-control", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00
                        }, 

                        "@0,backlight-control", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00
                        }, 
                        //

                        "@0,compatible", 
                        Buffer (0x0B)
                        {
                            "NVDA,NVMac"
                        }, 

                        "@0,device_type", 
                        Buffer (0x08)
                        {
                            "display"
                        },
                         
                        // LVDS panel is always the primary boot display
                        "@0,AAPL,boot-display", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00
                        }, 

                        "@0,name", 
                        Buffer (0x0F)
                        {
                            "NVDA,Display-A"
                        }, 

                        "@0,built-in", 
                        Buffer (One)
                        {
                             0x01
                        }, 

                        "@1,compatible", 
                        Buffer (0x0B)
                        {
                            "NVDA,NVMac"
                        }, 

                        "@1,device_type", 
                        Buffer (0x08)
                        {
                            "display"
                        }, 

                        "@1,name", 
                        Buffer (0x0F)
                        {
                            "NVDA,Display-B"
                        }, 

                        "@1,can-hot-plug", 
                        Buffer (One)
                        {
                             0x01
                        }, 

                        "@1,connector-type", 
                        Buffer (0x04)
                        {
                             0x00, 0x08, 0x00, 0x00
                        }, 

                        "NVCAP", 
                        Buffer (0x14)
                        {
                            /* 0000 */   0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
                            /* 0008 */   0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A,
                            /* 0010 */   0x00, 0x00, 0x00, 0x00
                        }, 

                        "VRAM,totalsize", 
                        Buffer (0x04)
                        {
                             0x00, 0x00, 0x00, 0x10
                        }, 

                        "device_type", 
                        Buffer (0x0C)
                        {
                            "NVDA,Parent"
                        }, 

                        "model", 
                        Buffer (0x15)
                        {
                            "NVIDIA GeForce 9400M"
                        }, 

                        "rom-revision", 
                        Buffer (0x04)
                        {
                             0x33, 0x34, 0x36, 0x32
                        }, 

                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0x6B, 0x10, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
        
        Scope (\_SB.PCI0.HDEF)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x10)
                    {
                        // Below two properties have to be defined to prevent sound assertions in 10.8.5+
                        "MaximumBootBeepVolume", 
                        Buffer (One)
                        {
                             0x5D
                        }, 

                        "MaximumBootBeepVolumeAlt", 
                        Buffer (One)
                        {
                             0x00
                        }, 

                        "subsystem-id", 
                        Buffer (0x04)
                        {
                             0x79, 0xCB, 0x00, 0x00
                        }, 

                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0xDE, 0x10, 0x00, 0x00
                        }, 

                        "layout-id", 
                        Buffer (0x04)
                        {
                             0x01, 0x00, 0x00, 0x00
                        }, 

                        "PinConfigurations", 
                        Buffer (Zero) {}, 
                        
                        // Defining HDMI audio capability is crucial to eliminate sound assertion,
                        // but because av-signal-type used is 02 (and not 08) the aidop stream is not being passed through
                        "hda-gfx", 
                        Buffer (0x0A)
                        {
                            "onboard-1"
                        }, 

                        "PlatformFamily", 
                        Buffer (One)
                        {
                             0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
        
        Scope (\_SB.PCI0.LPCB.PS2K)
        {
            // Expose PS2K device to RehabMan's VoodooPS2 driver, 
            // OEM info will also be used by CodecCommander when bootloader is Chameleon-based
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x04)
                    {
                        "RM,oem-id", 
                        "ASUS", 
                        "RM,oem-table-id", 
                        "1201N"
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
            
            // Variable used by VoodooPS2 to store kHIDFKeyMode
            Name (MODE, One)
            Method (MDTG, 1, NotSerialized)
            {
                // Zero is stored for Special Mode
                // One is stored for Standard Mode
                Store (Arg0, MODE)
            }

            // Method that uses original DSDT code used by WMI 
            // to cause RF Kill event. Based on current state it will invert the new state.
            Method (RFKL, 0, NotSerialized)
            {
                XOr (OBTG (), One, Local0)
                // Bluetooth will be temporary disconnected from EHCI bus, 
                // but Wi-Fi will loose one of the Data lanes.
                OBTS (Local0)
                OWLS (Local0)
            }

            // Method that uses original DSDT code used by WMI
            // to cause LCD backlight toggle. Based on current state it will invert the new state.
            Method (LBTG, 0, NotSerialized)
            {
                Sleep (0x64)
                XOr (OLBG (), One, Local0)
                OLBS (Local0)
            }

            // Debugging method for touchpad LED toggling
            Method (TPTG, 0, NotSerialized)
            {
                XOr (OTPG (), One, Local0)
                OTPS (Local0)
            }

            // Method called in special key mode when F2 is pressed
            // to indicate that Wi-Fi and BT need to be toggled
            Method (RKA0, 1, NotSerialized)
            {
                If (Arg0)
                {
                    RFKL () // Call RF Kill Toggle
                }
            }

            // Method called in special key mode when F7 is pressed
            // to indicate that LCD backlight needs to be toggled  
            Method (RKA1, 1, NotSerialized)
            {
                If (Arg0)
                {
                    LBTG () // Call LCD Backlight Toggle 
                }
            }

            // Method called in special key mode when F9 is pressed
            // to indicate that touchpad needs to be toggled
            Method (RKA2, 1, NotSerialized)
            {
                If (Arg0)
                {
                    Notify (PS2K, 0x0237)
                    Notify (PS2K, 0x02B7)
                }
            }
        }
        
        Scope (\_SB.PCI0.LPCB.PS2M)
        {
            // ACPI Touchpad Disable Notification
            Method (TPDN, 1, NotSerialized)
            {
                // Get current touchpad state from NVS register and invert for comparison
                XOr (OTPG (), One, Local0)
                // If state passed from VoodooPS2 is different then update stored state
                If (LAnd (LNotEqual (Arg0, Local0), LNotEqual (Arg0, 0xFFFF)))
                {
                    // BIOS treats 0 as disabled and 1 as enabled
                    // VoodooPS2 passes 1 to the method to indicated disabled, need to invert
                    XOr (Arg0, One, Local1)
                    // Update touchpad state in NVS register
                    OTPS (Local1)
                }
                // Reset LED if active when VoodooPS2Daemon is telling us shutdown/restart is issued
                If (LAnd (LEqual (Local0, One), LEqual (Arg0, 0xFFFF)))
                {
                    OTPS (One)
                }
            }
        }
        
        Scope (\_SB.PCI0.SBUS) // nVidia Corporation MCP79 SMBus
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x04)
                    {
                        "subsystem-id", 
                        Buffer (0x04)
                        {
                             0x79, 0xCB, 0x00, 0x00
                        }, 

                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0xDE, 0x10, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }

            Device (BUS0)
            {
                Name (_CID, "smbus")  // _CID: Compatible ID
                Name (_ADR, Zero)  // _ADR: Address
            }

            Device (BUS1)
            {
                Name (_CID, "smbus")  // _CID: Compatible ID
                Name (_ADR, One)  // _ADR: Address
            }
        }

        Scope (\_SB.PCI0.RP06.GIGE) // Qualcomm Atheros AR8132/L1c Fast Ethernet
        {
            // Threat Ethernet controller as being buil-in to allow connection to AppStore and other services
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x04)
                    {
                        "built-in", 
                        Buffer (One)
                        {
                            0x00
                        }, 

                        "device_type", 
                        Buffer (0x09)
                        {
                            "ethernet"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
        
        Scope (\_SB.PCI0.SATA) // nVidia Corporation MCP79 SATA Controller
        {
            // SATA has to report one of compatible MCP79 AHCI controller IDs, 
            // otherwise AHCI won't initialize with IDE in BIOS and ION-64.efi driver
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x04)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0xB9, 0x0A, 0x00, 0x00
                        }, 

                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0xDE, 0x10, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)  
            }
        }

        Scope (\_SB.PCI0.IMAP) // nVidia Corporation MCP79 Memory Controller
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x02)
                    {
                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0xDE, 0x10, 0x00, 0x00
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
    }

    Method (DTGP, 5, NotSerialized)
    {
        If (LEqual (Arg0, Buffer (0x10)
                {
                    /* 0000 */   0xC6, 0xB7, 0xB5, 0xA0, 0x18, 0x13, 0x1C, 0x44,
                    /* 0008 */   0xB0, 0xC9, 0xFE, 0x69, 0x5E, 0xAF, 0x94, 0x9B
                }))
        {
            If (LEqual (Arg1, One))
            {
                If (LEqual (Arg2, Zero))
                {
                    Store (Buffer (One)
                        {
                             0x03
                        }, Arg4)
                    Return (One)
                }

                If (LEqual (Arg2, One))
                {
                    Return (One)
                }
            }
        }

        Store (Buffer (One)
            {
                 0x00
            }, Arg4)
        Return (Zero)
    }
}

