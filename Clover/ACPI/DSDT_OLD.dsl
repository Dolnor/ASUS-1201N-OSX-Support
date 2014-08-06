/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20131218-64 [Jan  8 2014]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of iASLV0YcHz.aml, Thu Jul 17 16:58:17 2014
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00008025 (32805)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xA3
 *     OEM ID           "A1469"
 *     OEM Table ID     "A1469001"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20131218 (538120728)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "A1469", "A1469001", 0x00000001)
{
    External (_SB_.PCI0.LPCB.PS2K.MODE, IntObj)
    External (_SB_.PCI0.LPCB.PS2K.LBTG, MethodObj)     
    External (_SB_.PCI0.LPCB.PS2K.RFKL, MethodObj)

    Scope (_PR)
    {
        Processor (CPU0, 0x01, 0x00004010, 0x06) {}
        Processor (CPU1, 0x02, 0x00004010, 0x06) {}
        Processor (CPU2, 0x03, 0x00004010, 0x06) {}
        Processor (CPU3, 0x04, 0x00004010, 0x06) {}
    }

    Name (DP80, 0x80)
    Name (DP90, 0x90)
    Name (SSMI, 0x442E)
    Name (MRN0, 0xFC060000)
    Name (MRN1, 0xFC068000)
    Name (AMWV, 0x07)
    Name (APIC, One)
    Name (SHPB, 0xFED00000)
    Name (SHPL, 0x1000)
    Name (PMBS, 0x4000)
    Name (PMLN, 0x0100)
    Name (SCBS, 0x4400)
    Name (NVSI, 0x4400)
    Name (SCLN, 0x0100)
    Name (ACBS, 0x4800)
    Name (NVAI, 0x4800)
    Name (ACLN, 0x0100)
    Name (MTAB, 0x4F00)
    Name (MTAL, 0x0100)
    Name (ACA4, 0x40A4)
    Name (SCIO, 0x4400)
    Name (GIOB, 0x44C0)
    Name (SCTL, 0x4090)
    Name (SNAS, One)
    Name (SNAM, 0xFEFE1000)
    Name (SNAL, 0x1000)
    Name (SPAS, One)
    Name (SPAM, 0xFEFE2000)
    Name (SPAL, 0x2000)
    Name (MUAE, Zero)
    Name (SLOW, Zero)
    Name (PCIB, 0xFC000000)
    Name (PCIL, 0x02000000)
    Name (PEHP, One)
    Name (SHPC, Zero)
    Name (PEER, One)
    Name (PECS, One)
    Name (WKTP, One)
    Name (NSLB, 0xC0000000)
    Name (PEPM, Zero)
    OperationRegion (BIOS, SystemMemory, 0x6FF9E064, 0xFF)
    Field (BIOS, ByteAcc, NoLock, Preserve)
    {
        SS1,    1, 
        SS2,    1, 
        SS3,    1, 
        SS4,    1, 
        Offset (0x01), 
        IOST,   16, 
        TOPM,   32, 
        ROMS,   32, 
        MG1B,   32, 
        MG1L,   32, 
        MG2B,   32, 
        MG2L,   32, 
        Offset (0x1C), 
        DMAX,   8, 
        HPTA,   32, 
        CPB0,   32, 
        CPB1,   32, 
        CPB2,   32, 
        CPB3,   32, 
        ASSB,   8, 
        AOTB,   8, 
        AAXB,   32, 
        SMIF,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        MPEN,   8, 
        TPMF,   8, 
        MG3B,   32, 
        MG3L,   32, 
        MH1B,   32, 
        MH1L,   32, 
        OSTP,   8, 
        AWYE,   8, 
        HPSP,   8, 
        HBDP,   8, 
        TVCC,   8, 
        TVFC,   8, 
        PPOL,   8, 
        PFLG,   8
    }

    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        If (Arg0)
        {
            Store (0xAA, DBG8)
        }
        Else
        {
            Store (0xAC, DBG8)
        }

        Store (Arg0, PICM)
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        If (LNotEqual (OSVR, Ones))
        {
            Return (OSVR)
        }

        Name (TTT0, Zero)
        Store (OSYS (), TTT0)
        If (LEqual (TTT0, One))
        {
            Store (0x03, OSVR)
        }
        Else
        {
            If (LEqual (TTT0, 0x10))
            {
                Store (One, OSVR)
            }
            Else
            {
                If (LEqual (TTT0, 0x11))
                {
                    Store (0x02, OSVR)
                }
                Else
                {
                    If (LEqual (TTT0, 0x12))
                    {
                        Store (0x04, OSVR)
                    }
                    Else
                    {
                        If (LEqual (TTT0, 0x13))
                        {
                            Store (Zero, OSVR)
                        }
                        Else
                        {
                            If (LEqual (TTT0, 0x14))
                            {
                                Store (Zero, OSVR)
                            }
                            Else
                            {
                                If (LEqual (TTT0, 0x15))
                                {
                                    Store (Zero, OSVR)
                                }
                            }
                        }
                    }
                }
            }
        }

        Return (OSVR)
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, DP80, One)
    Field (DEB0, ByteAcc, NoLock, Preserve)
    {
        DBG8,   8
    }

    OperationRegion (DEB1, SystemIO, DP90, 0x02)
    Field (DEB1, WordAcc, NoLock, Preserve)
    {
        DBG9,   16
    }

    Method (OSYS, 0, NotSerialized)
    {
        Store (0x10, Local0)
        If (CondRefOf (_OSI, Local1))
        {
            If (_OSI ("Darwin"))
            {
                Store (0x15, Local0)
            }

            If (_OSI ("Windows 2000"))
            {
                Store (0x12, Local0)
            }

            If (_OSI ("Windows 2001"))
            {
                Store (0x13, Local0)
            }

            If (_OSI ("Windows 2001 SP1"))
            {
                Store (0x13, Local0)
            }

            If (_OSI ("Windows 2001 SP2"))
            {
                Store (0x13, Local0)
            }

            If (_OSI ("Windows 2001.1"))
            {
                Store (0x14, Local0)
            }

            If (_OSI ("Windows 2001.1 SP1"))
            {
                Store (0x14, Local0)
            }

            If (_OSI ("Windows 2006"))
            {
                Store (0x15, Local0)
            }
        }
        Else
        {
            If (MCTH (_OS, "Microsoft Windows NT"))
            {
                Store (0x12, Local0)
            }
            Else
            {
                If (MCTH (_OS, "Microsoft WindowsME: Millennium Edition"))
                {
                    Store (0x11, Local0)
                }
            }
        }

        Return (Local0)
    }

    Scope (_SB)
    {
        Name (PR00, Package (0x10)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LSMB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LPMU, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                LMAC, 
                Zero
            }, 

            Package (0x04)
            {
                0x000BFFFF, 
                Zero, 
                LSA0, 
                Zero
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                Zero, 
                LAZA, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                Zero, 
                LRP0, 
                Zero
            }, 

            Package (0x04)
            {
                0x000EFFFF, 
                Zero, 
                LRP2, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                LRP3, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LRP4, 
                Zero
            }, 

            Package (0x04)
            {
                0x0017FFFF, 
                Zero, 
                LRP5, 
                Zero
            }, 

            Package (0x04)
            {
                0x0018FFFF, 
                Zero, 
                LRP6, 
                Zero
            }, 

            Package (0x04)
            {
                0x000DFFFF, 
                Zero, 
                LRP1, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LUB0, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LUB2, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                UB11, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                UB12, 
                Zero
            }
        })
        Name (AR00, Package (0x10)
        {
            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                LSMB, 
                Zero
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                One, 
                LPMU, 
                Zero
            }, 

            Package (0x04)
            {
                0x000AFFFF, 
                Zero, 
                LMAC, 
                Zero
            }, 

            Package (0x04)
            {
                0x000BFFFF, 
                Zero, 
                LSA0, 
                Zero
            }, 

            Package (0x04)
            {
                0x0008FFFF, 
                Zero, 
                LAZA, 
                Zero
            }, 

            Package (0x04)
            {
                0x000CFFFF, 
                Zero, 
                LRP0, 
                Zero
            }, 

            Package (0x04)
            {
                0x000EFFFF, 
                Zero, 
                LRP2, 
                Zero
            }, 

            Package (0x04)
            {
                0x0015FFFF, 
                Zero, 
                LRP3, 
                Zero
            }, 

            Package (0x04)
            {
                0x0016FFFF, 
                Zero, 
                LRP4, 
                Zero
            }, 

            Package (0x04)
            {
                0x0017FFFF, 
                Zero, 
                LRP5, 
                Zero
            }, 

            Package (0x04)
            {
                0x0018FFFF, 
                Zero, 
                LRP6, 
                Zero
            }, 

            Package (0x04)
            {
                0x000DFFFF, 
                Zero, 
                LRP1, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                LUB0, 
                Zero
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                One, 
                LUB2, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                UB11, 
                Zero
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                UB12, 
                Zero
            }
        })
        Name (PR02, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                SGRU, 
                Zero
            }
        })
        Name (AR02, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                SGRU, 
                Zero
            }
        })
        Name (PR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN0A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN0B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN0C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN0D, 
                Zero
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN0A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN0B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN0C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN0D, 
                Zero
            }
        })
        Name (PR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN1A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN1B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN1C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN1D, 
                Zero
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN1A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN1B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN1C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN1D, 
                Zero
            }
        })
        Name (PR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN2A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN2B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN2C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN2D, 
                Zero
            }
        })
        Name (AR05, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN2A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN2B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN2C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN2D, 
                Zero
            }
        })
        Name (PR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN3A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN3B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN3C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN3D, 
                Zero
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN3A, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                LN3B, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                LN3C, 
                Zero
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                LN3D, 
                Zero
            }
        })
        Name (PR07, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN4A, 
                Zero
            }
        })
        Name (AR07, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN4A, 
                Zero
            }
        })
        Name (PR08, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN5A, 
                Zero
            }
        })
        Name (AR08, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN5A, 
                Zero
            }
        })
        Name (PR09, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN6A, 
                Zero
            }
        })
        Name (AR09, Package (0x01)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                LN6A, 
                Zero
            }
        })
        Name (RSA0, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5}
        })
        Name (RSAC, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {7,9,10,11,14,15}
        })
        Alias (RSAC, RSB0)
        Alias (RSAC, RSB2)
        Alias (RSAC, RS11)
        Alias (RSAC, RS12)
        Alias (RSAC, RSMB)
        Alias (RSAC, RSMU)
        Alias (RSAC, RSZA)
        Alias (RSAC, RSRU)
        Alias (RSAC, RSTA)
        Alias (RSAC, PRSA)
        Alias (RSAC, PRSB)
        Alias (RSAC, PRSC)
        Alias (RSAC, PRSD)
        Alias (RSAC, RS0A)
        Alias (RSAC, RS0B)
        Alias (RSAC, RS0C)
        Alias (RSAC, RS0D)
        Alias (RSAC, RS1A)
        Alias (RSAC, RS1B)
        Alias (RSAC, RS1C)
        Alias (RSAC, RS1D)
        Alias (RSAC, RS2A)
        Alias (RSAC, RS2B)
        Alias (RSAC, RS2C)
        Alias (RSAC, RS2D)
        Alias (RSAC, RS3A)
        Alias (RSAC, RS3B)
        Alias (RSAC, RS3C)
        Alias (RSAC, RS3D)
        Alias (RSAC, RS4A)
        Alias (RSAC, RS4B)
        Alias (RSAC, RS4C)
        Alias (RSAC, RS4D)
        Alias (RSAC, RS5A)
        Alias (RSAC, RS5B)
        Alias (RSAC, RS5C)
        Alias (RSAC, RS5D)
        Alias (RSAC, RS6A)
        Alias (RSAC, RS6B)
        Alias (RSAC, RS6C)
        Alias (RSAC, RS6D)
        Alias (RSAC, RS7A)
        Alias (RSAC, RS7B)
        Alias (RSAC, RS7C)
        Alias (RSAC, RS7D)
        Alias (RSAC, RSP0)
        Alias (RSAC, RSP1)
        Alias (RSAC, RSP2)
        Alias (RSAC, RSP3)
        Alias (RSAC, RSP4)
        Alias (RSAC, RSP5)
        Alias (RSAC, RSP6)
        Name (RSIR, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000010,
                0x00000011,
                0x00000012,
                0x00000013,
            }
        })
        Name (RSII, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000014,
                0x00000015,
                0x00000016,
                0x00000017,
            }
        })
        Alias (RSII, RSIG)
        Alias (RSII, RSU1)
        Alias (RSII, RSU2)
        Alias (RSII, RSI1)
        Alias (RSII, RSI2)
        Alias (RSII, RSSA)
        Alias (RSII, RSMA)
        
        Device (PCI0) // nVidia Corporation MCP79 Host Bridge
        {
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                ^SBUS.ENAB ()
            }

            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    Return (AR00)
                }

                Return (PR00)
            }

            Device (LPCB) // nVidia Corporation MCP79 LPC Bridge
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Method (SPTS, 1, NotSerialized)
                {
                    Store (One, PS1S)
                    Store (One, PS1E)
                }

                Method (SWAK, 1, NotSerialized)
                {
                    Store (Zero, PS1E)
                    Store (0x02, S1CT)
                    Store (0x02, S3CT)
                    Store (0x02, S4CT)
                    Store (0x02, S5CT)
                }

                OperationRegion (SMIE, SystemIO, SCIO, 0x08)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PS1S,   1, 
                        ,   31, 
                    PS1E,   1, 
                    Offset (0x08)
                }

                OperationRegion (SXCT, SystemIO, SCTL, 0x10)
                Field (SXCT, ByteAcc, NoLock, Preserve)
                {
                    S1CT,   2, 
                    Offset (0x04), 
                    S3CT,   2, 
                    Offset (0x08), 
                    S4CT,   2, 
                    Offset (0x0C), 
                    S5CT,   2, 
                    Offset (0x10)
                }

                Scope (\_SB)
                {
                    OperationRegion (\SCPP, SystemIO, SSMI, One)
                    Field (SCPP, ByteAcc, NoLock, Preserve)
                    {
                        SMIP,   8
                    }

                    Scope (PCI0)
                    {
                        Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                        {
                            Return (0x03)
                        }

                        Name (_S1D, One)  // _S1D: S1 Device State
                        Name (NATA, Package (0x01)
                        {
                            0x00100000
                        })
                    }
                }

                OperationRegion (UCFG, PCI_Config, 0x78, One)
                Field (UCFG, ByteAcc, NoLock, Preserve)
                {
                    U1CF,   8
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        DMA (Compatibility, BusMaster, Transfer8, )
                            {4}
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0087,             // Range Minimum
                            0x0087,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0089,             // Range Minimum
                            0x0089,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x008F,             // Range Minimum
                            0x008F,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x00,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("PNP0303"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP030B"))  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ShiftLeft (One, 0x0A, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (PS2M)
                {
                    Name (_HID, EisaId ("PNP0F03"))  // _HID: Hardware ID
                    Name (_CID, Package (0x05)  // _CID: Compatible ID
                    {
                        EisaId ("SYN0A00"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F03"), 
                        EisaId ("PNP0F13"), 
                        EisaId ("PNP0F12")
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        ShiftLeft (One, 0x0C, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (0x0F)
                        }

                        Return (Zero)
                    }

                    Name (M2R0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (M2R1, ResourceTemplate ()
                    {
                        FixedIO (
                            0x0060,             // Address
                            0x01,               // Length
                            )
                        FixedIO (
                            0x0064,             // Address
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        ShiftLeft (One, 0x0A, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (M2R0)
                        }
                        Else
                        {
                            Return (M2R1)
                        }
                    }
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Name (_GPE, 0x27)  // _GPE: General Purpose Events
                    Name (REGC, Zero)
                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, REGC)
                        }
                    }

                    Method (ECAV, 0, NotSerialized) // Embedded Controller Availability
                    {
                        If (LEqual (REGC, Ones))
                        {
                            If (LGreaterEqual (_REV, 0x02))
                            {
                                Return (One)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }

                        Return (REGC)
                    }

                    OperationRegion (ECOR, EmbeddedControl, Zero, 0x0100)
                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x29), 
                        BT00,   8, 
                        BT01,   8, 
                        BT02,   8, 
                        BT03,   8, 
                        BT04,   8, 
                        BT05,   8, 
                        BT06,   8, 
                        BT07,   8, 
                        BT08,   8, 
                        BT09,   8, 
                        BT10,   8, 
                        BT11,   8, 
                        BT12,   8, 
                        BT13,   8, 
                        BT14,   8, 
                        BT15,   8, 
                        BT16,   8, 
                        BT17,   8, 
                        BT18,   8, 
                        BT19,   8, 
                        BT20,   8, 
                        BT21,   8, 
                        BT22,   8, 
                        BT23,   8, 
                        BT24,   8, 
                        BT25,   8, 
                        BT26,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x3F), 
                        BTS0,   1, 
                        BTS1,   1, 
                        BTS2,   1, 
                        BTS3,   1, 
                        BTS4,   1, 
                        BTS5,   1, 
                        BTS6,   1, 
                        BTS7,   1
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x51), 
                        ST00,   8, 
                        ST01,   8, 
                        ST02,   8, 
                        ST03,   8, 
                        ST04,   8, 
                        ST05,   8, 
                        ST06,   8, 
                        ST07,   8, 
                        ST08,   8, 
                        ST09,   8, 
                        ST10,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x61), 
                        SC00,   8, 
                        SC01,   8, 
                        SC02,   8, 
                        SC03,   8, 
                        SC04,   8, 
                        SC05,   8, 
                        SC06,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x6A), 
                        TH00,   8, 
                        TH01,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x71), 
                        TM00,   8, 
                        TM01,   8, 
                        TM02,   8, 
                        TM03,   8, 
                        TM04,   8, 
                        TM05,   8, 
                        TM06,   8, 
                        TM07,   8, 
                        TM08,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x81), 
                        SM00,   8, 
                        SM01,   8, 
                        SM02,   8, 
                        SM03,   8, 
                        SM04,   8, 
                        SM05,   8, 
                        SM06,   8, 
                        SM07,   8, 
                        SM08,   8, 
                        SM09,   8, 
                        SM10,   8, 
                        SM11,   8, 
                        SM12,   8, 
                        SM13,   8, 
                        SM14,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0xD0), 
                        SFB0,   8, 
                        SFB1,   8, 
                        SFB2,   8, 
                        SFB3,   8, 
                        Offset (0xEE), 
                        Offset (0xEF), 
                        SFBE,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0xD0), 
                        SF00,   1, 
                        SF01,   1, 
                        SF02,   1, 
                        SF03,   1, 
                        SF04,   1, 
                        SF05,   1, 
                        SF06,   1, 
                        SF07,   1, 
                        SF08,   1, 
                        SF09,   1, 
                        SF10,   1, 
                        SF11,   1, 
                        SF12,   1, 
                        SF13,   1, 
                        SF14,   1, 
                        SF15,   1, 
                        SF16,   1, 
                        SF17,   1, 
                        SF18,   1, 
                        SF19,   1, 
                        SF20,   1, 
                        SF21,   1, 
                        SF22,   1, 
                        SF23,   1, 
                        SF24,   1, 
                        SF25,   1, 
                        SF26,   1, 
                        SF27,   1, 
                        SF28,   1, 
                        SF29,   1, 
                        SF30,   1, 
                        SF31,   1, 
                        Offset (0xEE), 
                        S240,   1, 
                        S241,   1, 
                        S242,   1, 
                        S243,   1, 
                        S244,   1, 
                        S245,   1, 
                        S246,   1, 
                        S247,   1, 
                        S248,   1, 
                        S249,   1, 
                        S250,   1, 
                        S251,   1, 
                        S252,   1, 
                        S253,   1, 
                        S254,   1, 
                        S255,   1
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0xFF), 
                        BNKD,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x42), 
                        FT00,   8, 
                        FT01,   8, 
                        FT02,   8, 
                        FT03,   8, 
                        FT04,   8, 
                        FT05,   8, 
                        FT06,   8, 
                        FT07,   8, 
                        FT08,   8, 
                        FT09,   8, 
                        FT10,   8, 
                        FT11,   8, 
                        FT12,   8, 
                        FT13,   8, 
                        FT14,   8, 
                        FT15,   8, 
                        FT16,   8, 
                        FT17,   8, 
                        FT18,   8, 
                        FT19,   8, 
                        FT20,   8, 
                        FT21,   8, 
                        FT22,   8, 
                        FT23,   8, 
                        FT24,   8, 
                        FT25,   8, 
                        FT26,   8, 
                        FT27,   8, 
                        FT28,   8, 
                        FT29,   8
                    }

                    Field (ECOR, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x21), 
                        GP21,   8, 
                        Offset (0x27), 
                        GP27,   8, 
                        Offset (0x30), 
                        GP30,   8, 
                        GP31,   8
                    }

                    Method (EC0S, 1, NotSerialized) // Embedded Controller Sleep
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            If (ECAV ())
                            {
                                If (LNot (Acquire (MUEC, 0xFFFF)))
                                {
                                    Store (One, SF28)
                                    Release (MUEC)
                                }
                            }
                        }

                        If (Arg0)
                        {
                            If (LLess (Arg0, 0x04)) {}
                        }
                    }

                    Method (EC0W, 1, NotSerialized) // Embedded Controller Wake
                    {
                        If (Arg0)
                        {
                            If (LLess (Arg0, 0x04)) {}
                            If (LEqual (Arg0, 0x03))
                            {
                                If (ECAV ())
                                {
                                    If (LNot (Acquire (MUEC, 0xFFFF)))
                                    {
                                        Store (One, SF17)
                                        Release (MUEC)
                                    }
                                }
                            }
                        }
                    }
                }

                Scope (EC)
                {
                    Mutex (MUEC, 0x00)
                    OperationRegion (DLYP, SystemIO, 0xE1, One)
                    Field (DLYP, ByteAcc, NoLock, Preserve)
                    {
                        DELY,   8
                    }

                    OperationRegion (KBCP, SystemIO, Zero, 0xFF)
                    Field (KBCP, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x62), 
                        EC62,   8, 
                        Offset (0x66), 
                        EC66,   8
                    }

                    Field (KBCP, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x66), 
                        ECOF,   1, 
                        ECIE,   1, 
                        Offset (0x67)
                    }

                    Method (IBFX, 0, Serialized)
                    {
                        Store (0x1000, Local0)
                        While (LAnd (Decrement (Local0), ECIE))
                        {
                            Store (Zero, DELY)
                        }
                    }

                    Method (OBFX, 0, Serialized)
                    {
                        Store (0x1000, Local0)
                        While (LAnd (Decrement (Local0), LNot (ECOF)))
                        {
                            Store (Zero, DELY)
                        }
                    }

                    Method (ECXW, 2, Serialized) // EC Write
                    {
                        If (ECAV ())
                        {
                            // Locks Embedded Controller and writes data using ACPI EC interface protocol,
                            // which utilizes port 66 and port 62 to push the value to a specified address
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                IBFX () // Cause interrupt
                                Store (Arg0, EC66)
                                IBFX ()
                                Store (Arg1, EC62)
                                IBFX ()
                                Release (MUEC) // Release EC lock
                            }
                        }
                    }

                    Method (ECXR, 1, Serialized) // EC Read
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                IBFX ()
                                Store (Arg0, EC66)
                                OBFX ()
                                Store (EC62, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (BWRN, 1, Serialized)
                    {
                        Store (Ones, Local2)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                And (Arg0, 0xFF, Local0)
                                ShiftRight (And (Arg0, 0xFF00), 0x08, Local1)
                                Store (Local1, BT12)
                                Store (Local0, BT13)
                                Release (MUEC)
                                Store (Zero, Local2)
                            }
                        }

                        Return (Local2)
                    }

                    Method (BLOW, 1, Serialized)
                    {
                        Store (Ones, Local2)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                And (Arg0, 0xFF, Local0)
                                ShiftRight (And (Arg0, 0xFF00), 0x08, Local1)
                                Store (Local1, BT14)
                                Store (Local0, BT15)
                                Release (MUEC)
                                Store (Zero, Local2)
                            }
                        }

                        Return (Local2)
                    }

                    Method (BCRT, 1, Serialized)
                    {
                        Store (Ones, Local2)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                And (Arg0, 0xFF, Local0)
                                ShiftRight (And (Arg0, 0xFF00), 0x08, Local1)
                                Store (Local1, BT16)
                                Store (Local0, BT17)
                                Release (MUEC)
                                Store (Zero, Local2)
                            }
                        }

                        Return (Local2)
                    }

                    Method (BIF1, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT00, Local0)
                                Store (BT01, Local1)
                                Or (ShiftLeft (Local0, 0x08), Local1, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (BIF2, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT23, Local0)
                                Store (BT24, Local1)
                                Or (ShiftLeft (Local0, 0x08), Local1, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (BIF4, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT02, Local0)
                                Store (BT03, Local1)
                                Or (ShiftLeft (Local0, 0x08), Local1, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (BIF5, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT12, Local0)
                                Store (BT13, Local1)
                                Or (ShiftLeft (Local0, 0x08), Local1, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (BIF6, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT14, Local0)
                                Store (BT15, Local1)
                                Or (ShiftLeft (Local0, 0x08), Local1, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (BST1, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT25, Local0)
                                Store (BT26, Local1)
                                Or (ShiftLeft (Local0, 0x08), Local1, Local0)
                                Release (MUEC)
                            }
                        }

                        If (And (Local0, 0x8000))
                        {
                            Not (Local0, Local0)
                            And (Local0, 0xFFFF, Local0)
                            Add (Local0, One, Local0)
                        }

                        Return (Local0)
                    }

                    Method (BST2, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT10, Local0)
                                Store (BT11, Local1)
                                Or (ShiftLeft (Local0, 0x08), Local1, Local0)
                                Release (MUEC)
                            }
                        }

                        Multiply (Local0, 0x64, Local1)
                        Divide (Local1, 0x63, Local2, Local1)
                        If (LGreater (Local1, DerefOf (Index (PBIF, 0x02))))
                        {
                            Store (DerefOf (Index (PBIF, 0x02)), Local0)
                        }

                        Return (Local0)
                    }

                    Method (BST3, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT04, Local0)
                                Store (BT05, Local1)
                                Or (ShiftLeft (Local0, 0x08), Local1, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (EBTS, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BT22, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (RCTP, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (ST00, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (ETPS, 1, Serialized)
                    {
                        Store (EG21 (), Local0)
                        And (Local0, 0xEF, Local0)
                        Store (Arg0, Local1)
                        XOr (Local1, One, Local1)
                        And (Local1, One, Local1)
                        ShiftLeft (Local1, 0x04, Local1)
                        Or (Local0, Local1, Local0)
                        ES21 (Local0)
                        Return (One)
                    }

                    Method (ETPG, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (SF19, Local0)
                                XOr (Local0, One, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (EG21, 0, NotSerialized)
                    {
                        Store (0xFF, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BNKD, Local1)
                                Store (0x02, BNKD)
                                Store (GP21, Local0)
                                Store (Local1, BNKD)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (ES21, 1, NotSerialized)
                    {
                        Store (0xFF, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (BNKD, Local1)
                                Store (0x02, BNKD)
                                Store (Arg0, GP21)
                                Store (Local1, BNKD)
                                Release (MUEC)
                            }
                        }
                    }

                    Name (BRST, Zero)
                    Method (ELBS, 1, Serialized)
                    {
                        Store (Zero, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                XOr (Arg0, One, Local1)
                                Store (Local1, SF18)
                                Release (MUEC)
                                Store (One, Local0)
                                Store (Local1, BRST)
                            }
                        }

                        Return (Local0)
                    }

                    Method (ELBG, 0, Serialized)
                    {
                        Store (Ones, Local0)
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                Store (SF18, Local0)
                                XOr (Local0, One, Local0)
                                Release (MUEC)
                            }
                        }

                        Return (Local0)
                    }

                    Method (ECBR, 1, Serialized)
                    {
                        If (ECAV ())
                        {
                            If (LNot (Acquire (MUEC, 0xFFFF)))
                            {
                                If (BRST)
                                {
                                    Store (Zero, SF18)
                                    Store (Zero, BRST)
                                }

                                Store (Arg0, SC00)
                                Release (MUEC)
                            }
                        }
                    }
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                            0x00000000,         // Granularity
                            0x000D0000,         // Range Minimum
                            0x000D3FFF,         // Range Maximum
                            0x00000000,         // Translation Offset
                            0x00004000,         // Length
                            ,, , AddressRangeMemory, TypeStatic)
                        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                            0x00000000,         // Granularity
                            0x000D4000,         // Range Minimum
                            0x000D7FFF,         // Range Maximum
                            0x00000000,         // Translation Offset
                            0x00004000,         // Length
                            ,, , AddressRangeMemory, TypeStatic)
                        DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                            0x00000000,         // Granularity
                            0x000DE000,         // Range Minimum
                            0x000DFFFF,         // Range Maximum
                            0x00000000,         // Translation Offset
                            0x00002000,         // Length
                            ,, , AddressRangeMemory, TypeStatic)
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x0044,             // Range Minimum
                            0x0044,             // Range Maximum
                            0x00,               // Alignment
                            0x0A,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x00,               // Alignment
                            0x0B,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x00,               // Alignment
                            0x0E,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0084,             // Range Minimum
                            0x0084,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0088,             // Range Minimum
                            0x0088,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x008C,             // Range Minimum
                            0x008C,             // Range Maximum
                            0x00,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0090,             // Range Minimum
                            0x0090,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00A2,             // Range Minimum
                            0x00A2,             // Range Maximum
                            0x00,               // Alignment
                            0x1E,               // Length
                            )
                        IO (Decode16,
                            0x00E0,             // Range Minimum
                            0x00E0,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x00,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y00)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y01)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y02)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y03)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y04)
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x00,               // Alignment
                            0x00,               // Length
                            _Y05)
                        IO (Decode16,
                            0x0380,             // Range Minimum
                            0x0380,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y08)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y06)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y07)
                        Memory32Fixed (ReadOnly,
                            0xFEE01000,         // Address Base
                            0x000FF000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y00._MIN, GP00)  // _MIN: Minimum Base Address
                        CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y00._MAX, GP01)  // _MAX: Maximum Base Address
                        CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y00._LEN, GP0L)  // _LEN: Length
                        CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y01._MIN, GP10)  // _MIN: Minimum Base Address
                        CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y01._MAX, GP11)  // _MAX: Maximum Base Address
                        CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y01._LEN, GP1L)  // _LEN: Length
                        Store (PMBS, GP00)
                        Store (PMBS, GP01)
                        If (LGreaterEqual (PMLN, 0x0100))
                        {
                            ShiftRight (PMLN, One, GP0L)
                            Add (GP00, GP0L, GP10)
                            Add (GP01, GP0L, GP11)
                            Subtract (PMLN, GP0L, GP1L)
                        }
                        Else
                        {
                            Store (PMLN, GP0L)
                        }

                        If (SCBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y02._MIN, SC00)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y02._MAX, SC01)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y02._LEN, SC0L)  // _LEN: Length
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y03._MIN, SC10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y03._MAX, SC11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y03._LEN, SC1L)  // _LEN: Length
                            Store (SCBS, SC00)
                            Store (SCBS, SC01)
                            If (LGreaterEqual (SCLN, 0x0100))
                            {
                                ShiftRight (SCLN, One, SC0L)
                                Add (SC00, SC0L, SC10)
                                Add (SC01, SC0L, SC11)
                                Subtract (SCLN, SC0L, SC1L)
                            }
                            Else
                            {
                                Store (SCLN, SC0L)
                            }
                        }

                        If (ACBS)
                        {
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y04._MIN, AC00)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y04._MAX, AC01)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y04._LEN, AC0L)  // _LEN: Length
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y05._MIN, AC10)  // _MIN: Minimum Base Address
                            CreateWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y05._MAX, AC11)  // _MAX: Maximum Base Address
                            CreateByteField (CRS, \_SB.PCI0.LPCB.RMSC._Y05._LEN, AC1L)  // _LEN: Length
                            Store (ACBS, AC00)
                            Store (ACBS, AC01)
                            If (LGreaterEqual (ACLN, 0x0100))
                            {
                                ShiftRight (ACLN, One, AC0L)
                                Add (AC00, AC0L, AC10)
                                Add (AC01, AC0L, AC11)
                                Subtract (ACLN, AC0L, AC1L)
                            }
                            Else
                            {
                                Store (ACLN, AC0L)
                            }
                        }

                        If (SPAS)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y06._BAS, BB01)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y06._LEN, BL01)  // _LEN: Length
                            Store (SPAM, BB01)
                            Store (SPAL, BL01)
                        }

                        If (SNAS)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y07._BAS, AB01)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y07._LEN, AL01)  // _LEN: Length
                            Store (SNAM, AB01)
                            Store (SNAL, AL01)
                        }

                        CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y08._BAS, MB01)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.LPCB.RMSC._Y08._LEN, ML01)  // _LEN: Length
                        Store (CPB1, MB01)
                        Store (CPB2, ML01)
                        Return (CRS)
                    }
                }

                Scope (\)
                {
                    OperationRegion (RAMW, SystemMemory, 0x6FFF0000, 0x00010000)
                    Field (RAMW, ByteAcc, NoLock, Preserve)
                    {
                        PAR0,   32, 
                        PAR1,   32, 
                        PAR2,   32, 
                        PINX,   32, 
                        SCFG,   32, 
                        BATR,   32, 
                        ATKF,   32, 
                        HWCF,   32, 
                        WAKT,   8, 
                        Offset (0x24), 
                        TRTY,   32, 
                        FADR,   32, 
                        FSIZ,   32, 
                        FSTA,   32, 
                        FSFN,   32, 
                        USBI,   32
                    }

                    OperationRegion (IOB2, SystemIO, 0x442E, 0x02)
                    Field (IOB2, ByteAcc, NoLock, Preserve)
                    {
                        SMIC,   8, 
                        SMIS,   8
                    }

                    Method (ISMI, 1, Serialized)
                    {
                        Store (Arg0, SMIC)
                    }

                    Method (GNVS, 1, Serialized)
                    {
                        Store (0x80000000, PINX)
                        Store (Arg0, PAR0)
                        ISMI (0x70)
                        Return (PAR1)
                    }

                    Method (SNVS, 2, Serialized)
                    {
                        Store (0x80000001, PINX)
                        Store (Arg0, PAR0)
                        Store (Arg1, PAR1)
                        ISMI (0x70)
                    }

                    Name (ARBF, Buffer (0x10) {})
                    CreateDWordField (ARBF, Zero, REAX)
                    CreateDWordField (ARBF, 0x04, REBX)
                    CreateDWordField (ARBF, 0x08, RECX)
                    CreateDWordField (ARBF, 0x0C, REDX)
                    Method (SMSR, 1, Serialized)
                    {
                        CreateDWordField (Arg0, Zero, AEAX)
                        CreateDWordField (Arg0, 0x04, AEBX)
                        CreateDWordField (Arg0, 0x08, AECX)
                        CreateDWordField (Arg0, 0x0C, AEDX)
                        Store (0x80000003, PINX)
                        Store (AECX, PAR0)
                        Store (AEAX, PAR1)
                        Store (AEDX, PAR2)
                        ISMI (0x70)
                    }

                    Method (GMSR, 1, Serialized)
                    {
                        Store (0x80000002, PINX)
                        Store (Arg0, PAR0)
                        ISMI (0x70)
                        Store (Arg0, RECX)
                        Store (PAR1, REAX)
                        Store (PAR2, REDX)
                        Return (ARBF)
                    }

                    Method (PRID, 1, Serialized)
                    {
                        Store (0x80000004, PINX)
                        Store (Arg0, PAR0)
                        ISMI (0x70)
                        Store (PAR1, REAX)
                        Store (PAR2, REDX)
                        Return (ARBF)
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQNoFlags ()
                            {0,8,11,15}
                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                OperationRegion (LPDC, PCI_Config, 0xA0, 0x06)
                Field (LPDC, ByteAcc, NoLock, Preserve)
                {
                    S3F8,   1, 
                    S2F8,   1, 
                        ,   3, 
                    S2E8,   1, 
                        ,   1, 
                    S3E8,   1, 
                        ,   4, 
                    M300,   1, 
                        ,   2, 
                    M330,   1, 
                        ,   4, 
                    FDC0,   1, 
                    Offset (0x03), 
                    P378,   1, 
                    P278,   1, 
                    P3BC,   1, 
                    Offset (0x04), 
                    G200,   8, 
                    G208,   8
                }

                Method (RRIO, 4, NotSerialized)
                {
                    If (LOr (LEqual (Arg0, Zero), LEqual (Arg0, One)))
                    {
                        If (LEqual (Arg2, 0x03F8))
                        {
                            Store (Arg1, S3F8)
                        }

                        If (LEqual (Arg2, 0x02F8))
                        {
                            Store (Arg1, S2F8)
                        }

                        If (LEqual (Arg2, 0x03E8))
                        {
                            Store (Arg1, S3E8)
                        }

                        If (LEqual (Arg2, 0x02E8))
                        {
                            Store (Arg1, S2E8)
                        }
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        If (LEqual (Arg2, 0x0378))
                        {
                            Store (Arg1, P378)
                        }

                        If (LEqual (Arg2, 0x0278))
                        {
                            Store (Arg1, P278)
                        }

                        If (LEqual (Arg2, 0x03BC))
                        {
                            Store (Arg1, P3BC)
                        }
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (Arg1, FDC0)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        If (LEqual (Arg2, 0x0330))
                        {
                            Store (Arg1, M330)
                        }

                        If (LEqual (Arg2, 0x0300))
                        {
                            Store (Arg1, M300)
                        }
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Store (Zero, Local0)
                        If (Arg1)
                        {
                            Store (0xFF, Local0)
                        }

                        If (LEqual (Arg2, 0x0200))
                        {
                            Store (Local0, G200)
                        }

                        If (LEqual (Arg2, 0x0208))
                        {
                            Store (Local0, G208)
                        }
                    }
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x00,               // Alignment
                            0x04,               // Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                    })
                }

                Device (^PCIE)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x11)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0xE0000000,         // Address Base
                            0x10000000,         // Address Length
                            _Y09)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.PCI0.PCIE._Y09._BAS, BAS1)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.PCI0.PCIE._Y09._LEN, LEN1)  // _LEN: Length
                        Store (PCIB, BAS1)
                        Store (PCIL, LEN1)
                        Return (CRS)
                    }
                }

                Scope (\)
                {
                }

                Device (OMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0A)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0B)
                    })
                    Name (CRS1, ResourceTemplate ()
                    {
                        FixedIO (
                            0x0060,             // Address
                            0x01,               // Length
                            )
                        FixedIO (
                            0x0064,             // Address
                            0x01,               // Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0C)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0D)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (APIC)
                        {
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.OMSC._Y0A._LEN, ML01)  // _LEN: Length
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.OMSC._Y0A._BAS, MB01)  // _BAS: Base Address
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.OMSC._Y0B._LEN, ML02)  // _LEN: Length
                            CreateDWordField (CRS, \_SB.PCI0.LPCB.OMSC._Y0B._BAS, MB02)  // _BAS: Base Address
                            Store (0xFEC00000, MB01)
                            Store (0x1000, ML01)
                            Store (0xFEE00000, MB02)
                            Store (0x1000, ML02)
                            CreateDWordField (CRS1, \_SB.PCI0.LPCB.OMSC._Y0C._LEN, ML03)  // _LEN: Length
                            CreateDWordField (CRS1, \_SB.PCI0.LPCB.OMSC._Y0C._BAS, MB03)  // _BAS: Base Address
                            CreateDWordField (CRS1, \_SB.PCI0.LPCB.OMSC._Y0D._LEN, ML04)  // _LEN: Length
                            CreateDWordField (CRS1, \_SB.PCI0.LPCB.OMSC._Y0D._BAS, MB04)  // _BAS: Base Address
                            Store (0xFEC00000, MB03)
                            Store (0x1000, ML03)
                            Store (0xFEE00000, MB04)
                            Store (0x1000, ML04)
                        }

                        ShiftLeft (0x05, 0x0A, Local0)
                        If (And (IOST, Local0))
                        {
                            Return (CRS)
                        }
                        Else
                        {
                            Return (CRS1)
                        }
                    }
                }

                Device (^^RMEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (CRS, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x000A0000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y0E)
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            _Y0F)
                        Memory32Fixed (ReadWrite,
                            0x00100000,         // Address Base
                            0x00000000,         // Address Length
                            _Y10)
                        Memory32Fixed (ReadOnly,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y11)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (CRS, \_SB.RMEM._Y0E._BAS, BAS1)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.RMEM._Y0E._LEN, LEN1)  // _LEN: Length
                        CreateDWordField (CRS, \_SB.RMEM._Y0F._BAS, BAS2)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.RMEM._Y0F._LEN, LEN2)  // _LEN: Length
                        CreateDWordField (CRS, \_SB.RMEM._Y10._LEN, LEN3)  // _LEN: Length
                        CreateDWordField (CRS, \_SB.RMEM._Y11._BAS, BAS4)  // _BAS: Base Address
                        CreateDWordField (CRS, \_SB.RMEM._Y11._LEN, LEN4)  // _LEN: Length
                        If (OSFL ()) {}
                        Else
                        {
                            If (MG1B)
                            {
                                If (LGreater (MG1B, 0x000C0000))
                                {
                                    Store (0x000C0000, BAS1)
                                    Subtract (MG1B, BAS1, LEN1)
                                }
                            }
                            Else
                            {
                                Store (0x000C0000, BAS1)
                                Store (0x00020000, LEN1)
                            }

                            If (Add (MG1B, MG1L, Local0))
                            {
                                Store (Local0, BAS2)
                                Subtract (0x00100000, BAS2, LEN2)
                            }
                        }

                        Subtract (MG2B, 0x00100000, LEN3)
                        Store (MH1B, BAS4)
                        Subtract (Zero, BAS4, LEN4)
                        Return (CRS)
                    }
                }

                Scope (\)
                {
                    Name (MNAM, "1201N")
                    Field (RAMW, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x10), 
                        ACPS,   1, 
                        DCPS,   1, 
                        LCDC,   1, 
                        P00C,   1, 
                        TPLK,   1,  // Touchpad Lock bit
                        FANC,   1,  // Fan Control bit
                        BLTS,   1, 
                        DC2S,   1, 
                        FS70,   8, 
                        Offset (0x14), 
                        BCAT,   16, 
                        BLTC,   8, 
                        BCGS,   8, 
                        DSAF,   32, 
                        HWIF,   32
                    }
                }

                Scope (\_SB)
                {
                    Scope (\)
                    {
                        OperationRegion (PMIO, SystemIO, 0x4000, 0x80)
                        Field (PMIO, ByteAcc, NoLock, Preserve)
                        {
                            Offset (0x10), 
                                ,   1, 
                            TDTY,   3, 
                            TENA,   1, 
                            TTDT,   3, 
                            TTEN,   1, 
                                ,   8, 
                            THLS,   1
                        }

                        Method (LPFS, 1, NotSerialized) // LPCB sleep sequence is only valid for shutdown case
                        {
                            If (LEqual (Arg0, 0x05))
                            {
                                SNVS (0x82B0, GNVS (0x8078))
                            }
                        }

                        Method (LPWK, 1, NotSerialized) // LPCB wake sequence
                        {
                            If (LEqual (Arg0, 0x03))
                            {
                                \_SB.PCI0.LPCB.EC.UAPF ()
                                \_SB.PCI0.LPCB.EC.UBPF ()
                                \_SB.PCI0.LPCB.EC.STBR ()
                            }

                            Store (Arg0, WAKT)
                            Notify (\_SB.PCI0.BAT0, 0x81)
                            Notify (\_SB.PCI0.ADP1, 0x81)
                            If (LNot (GNVS (0x1655)))
                            {
                                Notify (\_SB.PWRB, 0x02)
                            }

                            Notify (\_PR.CPU0, 0x80)
                            Notify (\_PR.CPU0, 0x81)
                            Sleep (0x0A)
                            If (Ones)
                            {
                                Notify (\_PR.CPU1, 0x80)
                                Notify (\_PR.CPU1, 0x81)
                            }
                        }
                    }

                    Scope (\_SB)
                    {
                        Device (PNLF)
                        {
                            Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                            Name (_CID, "backlight")  // _CID: Compatible ID
                            Name (_UID, 0x0A)  // _UID: Unique ID
                            Name (_STA, 0x0B)  // _STA: Status
                        }


                        /* 
                        ** No use for this approach as 1201N is unable to sense when the LID is being open, 
                        ** so no wake from LID is possible
                        
                        Device (LID0)
                        {
                            Name (_HID, EisaId ("PNP0C0D"))  // _HID: Hardware ID
                            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                            {
                                0x0A, 
                                0x03
                            })
                            Name (LIDS, One)
                            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                            {
                                If (Arg0) // when LID gets closed we notify EC to cause S3 sleep event
                                {
                                    ^^PCI0.LPCB.EC.EC0S (0x03)
                                }
                                Else
                                {
                                    ^^PCI0.LPCB.EC.EC0W (0x03)
                                }
                            }

                            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
                            {
                                If (^^PCI0.LPCB.EC.ECAV ())
                                {
                                    If (LNot (Acquire (^^PCI0.LPCB.EC.MUEC, 0xFFFF)))
                                    {
                                        Store (^^PCI0.LPCB.EC.SF13, LIDS)
                                        Release (^^PCI0.LPCB.EC.MUEC)
                                    }
                                }

                                Return (LIDS)
                            }
                        }
                        */
                        Device (LID0)
                        {
                            Name (_HID, EisaId ("PNP0C0D"))  // _HID: Hardware ID
                            Name (LIDS, One)
                            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
                            {
                                If (^^PCI0.LPCB.EC.ECAV())
                                {
                                    If (LNot (Acquire (^^PCI0.LPCB.EC.MUEC, 0xFFFF)))
                                    {
                                        Store (^^PCI0.LPCB.EC.SF13, LIDS) // get LID state from EC
                                        Release (^^PCI0.LPCB.EC.MUEC)
                                    }
                                    
                                    XOr (LIDS, One, Local0) // EC stores inverted state, need to XOR
                                    If (Local0) // if LID is closed 
                                    {
                                        Notify (SLPB, 0x80) // notify sleep button to cause S3
                                    }
                                }

                                Return (LIDS)
                            }
                        }
                        
                        Device (SLPB)
                        {
                            Name (_HID, EisaId ("PNP0C0E"))  // _HID: Hardware ID
                            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                            {
                                Return (Package (0x02)
                                {
                                    One, 
                                    0x04
                                })
                            }
                        }
                    }

                    /*
                        Based on value of PS2K.MODE EC queries can be split into two actions, 
                        each dedicated to separate key mode. This allows to create isolated behavior.
                    */
                    
                    Scope (PCI0.LPCB.EC)
                    {
                        Method (_Q04, 0, NotSerialized)  // _Qxx: EC Query - Fn+F1 > Sleep
                        {
                            If (LEqual (^^PS2K.MODE, One)) 
                            {
                                Notify (SLPB, 0x80) // In Standard Key Mode causes sleep
                            }
                            Else // In Special Key Mode passes scancode e05f to PS2 driver for F1
                            {
                                Notify (PS2K, 0x025F) // Key Down
                                Notify (PS2K, 0x02DF) // Key Up (Down+0x80)
                            }
                        }

                        Method (_Q06, 0, NotSerialized)  // _Qxx: EC Query - Fn+F2 > RF Kill Switch
                        {
                            If (LEqual (^^PS2K.MODE, One))
                            {
                                ^^PS2K.RFKL () // In Standard Mode toggles BT and WF state
                            }
                            Else // In Special Mode passes scancode e007 to PS2 driver for F2
                            {
                                Notify (PS2K, 0x0207)
                                Notify (PS2K, 0x0287)
                            }
                        }

                        Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query - Fn+F5 > Brightness Down
                        {
                            // Handles brightness down event when in Standard Mode and acts as F5 in Special Mode
                            Notify (PS2K, 0x0205)
                            Notify (PS2K, 0x0285)
                        }

                        Method (_Q0D, 0, NotSerialized)  // _Qxx: EC Query - Fn+F6 > Brightness Up
                        {
                            // Handles brightness up event when in Standard Mode and acts as F6 in Special Mode
                            Notify (PS2K, 0x0206)
                            Notify (PS2K, 0x0286)
                        }

                        Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query - Fn+F8 > Video Signal mirror
                        {
                            // Handles vidmirror event when in Standard Mode and acts as F8 in Special Mode
                            Notify (PS2K, 0x026E)
                            Notify (PS2K, 0x02EE)
                        }

                        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query - Fn+F9 > Touchpad toggle
                        {
                            // In Standard Mode passes scancode e037 to PS2 driver to stop-resume sending 
                            // packets and toggle LED
                            If (LEqual (^^PS2K.MODE, One))
                            {
                                Notify (PS2K, 0x0237)
                                Notify (PS2K, 0x02B7)
                            }   
                            // Because there is a dedicated touchpad toggle button we can't just assign 
                            // e037 to F9 or that button  would turn into F9 as well so we need it to generate 
                            // a dedicated scancode e009 in Special Mode for F9 to work                     
                            Else
                            {
                                Notify (PS2K, 0x0209)
                                Notify (PS2K, 0x0289)
                            }
                        }

                        Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query - Fn+F10 > Mute
                        {
                            // Handles mute event when in Standard Mode and acts as F10 in Special Mode
                            Notify (PS2K, 0x0220)
                            Notify (PS2K, 0x02A0)
                        }

                        Method (_Q17, 0, NotSerialized)  // _Qxx: EC Query - Fn+F11 > Volume Down
                        {
                            // Handles volume down event when in Standard Mode and acts as F11 in Special Mode
                            Notify (PS2K, 0x022E)
                            Notify (PS2K, 0x02AE)
                        }

                        Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query - Fn+F12 > Volume Up
                        {
                            // Handles volume up event when in Standard Mode and acts as F12 in Special Mode
                            Notify (PS2K, 0x0230)
                            Notify (PS2K, 0x02B0)
                        }

                        Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query - Fn+F7 > LCD backlight toggle
                        {
                            If (LEqual (^^PS2K.MODE, One))
                            {
                                ^^PS2K.LBTG ()
                            }
                            Else
                            {
                                Notify (PS2K, 0x0208)
                                Notify (PS2K, 0x0288)
                            }
                        }

                        Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query - Fn+Space > SHE Mode Toggle
                        {
                        }

                        Method (_Q27, 0, NotSerialized)  // _Qxx: EC Query - Dedicated Touchpad Button
                        {
                            // Notifies PS2 driver (regardless of key mode) to stop accepting packets and toggle LED
                            Notify (PS2K, 0x0237)
                            Notify (PS2K, 0x02B7)
                        }

                        Method (_Q2B, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            Notify (LID0, 0x80)
                        }

                        Method (_Q2C, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            Notify (LID0, 0x80)
                        }

                        Method (_Q31, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            UAPF ()
                            If (^^^IXVE.IGPU.BRNC) {}
                            Else
                            {
                                STBR ()
                            }

                            Notify (ADP1, 0x80)
                            Notify (BAT0, 0x80)
                            Sleep (0x0A)
                            If (ACPS) {}
                            Else
                            {
                            }

                            Notify (\_PR.CPU0, 0x80)
                            Notify (\_PR.CPU0, 0x81)
                            Sleep (0x0A)
                            If (Ones)
                            {
                                Notify (\_PR.CPU1, 0x80)
                                Notify (\_PR.CPU1, 0x81)
                            }
                        }

                        Method (_Q32, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            UBPF ()
                            If (DCPS)
                            {
                                Sleep (0x01F4)
                            }

                            STBR ()
                            Notify (BAT0, One)
                            Notify (BAT0, 0x81)
                            Notify (ADP1, 0x80)
                        }

                        Method (_Q33, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            Notify (BAT0, 0x80)
                            Notify (BAT0, 0x81)
                            Notify (ADP1, 0x80)
                        }

                        Method (_Q35, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            Notify (BAT0, 0x80)
                            Notify (ADP1, 0x80)
                        }

                        Method (_Q36, 0, NotSerialized)  // _Qxx: EC Query
                        {
                            Notify (BAT0, 0x80)
                            Notify (ADP1, 0x80)
                        }

                        Method (STBR, 0, Serialized) // Set Brightness 
                        {
                            Sleep (0x32)
                            Store (DerefOf (Index (PWAC, LBTN)), Local0)
                            ECBR (Local0)
                        }

                        Name (PWAC, Buffer (0x10)
                        {
                            /* 0000 */   0x02, 0x07, 0x0B, 0x10, 0x15, 0x19, 0x1E, 0x22,
                            /* 0008 */   0x27, 0x2C, 0x32, 0x39, 0x41, 0x4A, 0x54, 0x5F
                        })
                        Method (UBPF, 0, Serialized)
                        {
                            If (ECAV ())
                            {
                                If (LNot (Acquire (MUEC, 0xFFFF)))
                                {
                                    Store (SF01, Local0)
                                    Release (MUEC)
                                    Store (Local0, DCPS)
                                }
                            }
                        }

                        Method (UAPF, 0, Serialized)
                        {
                            If (ECAV ())
                            {
                                If (LNot (Acquire (MUEC, 0xFFFF)))
                                {
                                    Store (SF00, Local0)
                                    Release (MUEC)
                                    Store (Local0, ACPS)
                                }
                            }
                        }

                        Method (UBCF, 0, Serialized)
                        {
                            Store (BIF1 (), BCAT)
                        }

                        Method (UBCS, 0, Serialized)
                        {
                            If (ACPS)
                            {
                                Store (0x02, BCGS)
                                Store (EBTS (), Local1)
                                If (LNotEqual (Local1, Ones))
                                {
                                    If (And (Local1, 0x40))
                                    {
                                        Store (Zero, BCGS)
                                    }
                                }
                            }
                            Else
                            {
                                Store (One, BCGS)
                            }
                        }

                        Method (UBEC, 0, Serialized)
                        {
                            If (DCPS)
                            {
                                Store (BIF2 (), Local0)
                                If (LNotEqual (Local0, Ones))
                                {
                                    Multiply (Local0, 0x0A, Local1)
                                    Divide (Local1, 0x64, Local2, Local1)
                                    If (Local2)
                                    {
                                        Add (Local1, One, Local1)
                                    }

                                    BWRN (Local1)
                                    Multiply (Local0, 0x05, Local1)
                                    Divide (Local1, 0x64, Local2, Local1)
                                    If (Local2)
                                    {
                                        Add (Local1, One, Local1)
                                    }

                                    BLOW (Local1)
                                    Multiply (Local0, 0x03, Local1)
                                    Divide (Local1, 0x64, Local2, Local1)
                                    If (Local2)
                                    {
                                        Add (Local1, One, Local1)
                                    }

                                    BCRT (Local1)
                                }
                            }
                        }
                    }
                }

                Scope (^^PCI0)
                {
                    Device (BAT0)
                    {
                        Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
                        Name (_UID, Zero)  // _UID: Unique ID
                        Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                        {
                            _SB
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (CSTA ())
                        }

                        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
                        {
                            If (LEqual (DCPS, Zero))
                            {
                                Return (NBIF)
                            }

                            CBIF ()
                            Return (PBIF)
                        }

                        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
                        {
                            If (And (0x10, _STA ()))
                            {
                                CBST ()
                            }

                            Return (PBST)
                        }
                    }

                    Name (NBIF, Package (0x0D)
                    {
                        One, 
                        Ones, 
                        Ones, 
                        One, 
                        Ones, 
                        Ones, 
                        Ones, 
                        Ones, 
                        Ones, 
                        " ", 
                        " ", 
                        " ", 
                        " "
                    })
                    Name (PBIF, Package (0x0D)
                    {
                        One, 
                        0x10CC, 
                        0x1068, 
                        One, 
                        0x36D0, 
                        0x01A4, 
                        0xD2, 
                        0x1C, 
                        0x050A, 
                        "1201N", 
                        "0062", 
                        "Li-Ion", 
                        "ASUS"
                    })
                    Name (BATF, Buffer (0x02) {})
                    CreateWordField (BATF, Zero, DATW)
                    Name (BAF1, Buffer (0x02) {})
                    CreateWordField (BAF1, Zero, DAT2)
                    Method (CSTA, 0, Serialized)
                    {
                        Store (DCPS, Local0)
                        If (Local0)
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Method (CBIF, 0, Serialized)
                    {
                        ^LPCB.EC.UBCS ()
                        Store (^LPCB.EC.BIF1 (), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Store (Local0, Index (PBIF, One))
                        }

                        Store (^LPCB.EC.BIF2 (), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Store (Local0, Index (PBIF, 0x02))
                        }

                        Store (^LPCB.EC.BIF4 (), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Store (Local0, Index (PBIF, 0x04))
                        }

                        Store (^LPCB.EC.BIF2 (), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Multiply (Local0, 0x0A, Local1)
                            Divide (Local1, 0x64, Local2, Local1)
                            If (Local2)
                            {
                                Add (Local1, One, Local1)
                            }

                            Store (Local1, Index (PBIF, 0x05))
                        }

                        Store (^LPCB.EC.BIF2 (), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Multiply (Local0, 0x05, Local1)
                            Divide (Local1, 0x64, Local2, Local1)
                            If (Local2)
                            {
                                Add (Local1, One, Local1)
                            }

                            Store (Local1, Index (PBIF, 0x06))
                        }

                        Store (^LPCB.EC.BIF1 (), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Divide (Local0, 0x64, Local1, Local0)
                            Store (Local0, Index (PBIF, 0x07))
                            Store (Local0, Index (PBIF, 0x08))
                        }
                    }

                    Name (PBST, Package (0x04)
                    {
                        Zero, 
                        0x8000, 
                        0x8000, 
                        0x36B0
                    })
                    Method (CBST, 0, Serialized)
                    {
                        ^LPCB.EC.UBCS ()
                        Store (BCGS, Index (PBST, Zero))
                        Store (^LPCB.EC.BST1 (), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Store (Local0, Index (PBST, One))
                        }

                        Store (^LPCB.EC.BST2 (), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Store (Local0, Index (PBST, 0x02))
                        }

                        Store (^LPCB.EC.BST3 (), DATW)
                        If (LNotEqual (DATW, Ones))
                        {
                            Store (DATW, Index (PBST, 0x03))
                        }
                    }

                    Method (UBLP, 0, Serialized)
                    {
                        If (LEqual (BCGS, One))
                        {
                            Store (0x64, BLTC)
                        }

                        If (LOr (LEqual (BCGS, Zero), LEqual (BCGS, 0x02)))
                        {
                            Store (Zero, BLTC)
                        }
                    }
                }

                Scope (\_SB)
                {
                    Scope (PCI0)
                    {
                        Device (ADP1)
                        {
                            Name (_HID, "ACPI0003")  // _HID: Hardware ID
                            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
                            {
                                Return (ACPS)
                            }

                            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
                            {
                                PCI0
                            })
                        }
                    }
                }
            }

            Device (IMAP) // nVidia Corporation MCP79 Memory Controller
            {
                Name (_ADR, 0x00030001)  // _ADR: Address
                OperationRegion (PIMC, PCI_Config, 0x60, 0x54)
                Field (PIMC, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                    Offset (0x04), 
                    PILN,   8, 
                    Offset (0x08), 
                    PIU0,   8, 
                    PIU2,   8, 
                    UBR1,   8, 
                    UBR2,   8, 
                    Offset (0x0D), 
                    Offset (0x0E), 
                    PIRM,   8, 
                    PMUD,   8, 
                    PAZA,   8, 
                    GPUR,   8, 
                    PR0E,   8, 
                    Offset (0x14), 
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    Offset (0x1C), 
                    P0EA,   8, 
                    P0EB,   8, 
                    P0EC,   8, 
                    P0ED,   8, 
                    P1EA,   8, 
                    P1EB,   8, 
                    P1EC,   8, 
                    P1ED,   8, 
                    P2EA,   8, 
                    P2EB,   8, 
                    P2EC,   8, 
                    P2ED,   8, 
                    P3EA,   8, 
                    P3EB,   8, 
                    P3EC,   8, 
                    P3ED,   8, 
                    P4EA,   8, 
                    P4EB,   8, 
                    P4EC,   8, 
                    P4ED,   8, 
                    P5EA,   8, 
                    P5EB,   8, 
                    P5EC,   8, 
                    P5ED,   8, 
                    P6EA,   8, 
                    P6EB,   8, 
                    P6EC,   8, 
                    P6ED,   8, 
                    P7EA,   8, 
                    P7EB,   8, 
                    P7EC,   8, 
                    P7ED,   8, 
                    Offset (0x4C), 
                    XVE0,   8, 
                    XVE1,   8, 
                    XVE2,   8, 
                    XVE3,   8, 
                    XVE4,   8, 
                    XVE5,   8, 
                    XVE6,   8, 
                    XVE7,   8
                }
            }

            Device (SBUS) // nVidia Corporation MCP79 SMBus
            {
                Name (_ADR, 0x00030002)  // _ADR: Address
                OperationRegion (SMBE, PCI_Config, 0x04, 0x02)
                Field (SMBE, AnyAcc, NoLock, Preserve)
                {
                    IOSE,   1, 
                    MMSE,   1
                }

                OperationRegion (SMAD, PCI_Config, 0x20, 0x08)
                Field (SMAD, DWordAcc, NoLock, Preserve)
                {
                    SB1,    32, 
                    SB2,    32
                }

                OperationRegion (SMCF, PCI_Config, 0x48, 0x10)
                Field (SMCF, DWordAcc, NoLock, Preserve)
                {
                    SMPM,   4, 
                    SMT1,   28, 
                    SMT2,   32
                }

                OperationRegion (SME4, PCI_Config, 0xE4, 0x04)
                Field (SME4, AnyAcc, NoLock, Preserve)
                {
                        ,   17, 
                    XPME,   1
                }

                Method (GPMD, 1, NotSerialized)
                {
                    Store (Arg0, XPME)
                }

                Method (SMBB, 0, NotSerialized)
                {
                    And (SB1, 0xFFFE, Local0)
                    And (SB2, 0xFFFE, Local0)
                    Return (Local0)
                }

                Method (ENAB, 0, NotSerialized)
                {
                    Store (One, IOSE)
                }

                Scope (^^PCI0)
                {
                    OperationRegion (SM00, SystemIO, SBUS.SMBB (), 0x40)
                    Field (SM00, ByteAcc, NoLock, Preserve)
                    {
                        CTLR,   8, 
                        HSTS,   8, 
                        ADDR,   8, 
                        CMDR,   8, 
                        DAT0,   8, 
                        DAT1,   8, 
                        Offset (0x25), 
                        ALAD,   8, 
                        ALDL,   8, 
                        ALDH,   8
                    }

                    Field (SM00, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x04), 
                        SB32,   256
                    }

                    Method (SWFS, 0, NotSerialized)
                    {
                        And (HSTS, 0x80, Local0)
                        While (LEqual (Local0, Zero))
                        {
                            Stall (One)
                            And (HSTS, 0x80, Local0)
                        }
                    }

                    Method (SMSB, 2, NotSerialized)
                    {
                        SRBY (Arg0, Arg1)
                    }

                    Method (SRBY, 2, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (0x04, CTLR)
                        SWFS ()
                    }

                    Method (SMWB, 3, NotSerialized)
                    {
                        WBYT (Arg0, Arg1, Arg2)
                    }

                    Method (WBYT, 3, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (Arg2, DAT0)
                        Store (0x06, CTLR)
                        SWFS ()
                    }

                    Method (SMWW, 4, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (Arg2, DAT0)
                        Store (Arg3, DAT1)
                        Store (0x08, CTLR)
                        SWFS ()
                    }

                    Method (SMRB, 2, NotSerialized)
                    {
                        Return (RBYT (Arg0, Arg1))
                    }

                    Method (RBYT, 2, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (0x07, CTLR)
                        SWFS ()
                        Return (DAT0)
                    }

                    Method (SMRW, 2, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (0x09, CTLR)
                        SWFS ()
                        Store (DAT0, Local0)
                        ShiftLeft (DAT1, 0x08, Local1)
                        Or (Local0, Local1, Local2)
                        Return (Local2)
                    }

                    Method (SRBK, 2, NotSerialized)
                    {
                        Store (Arg0, ADDR)
                        Store (Arg1, CMDR)
                        Store (0x0B, CTLR)
                        SWFS ()
                        Return (SB32)
                    }

                    Method (NVH7, 0, NotSerialized)
                    {
                        If (LEqual (SLOW, One))
                        {
                            Store (0x966A, ^SBUS.SMT2)
                        }

                        Return (Package (0x05)
                        {
                            0xC6, 
                            0xC8, 
                            0xCA, 
                            0xCC, 
                            0xCE
                        })
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x09, 
                        0x04
                    })
                }
            }

            Device (NMAC)
            {
                Name (_ADR, 0x000A0000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0B, 
                    0x05
                })
                Scope (\_GPE)
                {
                    Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        Notify (\_SB.PCI0.NMAC, 0x02)
                        Notify (\_SB.PWRB, 0x02)
                    }
                }
            }

            Device (SATA) // nVidia Corporation MCP79 SATA Controller
            {
                Name (_ADR, 0x000B0000)  // _ADR: Address
                Device (PRT0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x17, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, SPTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Concatenate (Local0, FZTF))
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                }, Local0)
                            Return (Concatenate (Local0, FZTF))
                        }
                    }
                }

                Device (PRT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Name (SSTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x17, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SSTM)
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, SSTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Concatenate (Local0, FZTF))
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xB0, 0xEF
                                }, Local0)
                            Return (Concatenate (Local0, FZTF))
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Store (0x08, Local0)
                    ShiftRight (CPB0, Local0, Local1)
                    And (Local1, 0x3F, Local0)
                    Return (Local0)
                }
            }

            Device (PBB0)
            {
                Name (_ADR, 0x00090000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        Zero, 
                        0x04
                    })
                }
            }

            Device (HDEF) // nVidia Corporation MCP79 High Definition Audio, MCP uses special @8 address
            {
                Name (_ADR, 0x00080000)  // _ADR: Address
                OperationRegion (PMCF, PCI_Config, 0x48, 0x02)
                Field (PMCF, ByteAcc, NoLock, Preserve)
                {
                    PMDS,   2, 
                    Offset (0x01), 
                    PMEN,   1, 
                        ,   6, 
                    PMST,   1
                }

                OperationRegion (DCF2, PCI_Config, 0xE0, 0x08)
                Field (DCF2, ByteAcc, NoLock, Preserve)
                {
                    AOCW,   32, 
                    Offset (0x06), 
                    CDID,   8
                }
                
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x15, 
                        0x04
                    })
                }
            }

            Device (IXVE)
            {
                Name (_ADR, 0x00100000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR02)
                    }

                    Return (PR02)
                }

                Device (IGPU) // nVidia Corporation GeForce 9400M GT
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    OperationRegion (VSID, PCI_Config, Zero, 0x04)
                    Field (VSID, ByteAcc, NoLock, Preserve)
                    {
                        REG0,   32
                    }

                    Method (PRST, 0, NotSerialized)
                    {
                        If (LEqual (REG0, Ones))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (One)
                        }
                    }

                    Name (VGAB, Buffer (0x02) {})
                    CreateWordField (VGAB, Zero, DISD)
                    CreateByteField (VGAB, Zero, NXTD)
                    CreateByteField (VGAB, One, AVLD)
                    Name (LCDM, One)
                    Name (CRTM, 0x02)
                    Name (TVOM, 0x04)
                    Name (HDMM, 0x08)
                    Name (DVIM, 0x10)
                    Name (DONE, Zero)
                    Name (DOSF, One)
                    Name (BRNC, Zero)
                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        Store (GETD (), DISD)
                        Store (One, DONE)
                    }

                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        And (Arg0, 0x03, DOSF)
                        Store (ShiftRight (Arg0, 0x02), BRNC)
                        And (BRNC, One, BRNC)
                    }

                    Name (DODP, Package (0x03)
                    {
                        0x00010100, 
                        0x00010110, 
                        0x0121
                    })
                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        If (LEqual (And (REG0, 0xFFFF), 0x1002))
                        {
                            Store (0x0211, Index (DODP, 0x03))
                        }

                        Return (DODP)
                    }

                    Method (CDCS, 1, NotSerialized)
                    {
                        Store (AVLD, Local0)
                        If (And (Local0, Arg0))
                        {
                            Return (0x1F)
                        }

                        Return (0x1D)
                    }

                    Method (CDGS, 1, NotSerialized)
                    {
                        If (And (NXTD, Arg0))
                        {
                            Return (One)
                        }

                        Return (Zero)
                    }

                    Device (CRTD)
                    {
                        Name (_ADR, 0x0100)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Return (CDCS (CRTM))
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (CDGS (CRTM))
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            If (And (Arg0, 0x40000000))
                            {
                                If (And (Arg0, 0x80000000))
                                {
                                    Store (One, DONE)
                                }
                            }
                        }
                    }

                    Device (DVID)
                    {
                        Method (_ADR, 0, NotSerialized)  // _ADR: Address
                        {
                            If (LEqual (And (REG0, 0xFFFF), 0x1002))
                            {
                                Return (0x0211)
                            }
                            Else
                            {
                                Return (0x0121)
                            }
                        }

                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Return (CDCS (DVIM))
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (CDGS (DVIM))
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            If (And (Arg0, 0x40000000))
                            {
                                If (And (Arg0, 0x80000000))
                                {
                                    Store (One, DONE)
                                }
                            }
                        }
                    }

                    Device (LCDD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                        {
                            Return (CDCS (LCDM))
                        }

                        Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                        {
                            Return (CDGS (LCDM))
                        }

                        Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                        {
                            If (And (Arg0, 0x40000000))
                            {
                                If (And (Arg0, 0x80000000))
                                {
                                    Store (One, DONE)
                                }
                            }
                        }

                        Name (XOPT, Zero)
                        Name (XRGL, 0x02)
                        Name (XRGH, 0x5F)
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (Package (0x60)
                            {
                                0x4A, 
                                0x2C, 
                                0x02, 
                                0x03, 
                                0x04, 
                                0x05, 
                                0x06, 
                                0x07, 
                                0x08, 
                                0x09, 
                                0x0A, 
                                0x0B, 
                                0x0C, 
                                0x0D, 
                                0x0E, 
                                0x0F, 
                                0x10, 
                                0x11, 
                                0x12, 
                                0x13, 
                                0x14, 
                                0x15, 
                                0x16, 
                                0x17, 
                                0x18, 
                                0x19, 
                                0x1A, 
                                0x1B, 
                                0x1C, 
                                0x1D, 
                                0x1E, 
                                0x1F, 
                                0x20, 
                                0x21, 
                                0x22, 
                                0x23, 
                                0x24, 
                                0x25, 
                                0x26, 
                                0x27, 
                                0x28, 
                                0x29, 
                                0x2A, 
                                0x2B, 
                                0x2C, 
                                0x2D, 
                                0x2E, 
                                0x2F, 
                                0x30, 
                                0x31, 
                                0x32, 
                                0x33, 
                                0x34, 
                                0x35, 
                                0x36, 
                                0x37, 
                                0x38, 
                                0x39, 
                                0x3A, 
                                0x3B, 
                                0x3C, 
                                0x3D, 
                                0x3E, 
                                0x3F, 
                                0x40, 
                                0x41, 
                                0x42, 
                                0x43, 
                                0x44, 
                                0x45, 
                                0x46, 
                                0x47, 
                                0x48, 
                                0x49, 
                                0x4A, 
                                0x4B, 
                                0x4C, 
                                0x4D, 
                                0x4E, 
                                0x4F, 
                                0x50, 
                                0x51, 
                                0x52, 
                                0x53, 
                                0x54, 
                                0x55, 
                                0x56, 
                                0x57, 
                                0x58, 
                                0x59, 
                                0x5A, 
                                0x5B, 
                                0x5C, 
                                0x5D, 
                                0x5E, 
                                0x5F
                            })
                        }

                        Method (XBCM, 1, NotSerialized)
                        {
                            Alias (^^^^LPCB.EC.PWAC, PWAC)
                            If (LGreater (Arg0, XRGH))
                            {
                                Store (XRGH, Arg0)
                            }

                            If (LAnd (Arg0, LLess (Arg0, XRGL)))
                            {
                                Store (XRGL, Arg0)
                            }

                            Store (SizeOf (PWAC), Local0)
                            While (Local0)
                            {
                                Decrement (Local0)
                                Store (DerefOf (Index (PWAC, Local0)), Local1)
                                If (LGreaterEqual (Arg0, Local1))
                                {
                                    Store (Local0, Local2)
                                    Break
                                }
                            }

                            SNVS (0x4498, Local2)
                            ^^^^LPCB.EC.ECBR (Arg0)
                        }

                        Method (XBQC, 0, NotSerialized)
                        {
                            Store (^^^^LPCB.EC.SC00, Local0)
                            If (LGreater (Local0, XRGH))
                            {
                                Store (XRGH, Local0)
                            }

                            If (LAnd (Local0, LLess (Local0, XRGL)))
                            {
                                Store (XRGL, Local0)
                            }

                            Return (Local0)
                        }
                    }

                    Method (SWHD, 1, Serialized)
                    {
                        If (LEqual (DOSF, One))
                        {
                            Store (Arg0, PAR1)
                            ISMI (0x73)
                        }
                        Else
                        {
                            Store (Zero, DONE)
                            Notify (IGPU, 0x80)
                            Store (0x01F4, Local0)
                            While (Local0)
                            {
                                If (DONE)
                                {
                                    Store (Zero, Local0)
                                }
                                Else
                                {
                                    Sleep (0x0A)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Store (One, DONE)
                    }

                    Method (GETD, 0, NotSerialized)
                    {
                        ISMI (0x72)
                        Store (PAR1, Local0)
                        Return (Local0)
                    }

                    Method (GETM, 0, NotSerialized)
                    {
                        Return (Zero)
                    }

                    Method (GETN, 0, Serialized)
                    {
                        If (DONE)
                        {
                            Store (GETD (), DISD)
                            Store (GETM (), Local0)
                            If (LEqual (Local0, One))
                            {
                                Return (NXTD)
                            }
                        }

                        Store (Zero, DONE)
                        Increment (NXTD)
                        If (LGreater (NXTD, 0x1F))
                        {
                            Store (One, NXTD)
                        }

                        While (LOr (CHKL (), CHKA ()))
                        {
                            Increment (NXTD)
                            If (LGreater (NXTD, 0x1F))
                            {
                                Store (One, NXTD)
                            }
                        }

                        Return (NXTD)
                    }

                    Name (LMTD, Package (0x13)
                    {
                        0x07, 
                        0x0B, 
                        0x0D, 
                        0x0E, 
                        0x0F, 
                        0x13, 
                        0x15, 
                        0x16, 
                        0x17, 
                        0x19, 
                        0x1A, 
                        0x1B, 
                        0x1C, 
                        0x1D, 
                        0x1E, 
                        0x1F, 
                        0x03, 
                        0x09, 
                        0x0A
                    })
                    Method (CHKL, 0, Serialized)
                    {
                        Store (Zero, Local0)
                        While (LLess (Local0, 0x10))
                        {
                            If (LEqual (DerefOf (Index (LMTD, Local0)), NXTD))
                            {
                                Return (One)
                            }

                            Increment (Local0)
                        }

                        Return (Zero)
                    }

                    Method (CHKA, 0, Serialized)
                    {
                        Store (NXTD, Local0)
                        And (Local0, AVLD, Local0)
                        If (LEqual (Local0, NXTD))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (One)
                        }
                    }
                }
            }

            Device (XVR0)
            {
                Name (_ADR, 0x000C0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x11, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR03)
                    }

                    Return (PR03)
                }

                Device (XVS0)
                {
                    Name (_ADR, 0xFFFF)  // _ADR: Address
                }
            }

            Device (P0P5)
            {
                Name (_ADR, 0x000E0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x11, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR05)
                    }

                    Return (PR05)
                }
            }

            Device (P0P6)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x11, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR06)
                    }

                    Return (PR06)
                }
            }

            Device (RP05)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x11, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR07)
                    }

                    Return (PR07)
                }

                Device (ARPT)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (P0P8)
            {
                Name (_ADR, 0x00170000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x11, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR08)
                    }

                    Return (PR08)
                }
            }

            Device (RP06)
            {
                Name (_ADR, 0x00180000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x11, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR09)
                    }

                    Return (PR09)
                }

                Device (GIGE)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (XVR1)
            {
                Name (_ADR, 0x000D0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x11, 
                        0x04
                    })
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        Return (AR04)
                    }

                    Return (PR04)
                }

                Device (XVS1)
                {
                    Name (_ADR, 0xFFFF)  // _ADR: Address
                }
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (One)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        Zero
                    })
                }

                Device (HUB1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                    }
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x00040001)  // _ADR: Address
                OperationRegion (P020, PCI_Config, 0x49, One)
                Field (P020, AnyAcc, NoLock, Preserve)
                {
                    U0WK,   1
                }

                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (One)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (One)
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (One, U0WK)
                    }
                    Else
                    {
                        Store (Zero, U0WK)
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x05, 
                        Zero
                    })
                }

                Device (HUB1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (One)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x18, 
                        Zero
                    })
                }

                Device (HUB1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x00060001)  // _ADR: Address
                OperationRegion (P020, PCI_Config, 0x49, One)
                Field (P020, AnyAcc, NoLock, Preserve)
                {
                    U0WK,   1
                }

                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (One)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (One)
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (One, U0WK)
                    }
                    Else
                    {
                        Store (Zero, U0WK)
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (Package (0x02)
                    {
                        0x17, 
                        Zero
                    })
                }

                Device (HUB1)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            0xFF, 
                            Zero, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                    }

                    Device (PRT4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            Zero, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            Buffer (0x10)
                            {
                                /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                /* 0008 */   0x31, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
                                /*           Revision : 01     */
                                /*        IgnoreColor : 01     */
                                /*              Color : 000000 */
                                /*              Width : 0000   */
                                /*             Height : 0000   */
                                /*        UserVisible : 01     */
                                /*               Dock : 00     */
                                /*                Lid : 00     */
                                /*              Panel : 06     */
                                /*   VerticalPosition : 00     */
                                /* HorizontalPosition : 00     */
                                /*              Shape : 04     */
                                /*   GroupOrientation : 00     */
                                /*         GroupToken : 00     */
                                /*      GroupPosition : 00     */
                                /*                Bay : 00     */
                                /*          Ejectable : 01     */
                                /*  OspmEjectRequired : 01     */
                                /*      CabinetNumber : 00     */
                                /*     CardCageNumber : 00     */
                                /*          Reference : 00     */
                                /*           Rotation : 00     */
                                /*              Order : 00     */
                                /*     VerticalOffset : 0000   */
                                /*   HorizontalOffset : 0000   */
                            }
                        })
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (Zero)
                        }
                    }
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.SBUS, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L00, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.PBB0, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L15, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                If (LAnd (\_SB.PCI0.HDEF.PMEN, \_SB.PCI0.HDEF.PMST))
                {
                    Store (One, \_SB.PCI0.HDEF.PMST)
                    Store (Zero, \_SB.PCI0.HDEF.PMEN)
                    Notify (\_SB.PCI0.HDEF, 0x02)
                }

                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L11, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.XVR0, 0x02)
                Notify (\_SB.PCI0.P0P5, 0x02)
                Notify (\_SB.PCI0.P0P6, 0x02)
                Notify (\_SB.PCI0.RP05, 0x02)
                Notify (\_SB.PCI0.P0P8, 0x02)
                Notify (\_SB.PCI0.RP06, 0x02)
                Notify (\_SB.PCI0.XVR1, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.OHC1, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L05, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.EHC1, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L18, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.OHC2, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }

            Method (_L17, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.EHC2, 0x02)
                Notify (\_SB.PWRB, 0x02)
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, ICRS)
        Method (LSTA, 1, NotSerialized)
        {
            If (Arg0)
            {
                Return (0x0B)
            }
            Else
            {
                Return (0x09)
            }
        }

        Method (LPRS, 2, NotSerialized)
        {
            If (PICM)
            {
                Return (Arg1)
            }
            Else
            {
                Return (Arg0)
            }
        }

        Method (LCRS, 1, NotSerialized)
        {
            If (PICM)
            {
                Name (BUFB, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y12)
                    {
                        0x00000011,
                    }
                })
                CreateDWordField (BUFB, \_SB.LCRS._Y12._INT, AIRQ)  // _INT: Interrupts
                Store (Arg0, AIRQ)
                If (LEqual (Arg0, One))
                {
                    Store (0x17, AIRQ)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x16, AIRQ)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (0x15, AIRQ)
                }

                If (LEqual (Arg0, 0x08))
                {
                    Store (0x14, AIRQ)
                }

                If (LEqual (Arg0, 0x0C))
                {
                    Store (0x13, AIRQ)
                }

                If (LEqual (Arg0, 0x06))
                {
                    Store (0x12, AIRQ)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Store (0x11, AIRQ)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (0x10, AIRQ)
                }

                If (LEqual (Arg0, 0x0F))
                {
                    Store (0x0F, AIRQ)
                }

                If (LEqual (Arg0, 0x0E))
                {
                    Store (0x0E, AIRQ)
                }

                If (LEqual (Arg0, 0x0B))
                {
                    Store (0x0B, AIRQ)
                }

                If (LEqual (Arg0, 0x0A))
                {
                    Store (0x0A, AIRQ)
                }

                If (LEqual (Arg0, 0x09))
                {
                    Store (0x09, AIRQ)
                }

                If (LEqual (Arg0, 0x07))
                {
                    Store (0x07, AIRQ)
                }

                If (LEqual (Arg0, 0x05))
                {
                    Store (0x05, AIRQ)
                }

                Return (BUFB)
            }
            Else
            {
                ShiftLeft (One, Arg0, ICRS)
                Return (BUFA)
            }
        }

        Method (LCRO, 1, NotSerialized)
        {
            If (PICM)
            {
                Name (BUFB, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, _Y13)
                    {
                        0x00000014,
                    }
                })
                CreateDWordField (BUFB, \_SB.LCRO._Y13._INT, AIRQ)  // _INT: Interrupts
                Store (Arg0, AIRQ)
                If (LEqual (Arg0, One))
                {
                    Store (0x17, AIRQ)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x16, AIRQ)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (0x15, AIRQ)
                }

                If (LEqual (Arg0, 0x08))
                {
                    Store (0x14, AIRQ)
                }

                If (LEqual (Arg0, 0x0C))
                {
                    Store (0x13, AIRQ)
                }

                If (LEqual (Arg0, 0x06))
                {
                    Store (0x12, AIRQ)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Store (0x11, AIRQ)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (0x10, AIRQ)
                }

                If (LEqual (Arg0, 0x0F))
                {
                    Store (0x0F, AIRQ)
                }

                If (LEqual (Arg0, 0x0E))
                {
                    Store (0x0E, AIRQ)
                }

                If (LEqual (Arg0, 0x0B))
                {
                    Store (0x0B, AIRQ)
                }

                If (LEqual (Arg0, 0x0A))
                {
                    Store (0x0A, AIRQ)
                }

                If (LEqual (Arg0, 0x09))
                {
                    Store (0x09, AIRQ)
                }

                If (LEqual (Arg0, 0x07))
                {
                    Store (0x07, AIRQ)
                }

                If (LEqual (Arg0, 0x05))
                {
                    Store (0x05, AIRQ)
                }

                Return (BUFB)
            }
            Else
            {
                ShiftLeft (One, Arg0, ICRS)
                Return (BUFA)
            }
        }

        Method (LSRS, 1, NotSerialized)
        {
            If (PICM)
            {
                CreateByteField (Arg0, 0x05, SAIR)
                Store (SAIR, Local0)
                If (LEqual (Local0, 0x17))
                {
                    Store (One, Local0)
                }

                If (LEqual (Local0, 0x16))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (Local0, 0x15))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (Local0, 0x14))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (Local0, 0x13))
                {
                    Store (0x0C, Local0)
                }

                If (LEqual (Local0, 0x12))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (Local0, 0x11))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (Local0, 0x10))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x0F, Local0)
                }

                If (LEqual (Local0, 0x0E))
                {
                    Store (0x0E, Local0)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (Local0, 0x0A))
                {
                    Store (0x0A, Local0)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x05, Local0)
                }

                Return (Local0)
            }
            Else
            {
                CreateWordField (Arg0, One, ISRS)
                FindSetRightBit (ISRS, Local0)
                Return (Decrement (Local0))
            }
        }

        Method (LSRO, 1, NotSerialized)
        {
            If (PICM)
            {
                CreateByteField (Arg0, 0x05, SAIR)
                Store (SAIR, Local0)
                If (LEqual (Local0, 0x17))
                {
                    Store (One, Local0)
                }

                If (LEqual (Local0, 0x16))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (Local0, 0x15))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (Local0, 0x14))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (Local0, 0x13))
                {
                    Store (0x0C, Local0)
                }

                If (LEqual (Local0, 0x12))
                {
                    Store (0x06, Local0)
                }

                If (LEqual (Local0, 0x11))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (Local0, 0x10))
                {
                    Store (0x03, Local0)
                }

                If (LEqual (Local0, 0x0F))
                {
                    Store (0x0F, Local0)
                }

                If (LEqual (Local0, 0x0E))
                {
                    Store (0x0E, Local0)
                }

                If (LEqual (Local0, 0x0B))
                {
                    Store (0x0B, Local0)
                }

                If (LEqual (Local0, 0x0A))
                {
                    Store (0x0A, Local0)
                }

                If (LEqual (Local0, 0x09))
                {
                    Store (0x09, Local0)
                }

                If (LEqual (Local0, 0x07))
                {
                    Store (0x07, Local0)
                }

                If (LEqual (Local0, 0x05))
                {
                    Store (0x05, Local0)
                }

                Return (Local0)
            }
            Else
            {
                CreateWordField (Arg0, One, ISRS)
                FindSetRightBit (ISRS, Local0)
                Return (Decrement (Local0))
            }
        }

        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PIRA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PIRA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.PIRA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.PIRA)
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PIRB))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PIRB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.PIRB))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.PIRB)
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PIRC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PIRC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.PIRC))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.PIRC)
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PIRD))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PIRD)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.PIRD))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.PIRD)
            }
        }

        Device (LN0A)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P0EA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P0EA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P0EA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P0EA)
            }
        }

        Device (LN0B)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P0EB))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P0EB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P0EB))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P0EB)
            }
        }

        Device (LN0C)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P0EC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P0EC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P0EC))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P0EC)
            }
        }

        Device (LN0D)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P0ED))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P0ED)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P0ED))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P0ED)
            }
        }

        Device (LN1A)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x09)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P1EA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P1EA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P1EA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P1EA)
            }
        }

        Device (LN1B)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x0A)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P1EB))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P1EB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P1EB))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P1EB)
            }
        }

        Device (LN1C)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x0B)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P1EC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P1EC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P1EC))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P1EC)
            }
        }

        Device (LN1D)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x0C)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P1ED))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P1ED)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P1ED))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P1ED)
            }
        }

        Device (LN2A)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x0D)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P2EA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P2EA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P2EA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P2EA)
            }
        }

        Device (LN2B)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x0E)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P2EB))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P2EB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P2EB))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P2EB)
            }
        }

        Device (LN2C)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x0F)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P2EC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P2EC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P2EC))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P2EC)
            }
        }

        Device (LN2D)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x10)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P2ED))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P2ED)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P2ED))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P2ED)
            }
        }

        Device (LN3A)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x11)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P3EA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P3EA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P3EA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P3EA)
            }
        }

        Device (LN3B)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x12)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P3EB))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P3EB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P3EB))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P3EB)
            }
        }

        Device (LN3C)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x13)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P3EC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P3EC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P3EC))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P3EC)
            }
        }

        Device (LN3D)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x14)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P3ED))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P3ED)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P3ED))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P3ED)
            }
        }

        Device (LN4A)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x15)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P4EA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P4EA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P4EA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P4EA)
            }
        }

        Device (LN4B)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x16)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P4EB))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P4EB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P4EB))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P4EB)
            }
        }

        Device (LN4C)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x17)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P4EC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P4EC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P4EC))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P4EC)
            }
        }

        Device (LN4D)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x18)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P4ED))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P4ED)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P4ED))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P4ED)
            }
        }

        Device (LN5A)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x19)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P5EA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P5EA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P5EA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P5EA)
            }
        }

        Device (LN5B)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x1A)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P5EB))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P5EB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P5EB))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P5EB)
            }
        }

        Device (LN5C)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x1B)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P5EC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P5EC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P5EC))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P5EC)
            }
        }

        Device (LN5D)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x1B)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P5ED))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P5ED)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P5ED))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P5ED)
            }
        }

        Device (LN6A)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x1C)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P6EA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSA, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P6EA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P6EA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P6EA)
            }
        }

        Device (LN6B)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x1D)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P6EB))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSB, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P6EB)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P6EB))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P6EB)
            }
        }

        Device (LN6C)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x1E)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P6EC))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSC, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P6EC)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P6EC))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P6EC)
            }
        }

        Device (LN6D)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x1F)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.P6ED))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (PRSD, RSIR))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.P6ED)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.P6ED))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.P6ED)
            }
        }

        Device (LUB0)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x24)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PIU0))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSB0, RSU1))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PIU0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.PIU0))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PIU0)
            }
        }

        Device (LUB2)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x25)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PIU2))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSB2, RSI1))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PIU2)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.PIU2))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PIU2)
            }
        }

        Device (LMAC)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x26)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PILN))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSAC, RSMA))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PILN)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.PILN))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PILN)
            }
        }

        Device (LAZA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x27)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PAZA))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSZA, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PAZA)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.PAZA))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PAZA)
            }
        }

        Device (SGRU)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x28)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.GPUR))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSRU, RSIG))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.GPUR)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.GPUR))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.GPUR)
            }
        }

        Device (LSMB)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x29)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PIRM))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSMB, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PIRM)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.PIRM))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PIRM)
            }
        }

        Device (LPMU)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2A)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PMUD))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSMU, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PMUD)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.PMUD))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PMUD)
            }
        }

        Device (LSA0)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2B)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PIID))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSA0, RSSA))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PIID)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.PIID))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PIID)
            }
        }

        Device (LATA)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2C)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.PR0E))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSTA, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.PR0E)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (OSFL ())
                {
                    Return (Buffer (One)
                    {
                         0x00
                    })
                }
                Else
                {
                    Return (LCRO (^^PCI0.IMAP.PR0E))
                }
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.PR0E)
            }
        }

        Device (UB11)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2D)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.UBR1))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RS11, RSU2))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.UBR1)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.UBR1))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.UBR1)
            }
        }

        Device (UB12)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2E)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.UBR2))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RS12, RSI2))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.UBR2)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRO (^^PCI0.IMAP.UBR2))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRO (Arg0), ^^PCI0.IMAP.UBR2)
            }
        }

        Device (LRP0)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2B)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.XVE0))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSP0, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.XVE0)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.XVE0))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE0)
            }
        }

        Device (LRP1)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2C)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.XVE1))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSP1, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.XVE1)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.XVE1))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE1)
            }
        }

        Device (LRP2)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2D)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.XVE2))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSP2, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.XVE2)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.XVE2))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE2)
            }
        }

        Device (LRP3)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2E)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.XVE3))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSP3, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.XVE3)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.XVE3))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE3)
            }
        }

        Device (LRP4)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x2F)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.XVE4))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSP4, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.XVE4)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.XVE4))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE4)
            }
        }

        Device (LRP5)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x30)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.XVE5))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSP5, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.XVE5)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.XVE5))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE5)
            }
        }

        Device (LRP6)
        {
            Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
            Name (_UID, 0x31)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (LSTA (^^PCI0.IMAP.XVE6))
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (LPRS (RSP6, RSII))
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                Store (Zero, ^^PCI0.IMAP.XVE6)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (LCRS (^^PCI0.IMAP.XVE6))
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                Store (LSRS (Arg0), ^^PCI0.IMAP.XVE6)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        OperationRegion (HDCP, SystemMemory, 0x6FF9E0E4, 0x0260)
        Field (HDCP, AnyAcc, NoLock, Preserve)
        {
            SIGN,   48, 
            CHKS,   8, 
            RESR,   8, 
            GLOB,   4800
        }

        Alias (GLOB, HDCB)
    }

    Alias (DBG8, DBUG)
    Scope (_SB.PCI0)
    {
        Name (NVVR, "MCP79 NVACPI 4/20/2009 2:22:43 PM")
        OperationRegion (P88R, PCI_Config, 0x88, 0x04)
        Field (P88R, ByteAcc, NoLock, Preserve)
        {
            CCEC,   11
        }

        Method (GPXX, 0, NotSerialized)
        {
            Multiply (CCEC, 0x02000000, Local0)
            Return (Local0)
        }

        Method (CMPB, 2, NotSerialized)
        {
            Store (SizeOf (Arg0), Local1)
            If (LNotEqual (Local1, SizeOf (Arg1)))
            {
                Return (Zero)
            }

            Store (Zero, Local0)
            While (LLess (Local0, Local1))
            {
                If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (
                    Arg1, Local0))))
                {
                    Return (Zero)
                }

                Increment (Local0)
            }

            Return (One)
        }

        Scope (\_SB.PCI0)
        {
            Method (GPC0, 0, NotSerialized)
            {
                Add (GPXX (), 0x0001B000, Local0)
                Return (Local0)
            }

            Method (GPC1, 0, NotSerialized)
            {
                Add (GPXX (), 0xB000, Local0)
                Return (Local0)
            }

            Method (GPC2, 0, NotSerialized)
            {
                Add (GPXX (), 0xC000, Local0)
                Return (Local0)
            }

            Method (GPC3, 0, NotSerialized)
            {
                Add (GPXX (), 0xE100, Local0)
                Return (Local0)
            }

            OperationRegion (P4MR, SystemMemory, GPC0 (), 0xFF)
            Field (P4MR, ByteAcc, NoLock, Preserve)
            {
                Offset (0x44), 
                BPLM,   8, 
                    ,   1, 
                BPLN,   8, 
                    ,   9, 
                BPLP,   2, 
                Offset (0x74), 
                    ,   18, 
                VCO2,   1, 
                    ,   8, 
                ASYC,   1, 
                Offset (0x78), 
                CPLM,   8, 
                CPLN,   8, 
                Offset (0xC8), 
                MPLM,   4, 
                MPLN,   4
            }

            OperationRegion (OA8D, SystemMemory, GPC1 (), 0xFF)
            Field (OA8D, ByteAcc, NoLock, Preserve)
            {
                Offset (0x50), 
                NIST,   10, 
                    ,   2, 
                NSB1,   4, 
                NSB2,   4, 
                Offset (0x8C), 
                TRFC,   10, 
                Offset (0x8F), 
                TRCD,   4, 
                WRRC,   4, 
                Offset (0x91), 
                TR2P,   4, 
                Offset (0x9C), 
                Offset (0x9D), 
                TRP,    4, 
                Offset (0xA0), 
                Offset (0xA2), 
                TRC,    6, 
                Offset (0xA8), 
                TROE,   1, 
                    ,   3, 
                TROI,   3, 
                Offset (0xF4), 
                BWCP,   7, 
                Offset (0xF5), 
                BWIS,   7, 
                Offset (0xF6), 
                BWWB,   7, 
                Offset (0xF7), 
                BWHP,   7, 
                HPCR,   1
            }

            OperationRegion (O8ER, SystemMemory, GPC2 (), 0xFF)
            Field (O8ER, ByteAcc, NoLock, Preserve)
            {
                Offset (0x70), 
                CDP0,   1, 
                Offset (0x71), 
                CDS0,   8, 
                    ,   4, 
                CDC0,   4, 
                    ,   5, 
                CDB0,   2, 
                Offset (0x74), 
                CDP1,   1, 
                Offset (0x75), 
                CDS1,   8, 
                    ,   4, 
                CDC1,   4, 
                    ,   5, 
                CDB1,   2, 
                Offset (0x78), 
                CDP2,   1, 
                Offset (0x79), 
                CDS2,   8, 
                    ,   4, 
                CDC2,   4, 
                    ,   5, 
                CDB2,   2, 
                Offset (0x7C), 
                CDP3,   1, 
                Offset (0x7D), 
                CDS3,   8, 
                    ,   4, 
                CDC3,   4, 
                    ,   5, 
                CDB3,   2, 
                Offset (0x80), 
                INTL,   2, 
                RCBD,   2, 
                Offset (0x81), 
                PCIH,   5, 
                Offset (0x88), 
                TOM1,   8, 
                TOM2,   9, 
                Offset (0x90), 
                P0P0,   1, 
                P1P0,   1, 
                P0N0,   1, 
                P1N0,   1, 
                PCR0,   1, 
                Offset (0x91), 
                PCB0,   9, 
                Offset (0x93), 
                PCS0,   8, 
                P0P1,   1, 
                P1P1,   1, 
                P0N1,   1, 
                P1N1,   1, 
                PCR1,   1, 
                Offset (0x95), 
                PCB1,   9, 
                Offset (0x97), 
                PCS1,   8, 
                P0P2,   1, 
                P1P2,   1, 
                P0N2,   1, 
                P1N2,   1, 
                PCR2,   1, 
                Offset (0x99), 
                PCB2,   9, 
                Offset (0x9B), 
                PCS2,   8, 
                P0P3,   1, 
                P1P3,   1, 
                P0N3,   1, 
                P1N3,   1, 
                PCR3,   1, 
                Offset (0x9D), 
                PCB3,   9, 
                Offset (0x9F), 
                PCS3,   8, 
                P0P4,   1, 
                P1P4,   1, 
                P0N4,   1, 
                P1N4,   1, 
                PCR4,   1, 
                Offset (0xA1), 
                PCB4,   9, 
                Offset (0xA3), 
                PCS4,   8, 
                Offset (0xC4), 
                REFP,   16, 
                REFB,   4
            }

            OperationRegion (OEER, SystemMemory, GPC3 (), 0xFF)
            Field (OEER, ByteAcc, NoLock, Preserve)
            {
                Offset (0xAA), 
                CKDY,   16
            }

            Method (CIMP, 0, NotSerialized)
            {
                Name (BU2A, Buffer (0x04)
                {
                     0x00
                })
                CreateField (BU2A, 0x10, 0x04, BF03)
                CreateField (BU2A, 0x14, 0x04, BF04)
                Name (BU2B, Buffer (0x04)
                {
                     0x00
                })
                CreateField (BU2B, Zero, 0x0B, BF07)
                CreateField (BU2B, 0x0B, 0x0E, BF08)
                Name (BU2C, Buffer (0x0A)
                {
                     0x00
                })
                CreateField (BU2C, Zero, 0x03, BF0A)
                CreateField (BU2C, 0x03, 0x04, BF0B)
                CreateField (BU2C, 0x07, 0x04, BF0C)
                CreateField (BU2C, 0x0B, 0x04, BF0D)
                CreateField (BU2C, 0x0F, 0x04, BF0E)
                CreateField (BU2C, 0x13, 0x26, BF0F)
                Name (BU2D, Buffer (0x0A)
                {
                     0x00
                })
                CreateField (BU2D, Zero, 0x10, BF1A)
                CreateField (BU2D, 0x10, 0x0B, TAVN)
                CreateField (BU2D, 0x1B, 0x0A, BASL)
                CreateField (BU2D, 0x25, 0x0B, LBWF)
                CreateField (BU2D, 0x30, 0x0C, ATBW)
                CreateField (BU2D, 0x3C, 0x0A, CLTF)
                CreateField (BU2D, 0x46, 0x0A, PMPF)
                Name (BNKN, Zero)
                Name (BNKX, Zero)
                Name (COLN, Zero)
                Name (COLX, Zero)
                Store (0x10, Index (BU2A, Zero))
                Store (0x08, Index (BU2A, One))
                Store (0x12, Index (BU2A, 0x02))
                Store (0xAA, Index (BU2A, 0x03))
                Store (0x02, BF04)
                Name (M2CL, Zero)
                Store (GM2C (), M2CL)
                Multiply (M2CL, 0x02, BF08)
                Store (BASM (M2CL), BF07)
                Store (BU2B, Local2)
                If (LEqual (RCBD, Zero))
                {
                    Store (One, BF03)
                    Multiply (0x08000000, TOM1, BF0F)
                    Store (One, BF0A)
                    If (INTL)
                    {
                        Store (0x02, BF0A)
                    }

                    If (CDP0)
                    {
                        Store (CDC0, BF0D)
                        Store (CDB0, BF0B)
                    }
                    Else
                    {
                        If (CDP1)
                        {
                            Store (CDC1, BF0D)
                            Store (CDB1, BF0B)
                        }
                        Else
                        {
                            If (CDP2)
                            {
                                Store (CDC2, BF0D)
                                Store (CDB2, BF0B)
                            }
                            Else
                            {
                                If (CDP3)
                                {
                                    Store (CDC3, BF0D)
                                    Store (CDB3, BF0B)
                                }
                            }
                        }
                    }

                    Store (BF0D, BF0E)
                    Store (BF0B, BF0C)
                    Store (Local2, Local1)
                    Concatenate (Local1, BU2C, Local2)
                    If (PCIH)
                    {
                        Store (0x02, BF03)
                        Subtract (TOM2, 0x20, Local1)
                        Multiply (0x08000000, Local1, BF0F)
                        Store (Local2, Local1)
                        Concatenate (Local1, BU2C, Local2)
                    }
                }
                Else
                {
                    If (LEqual (RCBD, 0x02))
                    {
                        Name (NDRE, Zero)
                        Store (Zero, BF03)
                        Store (Zero, Local6)
                        While (One)
                        {
                            If (LEqual (Local6, 0x05))
                            {
                                Break
                            }

                            If (LOr (MP0P (Local6), MP1P (Local6)))
                            {
                                Multiply (MCRS (Local6), 0x08000000, BF0F)
                                Store (One, BF0A)
                                If (MPCR (Local6))
                                {
                                    If (MP0P (Local6))
                                    {
                                        If (MP1P (Local6))
                                        {
                                            Store (0x02, BF0A)
                                        }
                                    }
                                }

                                Store (0x03, BNKN)
                                Store (0x02, BNKX)
                                Store (0x0C, COLN)
                                Store (0x08, COLX)
                                If (MP0P (Local6))
                                {
                                    Store (MP0N (Local6), Local5)
                                }
                                Else
                                {
                                    If (MP1P (Local6))
                                    {
                                        Store (MP1N (Local6), Local5)
                                    }
                                }

                                If (LGreater (BNKN, MCDB (Local5)))
                                {
                                    Store (MCDB (Local5), BNKN)
                                }

                                If (LLess (BNKX, MCDB (Local5)))
                                {
                                    Store (MCDB (Local5), BNKX)
                                }

                                If (LGreater (COLN, MCDC (Local5)))
                                {
                                    Store (MCDC (Local5), COLN)
                                }

                                If (LLess (COLX, MCDC (Local5)))
                                {
                                    Store (MCDC (Local5), COLX)
                                }

                                Store (BNKN, BF0B)
                                Store (BNKX, BF0C)
                                Store (COLN, BF0D)
                                Store (COLX, BF0E)
                                Increment (NDRE)
                                Store (Local2, Local1)
                                Concatenate (Local1, BU2C, Local2)
                            }

                            Increment (Local6)
                        }

                        Store (NDRE, BF03)
                    }
                    Else
                    {
                        Store (Zero, Local5)
                    }
                }

                Store (BASM (M2CL), BASL)
                Store (BASL, TAVN)
                Store (PMPM (M2CL), PMPF)
                Store (CLTM (M2CL), CLTF)
                Store (ATBM (M2CL), ATBW)
                Store (0x0FFF, LBWF)
                Store (0x3E, BF1A)
                Store (Local2, Local1)
                Concatenate (Local1, BU2D, Local2)
                Store (0xFFFF, BF1A)
                Store (ATBM (M2CL), ATBW)
                Store (0x0FFF, LBWF)
                Store (Local2, Local1)
                Concatenate (Local1, BU2D, Local2)
                Concatenate (BU2A, Local2, Local0)
                Return (Local0)
            }

            Method (MP0P, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (P0P0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (P0P1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (P0P2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (P0P3)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Return (P0P4)
                }

                Return (Zero)
            }

            Method (MP1P, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (P1P0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (P1P1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (P1P2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (P1P3)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Return (P1P4)
                }

                Return (Zero)
            }

            Method (MPCR, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (PCR0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (PCR1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (PCR2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (PCR3)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Return (PCR4)
                }

                Return (Zero)
            }

            Method (MP0N, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (P0N0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (P0N1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (P0N2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (P0N3)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Return (P0N4)
                }

                Return (Zero)
            }

            Method (MP1N, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (P1N0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (P1N1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (P1N2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (P1N3)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Return (P1N4)
                }

                Return (Zero)
            }

            Method (MCRB, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (PCB0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (PCB1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (PCB2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (PCB3)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Return (PCB4)
                }

                Return (Zero)
            }

            Method (MCRS, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (PCS0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (PCS1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (PCS2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (PCS3)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Return (PCS4)
                }

                Return (Zero)
            }

            Method (MCDB, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (CDB0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (CDB1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (CDB2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (CDB3)
                }

                Return (Zero)
            }

            Method (MCDC, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (CDC0)
                }

                If (LEqual (Arg0, One))
                {
                    Return (CDC1)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (CDC2)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (CDC3)
                }

                Return (Zero)
            }

            Method (NOCH, 0, NotSerialized)
            {
                If (LEqual (INTL, 0x03))
                {
                    Store (0x02, Local6)
                }
                Else
                {
                    If (LEqual (INTL, Zero))
                    {
                        Store (One, Local6)
                    }
                    Else
                    {
                        If (LEqual (INTL, 0x02))
                        {
                            Multiply (CDP0, CDS0, Local0)
                            Multiply (CDP1, CDS1, Local1)
                            Multiply (CDP2, CDS2, Local2)
                            Multiply (CDP3, CDS3, Local3)
                            Add (Local0, Local1, Local0)
                            Add (Local2, Local3, Local2)
                            If (LEqual (Local0, Local2))
                            {
                                Store (0x02, Local6)
                            }
                            Else
                            {
                                Store (One, Local6)
                            }
                        }
                    }
                }

                Return (Local6)
            }

            Method (ATBM, 1, NotSerialized)
            {
                Multiply (Arg0, 0x02, Local0)
                Multiply (Local0, NOCH (), Local0)
                Multiply (0x08, Local0, Local0)
                Multiply (Local0, BWHP, Local0)
                Add (BWCP, BWIS, Local1)
                Add (Local1, BWWB, Local1)
                Add (Local1, BWHP, Local1)
                Divide (Local0, Local1, Local1, Local0)
                Multiply (Local0, 0x03, Local0)
                Divide (Local0, 0x28, Local1, Local0)
                Return (Local0)
            }

            Method (GM2C, 0, NotSerialized)
            {
                Multiply (CPLN, 0x19, Local1)
                Multiply (BPLN, Local1, Local1)
                Add (BPLP, One, Local2)
                Multiply (Local2, CPLM, Local2)
                Multiply (Local2, BPLM, Local2)
                Store (Local1, Local3)
                Multiply (Local3, MPLN, Local1)
                Multiply (Local2, MPLM, Local2)
                Divide (Local1, Local2, , Local3)
                If (LEqual (VCO2, Zero))
                {
                    Multiply (Local3, 0x02, Local3)
                }

                Return (Local3)
            }

            Method (PMPM, 1, NotSerialized)
            {
                Multiply (0x0F, 0x03E8, Local0)
                Divide (Local0, Arg0, Local0, Local1)
                Return (Local1)
            }

            Method (CLTM, 1, NotSerialized)
            {
                Divide (0x04, NOCH (), Local0, Local1)
                Multiply (0x03E8, Local1, Local0)
                Divide (Local0, Arg0, Local0, Local1)
                Return (Local1)
            }

            Method (BASM, 1, NotSerialized)
            {
                Name (M2CK, Zero)
                Name (NPAR, One)
                Store (Arg0, M2CK)
                Name (TPAR, 0x04)
                Divide (TPAR, NPAR, , TPAR)
                Subtract (TPAR, 0x02, TPAR)
                Name (BUCO, Zero)
                Add (TPAR, TRCD, BUCO)
                Add (BUCO, TR2P, BUCO)
                Add (BUCO, TRP, BUCO)
                Name (B2CO, Zero)
                Store (MAX (TRC, BUCO), B2CO)
                Store (CEIL (B2CO, 0x02), B2CO)
                Name (TBM2, Zero)
                If (LEqual (TROE, One))
                {
                    Store (TROI, TBM2)
                }

                Name (TMAX, Zero)
                Add (TMAX, TBM2, TMAX)
                Add (TMAX, BUCO, TMAX)
                Add (TMAX, TPAR, TMAX)
                Store (MAX (TMAX, B2CO), TMAX)
                Name (SWBC, Zero)
                Multiply (TMAX, BWWB, SWBC)
                Multiply (SWBC, NPAR, SWBC)
                Divide (SWBC, 0x02, , SWBC)
                Name (SCPU, Zero)
                Multiply (TMAX, BWCP, SCPU)
                Multiply (SCPU, NPAR, SCPU)
                Divide (SCPU, 0x02, , SCPU)
                Name (SISO, Zero)
                Add (TBM2, BUCO, Local1)
                Add (Local1, NPAR, Local1)
                Subtract (Local1, 0x02, Local1)
                Store (MAX (Local1, B2CO), Local1)
                Multiply (Local1, BWIS, SISO)
                Name (RCBZ, 0x10)
                Name (CBHP, 0x02)
                Name (SHIS, Zero)
                Multiply (RCBZ, 0x04, SHIS)
                Divide (SHIS, NPAR, , SHIS)
                Subtract (SHIS, 0x02, SHIS)
                Add (SHIS, BUCO, SHIS)
                Add (SHIS, TBM2, SHIS)
                Store (MAX (SHIS, B2CO), SHIS)
                Multiply (SHIS, CBHP, SHIS)
                Name (BIDH, One)
                Name (BWCO, Zero)
                Add (SWBC, SCPU, BWCO)
                Add (BWCO, SISO, BWCO)
                Add (BWCO, SHIS, BWCO)
                Multiply (BWCO, BIDH, BWCO)
                Name (NISB, Zero)
                Store (NSB1, NISB)
                ShiftLeft (NSB2, 0x04, Local1)
                Or (Local1, NISB, NISB)
                Name (NICO, Zero)
                Divide (BWCO, NIST, Local2, Local1)
                If (LNotEqual (Local2, Zero))
                {
                    Add (Local1, One, Local1)
                }

                Multiply (NISB, NPAR, Local2)
                Add (TBM2, NPAR, Local3)
                If (LGreater (Local3, 0x02))
                {
                    Subtract (Local3, 0x02, Local3)
                }
                Else
                {
                    Store (Zero, Local3)
                }

                Store (MAX (Local3, B2CO), Local3)
                Multiply (Local2, Local3, NICO)
                Multiply (NICO, Local1, NICO)
                Divide (NICO, 0x02, , NICO)
                Name (RECO, Zero)
                Add (BWCO, NICO, RECO)
                Divide (RECO, REFP, Local2, RECO)
                If (LNotEqual (Local2, Zero))
                {
                    Add (RECO, One, RECO)
                }

                Multiply (RECO, TRFC, RECO)
                Multiply (RECO, REFB, RECO)
                Name (MELA, Zero)
                Add (BWCO, RECO, MELA)
                Add (MELA, NICO, MELA)
                Multiply (MELA, 0x03E8, MELA)
                Divide (MELA, M2CK, , MELA)
                Name (WALA, 0x64)
                Add (WALA, CKDY, WALA)
                Multiply (WALA, 0x07D0, WALA)
                Divide (WALA, M2CK, , WALA)
                If (LLess (WALA, 0x55F0))
                {
                    Store (0x55F0, WALA)
                }

                Name (SWLA, Zero)
                Name (M73L, 0x64)
                Name (PADD, Zero)
                Add (MELA, WALA, Local1)
                Add (Local1, SWLA, Local1)
                Add (Local1, M73L, Local1)
                Add (Local1, PADD, Local1)
                Divide (Local1, 0x64, , Local0)
                Return (Local0)
            }

            Method (MAX, 2, NotSerialized)
            {
                Store (Arg0, Local0)
                If (LGreater (Arg1, Arg0))
                {
                    Store (Arg1, Local0)
                }

                Return (Local0)
            }

            Method (CEIL, 2, NotSerialized)
            {
                Store (Arg0, Local0)
                Divide (Local0, Arg1, Local1, Local3)
                If (LNotEqual (Local1, Zero))
                {
                    Subtract (Local0, Local1, Local0)
                    Add (Local0, Arg1, Local0)
                }

                Return (Local0)
            }
        }

        Scope (IXVE.IGPU)
        {
            Scope (^)
            {
                OperationRegion (PE19, PCI_Config, 0x19, One)
                Field (PE19, ByteAcc, NoLock, Preserve)
                {
                    PSBN,   8
                }
            }

            Method (GBUS, 0, NotSerialized)
            {
                Return (PSBN)
            }

            Name (ERR0, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00
            })
            Name (ERR1, Buffer (0x04)
            {
                 0x01, 0x00, 0x00, 0x80
            })
            Name (ERR2, Buffer (0x04)
            {
                 0x02, 0x00, 0x00, 0x80
            })
            Name (VER1, Buffer (0x04)
            {
                 0x01, 0x00, 0x00, 0x00
            })
            Method (NVIF, 3, NotSerialized)
            {
                Store (ERR2, Local0)
                If (LEqual (Arg0, One))
                {
                    Concatenate (ERR0, VER1, Local0)
                }
                Else
                {
                    If (LEqual (Arg0, 0x0D))
                    {
                        If (LEqual (Arg1, Zero))
                        {
                            Store (ERR0, Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg1, 0x02))
                            {
                                Concatenate (ERR0, CIMP (), Local0)
                            }
                            Else
                            {
                                If (LEqual (Arg1, 0x03))
                                {
                                    Name (BFD1, Buffer (0x06)
                                    {
                                         0x10, 0x06, 0x01, 0x06, 0x00, 0x00
                                    })
                                    CreateField (BFD1, 0x20, 0x10, SVMS)
                                    Store (0x40, SVMS)
                                    Concatenate (ERR0, BFD1, Local0)
                                }
                            }
                        }
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x0C))
                        {
                            If (LEqual (Arg1, Zero))
                            {
                                Store (ERR0, Local0)
                            }
                            Else
                            {
                                If (LEqual (Arg1, One))
                                {
                                    If (CondRefOf (HDCB, Local6))
                                    {
                                        Store (HDCB, Local1)
                                        Concatenate (ERR0, Local1, Local0)
                                    }
                                    Else
                                    {
                                        Store (ERR1, Local0)
                                    }
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x08))
                            {
                                If (LEqual (Arg1, Zero))
                                {
                                    Store (ERR0, Local0)
                                }
                                Else
                                {
                                    If (LEqual (Arg1, One))
                                    {
                                        Store (Buffer (0x04)
                                            {
                                                 0x37, 0x00, 0x05, 0x00
                                            }, Local1)
                                        Concatenate (ERR0, Local1, Local0)
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg1, 0x02))
                                        {
                                            CreateWordField (Arg2, Zero, TEMP)
                                            Store (TEMP, DBUG)
                                            Store (ERR0, Local0)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Return (Local0)
            }
        }
    }

    Scope (_SB)
    {
        Name (XCPD, Zero)
        Name (XNPT, One)
        Name (XCAP, 0x02)
        Name (XDCP, 0x04)
        Name (XDCT, 0x08)
        Name (XDST, 0x0A)
        Name (XLCP, 0x0C)
        Name (XLCT, 0x10)
        Name (XLST, 0x12)
        Name (XSCP, 0x14)
        Name (XSCT, 0x18)
        Name (XSST, 0x1A)
        Name (XRCT, 0x1C)
        Mutex (MUTE, 0x00)
        Method (RBPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (RWPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFE, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (RDPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Release (MUTE)
            Return (XCFG)
        }

        Method (WBPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (WWPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFE, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (WDPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Store (Arg1, XCFG)
            Release (MUTE)
        }

        Method (RWDP, 3, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            And (XCFG, Arg2, Local1)
            Or (Local1, Arg1, XCFG)
            Release (MUTE)
        }

        Method (RPME, 1, NotSerialized)
        {
            Add (Arg0, 0x84, Local0)
            Store (RDPE (Local0), Local1)
            If (LEqual (Local1, Ones))
            {
                Return (Zero)
            }
            Else
            {
                If (LAnd (Local1, 0x00010000))
                {
                    WDPE (Local0, And (Local1, 0x00010000))
                    Return (One)
                }

                Return (Zero)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
        {
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            CreateDWordField (Arg3, Zero, CDW1)
            CreateDWordField (Arg3, 0x04, CDW2)
            CreateDWordField (Arg3, 0x08, CDW3)
            If (LEqual (Arg0, Buffer (0x10)
                    {
                        /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                        /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                    }))
            {
                Store (CDW2, SUPP)
                Store (CDW3, CTRL)
                If (LNotEqual (And (SUPP, 0x16), 0x16))
                {
                    And (CTRL, 0x1E, CTRL)
                }

                If (LNot (PEHP))
                {
                    And (CTRL, 0x1E, CTRL)
                }

                If (LNot (SHPC))
                {
                    And (CTRL, 0x1D, CTRL)
                }

                If (LNot (PEPM))
                {
                    And (CTRL, 0x1B, CTRL)
                }

                If (LNot (PEER))
                {
                    And (CTRL, 0x15, CTRL)
                }

                If (LNot (PECS))
                {
                    And (CTRL, 0x0F, CTRL)
                }

                If (Not (And (CDW1, One)))
                {
                    If (And (CTRL, One)) {}
                    If (And (CTRL, 0x04)) {}
                    If (And (CTRL, 0x10)) {}
                }

                If (LNotEqual (Arg1, One))
                {
                    Or (CDW1, 0x08, CDW1)
                }

                If (LNotEqual (CDW3, CTRL))
                {
                    Or (CDW1, 0x10, CDW1)
                }

                Store (CTRL, CDW3)
                Return (Arg3)
            }
            Else
            {
                Or (CDW1, 0x04, CDW1)
                Return (Arg3)
            }
        }
    }

    Name (FZTF, Buffer (0x07)
    {
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5
    })
    Scope (_SB.PCI0.LPCB)
    {
        Name (CKFG, Package (0x03)
        {
            Package (0x05)
            {
                0x53, 
                0x3F, 
                One, 
                0x03, 
                0x2B
            }, 

            Package (0x05)
            {
                0x2B, 
                0x20, 
                One, 
                0x03, 
                0x2B
            }, 

            Package (0x05)
            {
                0x51, 
                0x3B, 
                One, 
                0x03, 
                0x2B
            }
        })
        Name (CKFN, Package (0x02)
        {
            Package (0x05)
            {
                0x58, 
                0x42, 
                One, 
                0x03, 
                0x2B
            }, 

            Package (0x05)
            {
                0x4C, 
                0x38, 
                One, 
                0x03, 
                0x2B
            }
        })
        Name (CKFC, Package (0x03)
        {
            Package (0x05)
            {
                Zero, 
                One, 
                One, 
                One, 
                0x05
            }, 

            Package (0x05)
            {
                Zero, 
                Zero, 
                One, 
                Zero, 
                0x05
            }, 

            Package (0x05)
            {
                One, 
                Zero, 
                Zero, 
                Zero, 
                0x04
            }
        })
        Method (FSBA, 1, NotSerialized)
        {
            If (LEqual (Arg0, FS70)) {}
            Else
            {
                If (LEqual (Arg0, Zero))
                {
                    Store (0x06, NAID)
                    Store (Zero, CSSE)
                    Store (Zero, NAID)
                }

                If (LGreater (FS70, Arg0))
                {
                    ^EC.ECXW (0xE1, DerefOf (Index (DerefOf (Index (CKFC, Arg0)), 0x02
                        )))
                    Sleep (0x0A)
                    ^EC.ECXW (0xE4, DerefOf (Index (DerefOf (Index (CKFC, Arg0)), 0x03
                        )))
                    Sleep (0x0A)
                    If (^EC.ECAV ())
                    {
                        If (LNot (Acquire (^EC.MUEC, 0xFFFF)))
                        {
                            Store (DerefOf (Index (DerefOf (Index (CKFC, Arg0)), Zero)), 
                                ^EC.SF08)
                            Sleep (0x0A)
                            Store (DerefOf (Index (DerefOf (Index (CKFC, Arg0)), One)), 
                                ^EC.S254)
                            Sleep (0x0A)
                            Release (^EC.MUEC)
                        }
                    }

                    Store (DerefOf (Index (DerefOf (Index (CKFC, Arg0)), 0x04)), 
                        GP53)
                    Store (Zero, CLFG)
                    Sleep (0x0A)
                    If (LEqual (Arg0, Zero))
                    {
                        FSNN (Zero)
                        Sleep (0x32)
                        FSGG (Zero)
                        Sleep (0x32)
                    }
                }

                If (LLess (FS70, Arg0))
                {
                    Store (Zero, CLFG)
                    Sleep (0x0A)
                    If (LEqual (FS70, Zero))
                    {
                        FSNN (Zero)
                        Sleep (0x32)
                        FSGG (One)
                        Sleep (0x32)
                    }

                    ^EC.ECXW (0xE1, DerefOf (Index (DerefOf (Index (CKFC, Arg0)), 0x02
                        )))
                    Sleep (0x0A)
                    ^EC.ECXW (0xE4, DerefOf (Index (DerefOf (Index (CKFC, Arg0)), 0x03
                        )))
                    Sleep (0x0A)
                    If (^EC.ECAV ())
                    {
                        If (LNot (Acquire (^EC.MUEC, 0xFFFF)))
                        {
                            Store (DerefOf (Index (DerefOf (Index (CKFC, Arg0)), Zero)), 
                                ^EC.SF08)
                            Sleep (0x0A)
                            Store (DerefOf (Index (DerefOf (Index (CKFC, Arg0)), One)), 
                                ^EC.S254)
                            Sleep (0x0A)
                            Release (^EC.MUEC)
                        }
                    }

                    Store (DerefOf (Index (DerefOf (Index (CKFC, Arg0)), 0x04)), 
                        GP53)
                }

                If (LNotEqual (Arg0, Zero))
                {
                    Store (0x06, NAID)
                    Store (One, CSSE)
                    Store (Zero, NAID)
                }

                Store (Arg0, FS70)
            }

            Return (One)
        }

        Method (FSGG, 1, NotSerialized)
        {
            Store (DerefOf (Index (DerefOf (Index (CKFG, Arg0)), Zero)), 
                BPLM)
            Sleep (0x0A)
            Store (DerefOf (Index (DerefOf (Index (CKFG, Arg0)), One)), 
                BPLN)
            Sleep (0x0A)
            Store (One, CLFG)
            Sleep (0x0A)
            Store (Zero, CLFG)
            Sleep (0x0A)
        }

        Method (FSNN, 1, NotSerialized)
        {
            Store (DerefOf (Index (DerefOf (Index (CKFN, Arg0)), Zero)), 
                BPLM)
            Sleep (0x0A)
            Store (DerefOf (Index (DerefOf (Index (CKFN, Arg0)), One)), 
                BPLN)
            Sleep (0x0A)
            Store (One, CLFG)
            Sleep (0x0A)
            Store (Zero, CLFG)
            Sleep (0x0A)
        }

        Method (FSBG, 0, Serialized)
        {
            Store (SizeOf (CKFG), Local0)
            Store (SizeOf (Index (CKFG, Zero)), Local1)
            Divide (Local0, Local1, Local0)
            Store (FS70, Local1)
            ShiftLeft (Local0, 0x08, Local0)
            Return (Add (Local0, Local1))
        }
    }

    Scope (\)
    {
        OperationRegion (_SB.PCI0.SGIO, SystemIO, GIOB, 0xFF)
        Field (\_SB.PCI0.SGIO, ByteAcc, NoLock, Preserve)
        {
            Offset (0x03), 
            GP04,   8, 
            GP05,   8, 
            Offset (0x09), 
            GP10,   8, 
            Offset (0x26), 
            GP39,   8, 
            Offset (0x28), 
            GP41,   8, 
            Offset (0x34), 
            GP53,   8, 
            Offset (0x3B), 
            GP60,   8, 
            Offset (0x3D), 
            GP62,   8, 
            GP63,   8
        }

        Field (\_SB.PCI0.P4MR, ByteAcc, NoLock, Preserve)
        {
            Offset (0x44), 
                ,   31, 
            CLFG,   1
        }

        OperationRegion (_SB.PCI0.IONA, SystemIO, 0x4800, 0xFF)
        Field (\_SB.PCI0.IONA, ByteAcc, NoLock, Preserve)
        {
            NAID,   4, 
            Offset (0x5C), 
            UBCL,   8, 
            Offset (0x9C), 
            CSSE,   1
        }

        Method (OWLS, 1, Serialized)
        {
            Store (Arg0, Local0)
            XOr (Local0, One, Local0)
            SNVS (0x1621, Local0)
            If (Arg0)
            {
                Store (0x05, GP62)
                Store (0x04, GP60)
                Sleep (0x03E8)
            }
            Else
            {
                Store (GNVS (0x161C), Local2)
                Store (GNVS (0x1657), Local3)
                XOr (Local3, One, Local3)
                If (Local3)
                {
                    Store (0x04, GP62)
                }
                Else
                {
                    If (Local2)
                    {
                        Store (0x04, GP62)
                    }
                }

                Store (0x05, GP60)
                Sleep (0x64)
            }

            Return (One)
        }

        Method (OWLG, 0, Serialized)
        {
            Store (GNVS (0x1621), Local0)
            XOr (Local0, One, Local0)
            Return (Local0)
        }

        Method (OBTS, 1, Serialized)
        {
            Store (Arg0, Local0)
            XOr (Local0, One, Local0)
            SNVS (0x161C, Local0)
            If (Arg0)
            {
                Store (0x05, GP63)
                Store (GNVS (0x1657), Local2)
                If (Local2)
                {
                    Store (0x05, GP62)
                }

                Sleep (0x03E8)
                Notify (\_SB.PCI0.EHC2, Zero)
                Sleep (0x64)
                Notify (\_SB.PCI0.EHC2, Zero)
            }
            Else
            {
                Store (0x04, GP63)
                Store (GNVS (0x1621), Local2)
                If (Local2)
                {
                    Store (0x04, GP62)
                }

                Sleep (0x64)
                Notify (\_SB.PCI0.EHC2, Zero)
                Sleep (0x64)
                Notify (\_SB.PCI0.EHC2, Zero)
            }

            Return (One)
        }

        Method (OBTG, 0, Serialized)
        {
            If (LNot (And (USBI, 0x02)))
            {
                Return (0x80000002)
            }

            Store (GNVS (0x161C), Local0)
            XOr (Local0, One, Local0)
            Return (Local0)
        }

        Method (OTPS, 1, Serialized)
        {
            If (\_SB.PCI0.LPCB.EC.ETPS (Arg0))
            {
                XOr (Arg0, One, TPLK)
                SNVS (0x161B, TPLK)
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (OTPG, 0, Serialized)
        {
            Store (\_SB.PCI0.LPCB.EC.EG21 (), Local0)
            ShiftRight (Local0, 0x04, Local0)
            XOr (Local0, One, Local0)
            And (Local0, One, Local0)
            Return (Local0)
        }

        Method (OLBS, 1, Serialized)
        {
            \_SB.PCI0.LPCB.EC.ELBS (Arg0)
            Return (One)
        }

        Method (OLBG, 0, Serialized)
        {
            Return (\_SB.PCI0.LPCB.EC.ELBG ())
        }

        Method (OPBS, 1, Serialized)
        {
            \_SB.PCI0.LPCB.EC.STBR ()
            Return (One)
        }

        Method (OPBG, 0, Serialized)
        {
            Return (GNVS (0x4498))
        }
    }

    Scope (\)
    {
        OperationRegion (ECMS, SystemIO, 0x72, 0x02)
        Field (ECMS, ByteAcc, Lock, Preserve)
        {
            EIND,   8, 
            EDAT,   8
        }

        IndexField (EIND, EDAT, ByteAcc, NoLock, Preserve)
        {
            Offset (0x93), 
            LBTN,   4
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Name (CRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, _Y14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y16, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (CRS, \_SB.PCI0._Y14._MIN, MIN5)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y14._MAX, MAX5)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y14._LEN, LEN5)  // _LEN: Length
            CreateDWordField (CRS, \_SB.PCI0._Y15._MIN, MIN6)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y15._MAX, MAX6)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y15._LEN, LEN6)  // _LEN: Length
            CreateDWordField (CRS, \_SB.PCI0._Y16._MIN, MIN7)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y16._MAX, MAX7)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y16._LEN, LEN7)  // _LEN: Length
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Store (MG1L, Local0)
                If (Local0)
                {
                    Store (MG1B, MIN5)
                    Store (MG1L, LEN5)
                    Add (MIN5, Decrement (Local0), MAX5)
                }

                Store (MG2B, MIN6)
                Store (MG2L, LEN6)
                Store (MG2L, Local0)
                Add (MIN6, Decrement (Local0), MAX6)
                Store (MG3B, MIN7)
                Store (MG3L, LEN7)
                Store (MG3L, Local0)
                Add (MIN7, Decrement (Local0), MAX7)
                Return (CRS)
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        Store (Arg0, DBG8)
        PTS (Arg0)
        Store (Zero, Index (WAKP, Zero))
        Store (Zero, Index (WAKP, One))
        If (LAnd (LEqual (Arg0, 0x04), LEqual (OSFL (), 0x02)))
        {
            Sleep (0x0BB8)
        }

        Store (ASSB, WSSB)
        Store (AOTB, WOTB)
        Store (AAXB, WAXB)
        Store (Arg0, ASSB)
        Store (OSFL (), AOTB)
        Store (OSYS (), OSTP)
        Store (Zero, AAXB)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (LOr (LLess (Arg0, One), LGreater (Arg0, 0x05)))
        {
            Store (0x03, Arg0)
        }

        ShiftLeft (Arg0, 0x04, DBG8)
        \_SB.PCI0.SBUS.ENAB ()
        Store (\_SB.PCI0.LPCB.EC.SF13, \_SB.LID0.LIDS)
        WAK (Arg0)
        If (ASSB)
        {
            Store (WSSB, ASSB)
            Store (WOTB, AOTB)
            Store (WAXB, AAXB)
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
        }

        Notify (\_SB.PCI0.EHC1, Zero)
        Notify (\_SB.PCI0.EHC2, Zero)
        Notify (\_SB.PCI0.OHC1, Zero)
        Notify (\_SB.PCI0.OHC2, Zero)
        Notify (\_SB.PCI0.RP05.ARPT, Zero)
        Notify (\_SB.PCI0.RP06.GIGE, Zero)
        Return (WAKP)
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (SS1)
    {
        Name (_S1, Package (0x04)  // _S1_: S1 System State
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.LPCB.EC.EC0S (Arg0)
            \_SB.PCI0.LPCB.SPTS (Arg0)
            LPFS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.LPCB.EC.EC0W (Arg0)
        \_SB.PCI0.LPCB.SWAK (Arg0)
        LPWK (Arg0)
    }
}

