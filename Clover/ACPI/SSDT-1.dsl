/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20131218-64 [Jan  8 2014]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of iASLQYPUCs.aml, Thu Jul 17 16:58:29 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000016B (363)
 *     Revision         0x01
 *     Checksum         0x44
 *     OEM ID           "PmRef"
 *     OEM Table ID     "CpuPm"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20100331 (537920305)
 */
DefinitionBlock ("SSDT-1.aml", "SSDT", 1, "PmRef", "CpuPm", 0x00003000)
{
    // Atom 330 support Hyper Threading technology so we have to consider 4 cores, even though only 2 are physical
  
    External (_PR_.CPU0, DeviceObj)
    External (_PR_.CPU1, DeviceObj)
    External (_PR_.CPU2, DeviceObj)
    External (_PR_.CPU3, DeviceObj)

    Scope (\_PR.CPU0)
    {
        // CPU is desktop-class and doesn't support EIST, we provide a single PSS state (for 1.6 GHz clock) and
        // null-value Performance Control and Capabilities just to accomodate Apple's power management constraints 
        Name (PSS, Package (0x01)
        {
            Package (0x06)
            {
                0x063C, 
                0xFC0C, 
                0x0A, 
                0x0A, 
                0x0C1B, 
                0x0C1B
            }
        })
       
        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            Return (PSS)
        }

        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (Zero)
        }

        Name (PCT, Package (0x02)
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x00,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x00,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        
        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            Return (PCT)
        }
    }

    Scope (\_PR.CPU1)
    {
        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            Return (\_PR.CPU0.PSS)
        }

        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (Zero)
        }

        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            Return (\_PR.CPU0.PCT)
        }
    }

    Scope (\_PR.CPU2)
    {
        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            Return (\_PR.CPU0.PSS)
        }

        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (Zero)
        }

        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            Return (\_PR.CPU0.PCT)
        }
    }

    Scope (\_PR.CPU3)
    {
        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            Return (\_PR.CPU0.PSS)
        }

        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (Zero)
        }

        Method (_PCT, 0, NotSerialized)  // _PCT: Performance Control
        {
            Return (\_PR.CPU0.PCT)
        }
    }
}

