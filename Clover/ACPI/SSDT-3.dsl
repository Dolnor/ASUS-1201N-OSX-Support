/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20131218-64 [Jan  8 2014]
 * Copyright (c) 2000 - 2013 Intel Corporation
 * 
 * Disassembly of iASLUBYNAa.aml, Thu Jul 17 16:58:59 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000148 (328)
 *     Revision         0x01
 *     Checksum         0x36
 *     OEM ID           "ASUS "
 *     OEM Table ID     "MoniDevc"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20131218 (538120728)
 */
DefinitionBlock ("SSDT-3.aml", "SSDT", 1, "ASUS ", "MoniDevc", 0x00001000)
{

    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC_.MUEC, MutexObj) // EC mutex lock
    External (_SB_.PCI0.LPCB.EC_.ST00, IntObj)   // CPU Temp register used by Thermal Zones
    External (_SB_.PCI0.LPCB.EC_.ST06, IntObj)   // Motherboard Ambient Temp register
    External (_SB_.PCI0.LPCB.EC_.TH00, IntObj)   // Tachometer High order RPM reading
    External (_SB_.PCI0.LPCB.EC_.TH01, IntObj)   // Tachometer Low order RPM reading
    External (_SB_.PCI0.LPCB.FSBG) // Front Side Bus Get arbitrary value 

    Scope (_SB.PCI0.LPCB)
    {
        Device (SMCD)
        {
            Name (_HID, "MON0000")  // _HID: Hardware ID
            Name (_CID, "acpi-monitor")  // _CID: Compatible ID
            Name (KLVN, Zero) // Don't use Kelvin degrees for temp reporting
            Name (TEMP, Package (0x04) // Temperature sensor array
            {
                "CPU Heatsink", // Name of sensor 1
                "TCPU",         // Method to poll 1
                "Mainboard",    // Name of sensor 2
                "TSYS"          // Method to poll 2
            })
            Method (TCPU, 0, NotSerialized) // CPU temp from EC register
            {
                Return (^^EC.ST00)
            }

            Method (TSYS, 0, NotSerialized) // Mobo temp from EC register
            {
                Return (^^EC.ST06)
            }

            Name (TACH, Package () // Tachometer sensor array
            {
                "System Fan",  // Name of fan sensor 1
                "FAN1" /* ,    // Method to poll 1
                "SHE Mode",    // Name of fan sensor 2 (SHE Mode detector)
                "FAN2"         // Method to poll 2
                */
                
            })
            Method (FAN1, 0, NotSerialized) // System Fan RPM from EC
            {
                /* EC memory actually reports fan RPM in two register pairs: 0x6A + 0x6B and 0x66 + 0x67
                   The values stored slightly differ, perhaps one is current reading and the other one is previous reading
                   or one set of register can be manipulated, while other one just prints out the speed
                */
                
                Acquire (^^EC.MUEC, 0xFFFF) // Request EC write lock while we are reading data for tachometer
                Store (^^EC.TH00, Local0)   // High RPM value
                Store (^^EC.TH01, Local1)   // Low RPM value
                Release (^^EC.MUEC)         // Lift lock from EC
                // concatenate two Words in a single RPM digit
                Multiply (Local0, 0x0100, Local0)
                Add (Local0, Local1, Local0)
                // return current RPM reading
                Return (Local0)
            }

            // This allows to monitor Super Hybrid Engine states if netbook was rebooted from Windows
            // One could set the states by altering _Q1C query in OSX as well, but control method FSBA doesn't seem to do much
            Method (FAN2, 0, NotSerialized)
            {
                // Get FSB arbitrary vallue, that is reported as 0x300 to 0x302 
                And (FSBG, 0xFF, Local0)
                // Super Performance
                If (LEqual (Local0, Zero))
                {
                    Store (0xFF, Local1)
                }
                // High Performance
                If (LEqual (Local0, One))
                {
                    Store (0xFE, Local1)
                }
                // Energy Saver
                If (LEqual (Local0, 0x02))
                {
                    Store (0xFD, Local1)
                }
                // Return current SHE state
                Return (Local1)
            }
        }
    }
}

