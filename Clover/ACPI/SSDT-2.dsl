/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20131218-64 [Jan  8 2014]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of iASLPSZJ7n.aml, Thu Jul 17 16:58:48 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000CB (203)
 *     Revision         0x01
 *     Checksum         0xCC
 *     OEM ID           "PmRefA"
 *     OEM Table ID     "CpuCst"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20100331 (537920305)
 */
DefinitionBlock ("SSDT-2.aml", "SSDT", 1, "PmRefA", "CpuCst", 0x00003000)
{

    External (_PR_.CPU0, DeviceObj)
    External (_PR_.CPU1, DeviceObj)
    External (_PR_.CPU2, DeviceObj)
    External (_PR_.CPU3, DeviceObj)

    Scope (\_PR.CPU0)
    {
        // Atom 330 only supports C0 and C1, so we define a single C-State to utilize.
        // Staying at C1 allows CPU temp to drop by roughly 5-6 degrees C
        Name (CST, Package (0x02)
        {
            One, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x01,               // Bit Width
                        0x02,               // Bit Offset
                        0x0000000000000000, // Address
                        0x01,               // Access Size
                        )
                }, 

                One, 
                One, 
                0x03E8
            }
        })
        Method (_CST, 0, NotSerialized)  // _CST: C-States
        {
            Return (CST)
        }
    }

    Scope (\_PR.CPU1)
    {
        Method (_CST, 0, NotSerialized)  // _CST: C-States
        {
            Return (\_PR.CPU0.CST)
        }
    }

    Scope (\_PR.CPU2)
    {
        Method (_CST, 0, NotSerialized)  // _CST: C-States
        {
            Return (\_PR.CPU0.CST)
        }
    }

    Scope (\_PR.CPU3)
    {
        Method (_CST, 0, NotSerialized)  // _CST: C-States
        {
            Return (\_PR.CPU0.CST)
        }
    }
}

