/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20131218-64 [Jan  8 2014]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of iASLZHt7MK.aml, Thu Jul 17 16:59:09 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000148 (328)
 *     Revision         0x02
 *     Checksum         0xFA
 *     OEM ID           "ASUS "
 *     OEM Table ID     "SsdtArpt"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20131218 (538120728)
 */
DefinitionBlock ("SSDT-4.aml", "SSDT", 2, "ASUS ", "SsdtArpt", 0x00001000)
{
    
    External (DTGP, MethodObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.RP05.ARPT, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Scope (\_SB.PCI0.RP05.ARPT)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                Store (Package (0x14)
                    {
                        "built-in", 
                        Buffer (One)
                        {
                             0x00
                        }, 

                        "model", 
                        Buffer (0x10)
                        {
                            "AirPort Extreme"
                        }, 

                        "subsystem-id", 
                        Buffer (0x04)
                        {
                             0x8F, 0x00, 0x00, 0x00
                        }, 

                        "subsystem-vendor-id", 
                        Buffer (0x04)
                        {
                             0x6B, 0x10, 0x00, 0x00
                        }, 

                        "device_type", 
                        Buffer (0x08)
                        {
                            "AirPort"
                        }, 

                        "AAPL,slot-name", 
                        Buffer (0x08)
                        {
                            "AirPort"
                        }, 

                        "device-id", 
                        Buffer (0x04)
                        {
                             0x30, 0x00, 0x00, 0x00
                        }, 

                        "vendor-id", 
                        Buffer (0x04)
                        {
                             0x8C, 0x16, 0x00, 0x00
                        }, 

                        "name", 
                        Buffer ()
                        {
                            "pci168c,30"
                        }, 

                        "compatible", 
                        Buffer ()
                        {
                            "pci168c,30"
                        }
                    }, Local0)
                DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
                Return (Local0)
            }
        }
    }
}

