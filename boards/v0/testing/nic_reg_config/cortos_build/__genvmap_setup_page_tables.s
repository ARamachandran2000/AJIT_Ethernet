.section .text.pagetablesetup
.global page_table_setup
page_table_setup:
   set PAGE_TABLE_BASE, %g1
   !PTD: context=0, index=0, level=0, child_p_addr=0xc00, p_addr=0x1000
   ! *(PAGE_TABLE_BASE + 0x1000) = ptd(PAGE_TABLE_BASE + 0xc00)
   ! make PTD from 0xc00
   set 0xc00, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x1000, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=1, child_p_addr=0x0, p_addr=0xc00
   ! *(PAGE_TABLE_BASE + 0xc00) = ptd(PAGE_TABLE_BASE + 0x0)
   ! make PTD from 0x0
   set 0x0, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xc00, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x0, p_addr=0x0, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x0) = 0x8a (pte)
   set 0x8a, %g2
   set 0x0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x40000, p_addr=0x4, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4) = 0x408a (pte)
   set 0x408a, %g2
   set 0x4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x80000, p_addr=0x8, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x8) = 0x808a (pte)
   set 0x808a, %g2
   set 0x8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0xc0000, p_addr=0xc, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0xc) = 0xc08a (pte)
   set 0xc08a, %g2
   set 0xc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x100000, p_addr=0x10, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x10) = 0x1008a (pte)
   set 0x1008a, %g2
   set 0x10, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x140000, p_addr=0x14, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x14) = 0x1408a (pte)
   set 0x1408a, %g2
   set 0x14, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x180000, p_addr=0x18, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x18) = 0x1808a (pte)
   set 0x1808a, %g2
   set 0x18, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x1c0000, p_addr=0x1c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x1c) = 0x1c08a (pte)
   set 0x1c08a, %g2
   set 0x1c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x200000, p_addr=0x20, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x20) = 0x2008a (pte)
   set 0x2008a, %g2
   set 0x20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x240000, p_addr=0x24, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x24) = 0x2408a (pte)
   set 0x2408a, %g2
   set 0x24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x280000, p_addr=0x28, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x28) = 0x2808a (pte)
   set 0x2808a, %g2
   set 0x28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x2c0000, p_addr=0x2c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x2c) = 0x2c08a (pte)
   set 0x2c08a, %g2
   set 0x2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x300000, p_addr=0x30, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x30) = 0x3008a (pte)
   set 0x3008a, %g2
   set 0x30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x340000, p_addr=0x34, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x34) = 0x3408a (pte)
   set 0x3408a, %g2
   set 0x34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x380000, p_addr=0x38, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x38) = 0x3808a (pte)
   set 0x3808a, %g2
   set 0x38, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x3c0000, p_addr=0x3c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x3c) = 0x3c08a (pte)
   set 0x3c08a, %g2
   set 0x3c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x400000, p_addr=0x40, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x40) = 0x4008a (pte)
   set 0x4008a, %g2
   set 0x40, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x440000, p_addr=0x44, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x44) = 0x4408a (pte)
   set 0x4408a, %g2
   set 0x44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x480000, p_addr=0x48, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x48) = 0x4808a (pte)
   set 0x4808a, %g2
   set 0x48, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x4c0000, p_addr=0x4c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4c) = 0x4c08a (pte)
   set 0x4c08a, %g2
   set 0x4c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x500000, p_addr=0x50, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x50) = 0x5008a (pte)
   set 0x5008a, %g2
   set 0x50, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x540000, p_addr=0x54, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x54) = 0x5408a (pte)
   set 0x5408a, %g2
   set 0x54, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x580000, p_addr=0x58, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x58) = 0x5808a (pte)
   set 0x5808a, %g2
   set 0x58, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x5c0000, p_addr=0x5c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x5c) = 0x5c08a (pte)
   set 0x5c08a, %g2
   set 0x5c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x600000, p_addr=0x60, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x60) = 0x6008a (pte)
   set 0x6008a, %g2
   set 0x60, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x640000, p_addr=0x64, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x64) = 0x6408a (pte)
   set 0x6408a, %g2
   set 0x64, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x680000, p_addr=0x68, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x68) = 0x6808a (pte)
   set 0x6808a, %g2
   set 0x68, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x6c0000, p_addr=0x6c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x6c) = 0x6c08a (pte)
   set 0x6c08a, %g2
   set 0x6c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x700000, p_addr=0x70, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x70) = 0x7008a (pte)
   set 0x7008a, %g2
   set 0x70, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x740000, p_addr=0x74, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x74) = 0x7408a (pte)
   set 0x7408a, %g2
   set 0x74, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x780000, p_addr=0x78, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x78) = 0x7808a (pte)
   set 0x7808a, %g2
   set 0x78, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x7c0000, p_addr=0x7c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x7c) = 0x7c08a (pte)
   set 0x7c08a, %g2
   set 0x7c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=1,  ppnr=0x1000000, p_addr=0xc04, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc04) = 0x10008e (pte)
   set 0x10008e, %g2
   set 0xc04, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=2, level=1, child_p_addr=0x100, p_addr=0xc08
   ! *(PAGE_TABLE_BASE + 0xc08) = ptd(PAGE_TABLE_BASE + 0x100)
   ! make PTD from 0x100
   set 0x100, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xc08, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x2000000, p_addr=0x100, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x100) = 0x20008e (pte)
   set 0x20008e, %g2
   set 0x100, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x2040000, p_addr=0x104, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x104) = 0x20408e (pte)
   set 0x20408e, %g2
   set 0x104, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x2080000, p_addr=0x108, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x108) = 0x20808e (pte)
   set 0x20808e, %g2
   set 0x108, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x20c0000, p_addr=0x10c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x10c) = 0x20c08e (pte)
   set 0x20c08e, %g2
   set 0x10c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x2100000, p_addr=0x110, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x110) = 0x21008e (pte)
   set 0x21008e, %g2
   set 0x110, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x2140000, p_addr=0x114, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x114) = 0x21408e (pte)
   set 0x21408e, %g2
   set 0x114, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x2180000, p_addr=0x118, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x118) = 0x21808e (pte)
   set 0x21808e, %g2
   set 0x118, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x21c0000, p_addr=0x11c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x11c) = 0x21c08e (pte)
   set 0x21c08e, %g2
   set 0x11c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x2200000, p_addr=0x120, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x120) = 0x22008e (pte)
   set 0x22008e, %g2
   set 0x120, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x2240000, p_addr=0x124, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x124) = 0x22408e (pte)
   set 0x22408e, %g2
   set 0x124, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x2280000, p_addr=0x128, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x128) = 0x22808e (pte)
   set 0x22808e, %g2
   set 0x128, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x22c0000, p_addr=0x12c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x12c) = 0x22c08e (pte)
   set 0x22c08e, %g2
   set 0x12c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x2300000, p_addr=0x130, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x130) = 0x23008e (pte)
   set 0x23008e, %g2
   set 0x130, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x2340000, p_addr=0x134, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x134) = 0x23408e (pte)
   set 0x23408e, %g2
   set 0x134, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x2380000, p_addr=0x138, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x138) = 0x23808e (pte)
   set 0x23808e, %g2
   set 0x138, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x23c0000, p_addr=0x13c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x13c) = 0x23c08e (pte)
   set 0x23c08e, %g2
   set 0x13c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x2400000, p_addr=0x140, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x140) = 0x24008e (pte)
   set 0x24008e, %g2
   set 0x140, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x2440000, p_addr=0x144, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x144) = 0x24408e (pte)
   set 0x24408e, %g2
   set 0x144, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x2480000, p_addr=0x148, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x148) = 0x24808e (pte)
   set 0x24808e, %g2
   set 0x148, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x24c0000, p_addr=0x14c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x14c) = 0x24c08e (pte)
   set 0x24c08e, %g2
   set 0x14c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x2500000, p_addr=0x150, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x150) = 0x25008e (pte)
   set 0x25008e, %g2
   set 0x150, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x2540000, p_addr=0x154, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x154) = 0x25408e (pte)
   set 0x25408e, %g2
   set 0x154, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x2580000, p_addr=0x158, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x158) = 0x25808e (pte)
   set 0x25808e, %g2
   set 0x158, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x25c0000, p_addr=0x15c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x15c) = 0x25c08e (pte)
   set 0x25c08e, %g2
   set 0x15c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x2600000, p_addr=0x160, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x160) = 0x26008e (pte)
   set 0x26008e, %g2
   set 0x160, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x2640000, p_addr=0x164, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x164) = 0x26408e (pte)
   set 0x26408e, %g2
   set 0x164, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x2680000, p_addr=0x168, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x168) = 0x26808e (pte)
   set 0x26808e, %g2
   set 0x168, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x26c0000, p_addr=0x16c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x16c) = 0x26c08e (pte)
   set 0x26c08e, %g2
   set 0x16c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x2700000, p_addr=0x170, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x170) = 0x27008e (pte)
   set 0x27008e, %g2
   set 0x170, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x2740000, p_addr=0x174, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x174) = 0x27408e (pte)
   set 0x27408e, %g2
   set 0x174, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x2780000, p_addr=0x178, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x178) = 0x27808e (pte)
   set 0x27808e, %g2
   set 0x178, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x27c0000, p_addr=0x17c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x17c) = 0x27c08e (pte)
   set 0x27c08e, %g2
   set 0x17c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=2,  ppnr=0x2800000, p_addr=0x180, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x180) = 0x28008e (pte)
   set 0x28008e, %g2
   set 0x180, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=2,  ppnr=0x2840000, p_addr=0x184, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x184) = 0x28408e (pte)
   set 0x28408e, %g2
   set 0x184, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=2,  ppnr=0x2880000, p_addr=0x188, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x188) = 0x28808e (pte)
   set 0x28808e, %g2
   set 0x188, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=2,  ppnr=0x28c0000, p_addr=0x18c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x18c) = 0x28c08e (pte)
   set 0x28c08e, %g2
   set 0x18c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=2,  ppnr=0x2900000, p_addr=0x190, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x190) = 0x29008e (pte)
   set 0x29008e, %g2
   set 0x190, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=2,  ppnr=0x2940000, p_addr=0x194, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x194) = 0x29408e (pte)
   set 0x29408e, %g2
   set 0x194, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=2,  ppnr=0x2980000, p_addr=0x198, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x198) = 0x29808e (pte)
   set 0x29808e, %g2
   set 0x198, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=2,  ppnr=0x29c0000, p_addr=0x19c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x19c) = 0x29c08e (pte)
   set 0x29c08e, %g2
   set 0x19c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=2,  ppnr=0x2a00000, p_addr=0x1a0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a0) = 0x2a008e (pte)
   set 0x2a008e, %g2
   set 0x1a0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=2,  ppnr=0x2a40000, p_addr=0x1a4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a4) = 0x2a408e (pte)
   set 0x2a408e, %g2
   set 0x1a4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=2,  ppnr=0x2a80000, p_addr=0x1a8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a8) = 0x2a808e (pte)
   set 0x2a808e, %g2
   set 0x1a8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=2,  ppnr=0x2ac0000, p_addr=0x1ac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1ac) = 0x2ac08e (pte)
   set 0x2ac08e, %g2
   set 0x1ac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=2,  ppnr=0x2b00000, p_addr=0x1b0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b0) = 0x2b008e (pte)
   set 0x2b008e, %g2
   set 0x1b0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=2,  ppnr=0x2b40000, p_addr=0x1b4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b4) = 0x2b408e (pte)
   set 0x2b408e, %g2
   set 0x1b4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=2,  ppnr=0x2b80000, p_addr=0x1b8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b8) = 0x2b808e (pte)
   set 0x2b808e, %g2
   set 0x1b8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=2,  ppnr=0x2bc0000, p_addr=0x1bc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1bc) = 0x2bc08e (pte)
   set 0x2bc08e, %g2
   set 0x1bc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=2,  ppnr=0x2c00000, p_addr=0x1c0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c0) = 0x2c008e (pte)
   set 0x2c008e, %g2
   set 0x1c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=2,  ppnr=0x2c40000, p_addr=0x1c4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c4) = 0x2c408e (pte)
   set 0x2c408e, %g2
   set 0x1c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=2,  ppnr=0x2c80000, p_addr=0x1c8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c8) = 0x2c808e (pte)
   set 0x2c808e, %g2
   set 0x1c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=2,  ppnr=0x2cc0000, p_addr=0x1cc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1cc) = 0x2cc08e (pte)
   set 0x2cc08e, %g2
   set 0x1cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=2,  ppnr=0x2d00000, p_addr=0x1d0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d0) = 0x2d008e (pte)
   set 0x2d008e, %g2
   set 0x1d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=2,  ppnr=0x2d40000, p_addr=0x1d4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d4) = 0x2d408e (pte)
   set 0x2d408e, %g2
   set 0x1d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=2,  ppnr=0x2d80000, p_addr=0x1d8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d8) = 0x2d808e (pte)
   set 0x2d808e, %g2
   set 0x1d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=2,  ppnr=0x2dc0000, p_addr=0x1dc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1dc) = 0x2dc08e (pte)
   set 0x2dc08e, %g2
   set 0x1dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=2,  ppnr=0x2e00000, p_addr=0x1e0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e0) = 0x2e008e (pte)
   set 0x2e008e, %g2
   set 0x1e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=2,  ppnr=0x2e40000, p_addr=0x1e4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e4) = 0x2e408e (pte)
   set 0x2e408e, %g2
   set 0x1e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=2,  ppnr=0x2e80000, p_addr=0x1e8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e8) = 0x2e808e (pte)
   set 0x2e808e, %g2
   set 0x1e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=2,  ppnr=0x2ec0000, p_addr=0x1ec, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1ec) = 0x2ec08e (pte)
   set 0x2ec08e, %g2
   set 0x1ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=2,  ppnr=0x2f00000, p_addr=0x1f0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f0) = 0x2f008e (pte)
   set 0x2f008e, %g2
   set 0x1f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=2,  ppnr=0x2f40000, p_addr=0x1f4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f4) = 0x2f408e (pte)
   set 0x2f408e, %g2
   set 0x1f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=2,  ppnr=0x2f80000, p_addr=0x1f8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f8) = 0x2f808e (pte)
   set 0x2f808e, %g2
   set 0x1f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=2,  ppnr=0x2fc0000, p_addr=0x1fc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1fc) = 0x2fc08e (pte)
   set 0x2fc08e, %g2
   set 0x1fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=3, level=1, child_p_addr=0x300, p_addr=0xc0c
   ! *(PAGE_TABLE_BASE + 0xc0c) = ptd(PAGE_TABLE_BASE + 0x300)
   ! make PTD from 0x300
   set 0x300, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xc0c, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x3000000, p_addr=0x300, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x300) = 0x30008e (pte)
   set 0x30008e, %g2
   set 0x300, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x3040000, p_addr=0x304, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x304) = 0x30408e (pte)
   set 0x30408e, %g2
   set 0x304, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x3080000, p_addr=0x308, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x308) = 0x30808e (pte)
   set 0x30808e, %g2
   set 0x308, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x30c0000, p_addr=0x30c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x30c) = 0x30c08e (pte)
   set 0x30c08e, %g2
   set 0x30c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x3100000, p_addr=0x310, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x310) = 0x31008e (pte)
   set 0x31008e, %g2
   set 0x310, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x3140000, p_addr=0x314, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x314) = 0x31408e (pte)
   set 0x31408e, %g2
   set 0x314, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x3180000, p_addr=0x318, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x318) = 0x31808e (pte)
   set 0x31808e, %g2
   set 0x318, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x31c0000, p_addr=0x31c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x31c) = 0x31c08e (pte)
   set 0x31c08e, %g2
   set 0x31c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x3200000, p_addr=0x320, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x320) = 0x32008e (pte)
   set 0x32008e, %g2
   set 0x320, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x3240000, p_addr=0x324, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x324) = 0x32408e (pte)
   set 0x32408e, %g2
   set 0x324, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x3280000, p_addr=0x328, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x328) = 0x32808e (pte)
   set 0x32808e, %g2
   set 0x328, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x32c0000, p_addr=0x32c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x32c) = 0x32c08e (pte)
   set 0x32c08e, %g2
   set 0x32c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x3300000, p_addr=0x330, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x330) = 0x33008e (pte)
   set 0x33008e, %g2
   set 0x330, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x3340000, p_addr=0x334, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x334) = 0x33408e (pte)
   set 0x33408e, %g2
   set 0x334, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x3380000, p_addr=0x338, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x338) = 0x33808e (pte)
   set 0x33808e, %g2
   set 0x338, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x33c0000, p_addr=0x33c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x33c) = 0x33c08e (pte)
   set 0x33c08e, %g2
   set 0x33c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x3400000, p_addr=0x340, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x340) = 0x34008e (pte)
   set 0x34008e, %g2
   set 0x340, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x3440000, p_addr=0x344, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x344) = 0x34408e (pte)
   set 0x34408e, %g2
   set 0x344, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x3480000, p_addr=0x348, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x348) = 0x34808e (pte)
   set 0x34808e, %g2
   set 0x348, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x34c0000, p_addr=0x34c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x34c) = 0x34c08e (pte)
   set 0x34c08e, %g2
   set 0x34c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x3500000, p_addr=0x350, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x350) = 0x35008e (pte)
   set 0x35008e, %g2
   set 0x350, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x3540000, p_addr=0x354, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x354) = 0x35408e (pte)
   set 0x35408e, %g2
   set 0x354, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x3580000, p_addr=0x358, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x358) = 0x35808e (pte)
   set 0x35808e, %g2
   set 0x358, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x35c0000, p_addr=0x35c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x35c) = 0x35c08e (pte)
   set 0x35c08e, %g2
   set 0x35c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x3600000, p_addr=0x360, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x360) = 0x36008e (pte)
   set 0x36008e, %g2
   set 0x360, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x3640000, p_addr=0x364, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x364) = 0x36408e (pte)
   set 0x36408e, %g2
   set 0x364, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x3680000, p_addr=0x368, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x368) = 0x36808e (pte)
   set 0x36808e, %g2
   set 0x368, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x36c0000, p_addr=0x36c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x36c) = 0x36c08e (pte)
   set 0x36c08e, %g2
   set 0x36c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x3700000, p_addr=0x370, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x370) = 0x37008e (pte)
   set 0x37008e, %g2
   set 0x370, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x3740000, p_addr=0x374, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x374) = 0x37408e (pte)
   set 0x37408e, %g2
   set 0x374, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x3780000, p_addr=0x378, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x378) = 0x37808e (pte)
   set 0x37808e, %g2
   set 0x378, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x37c0000, p_addr=0x37c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x37c) = 0x37c08e (pte)
   set 0x37c08e, %g2
   set 0x37c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=2,  ppnr=0x3800000, p_addr=0x380, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x380) = 0x38008e (pte)
   set 0x38008e, %g2
   set 0x380, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=2,  ppnr=0x3840000, p_addr=0x384, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x384) = 0x38408e (pte)
   set 0x38408e, %g2
   set 0x384, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=2,  ppnr=0x3880000, p_addr=0x388, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x388) = 0x38808e (pte)
   set 0x38808e, %g2
   set 0x388, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=2,  ppnr=0x38c0000, p_addr=0x38c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x38c) = 0x38c08e (pte)
   set 0x38c08e, %g2
   set 0x38c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=2,  ppnr=0x3900000, p_addr=0x390, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x390) = 0x39008e (pte)
   set 0x39008e, %g2
   set 0x390, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=2,  ppnr=0x3940000, p_addr=0x394, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x394) = 0x39408e (pte)
   set 0x39408e, %g2
   set 0x394, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=2,  ppnr=0x3980000, p_addr=0x398, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x398) = 0x39808e (pte)
   set 0x39808e, %g2
   set 0x398, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=2,  ppnr=0x39c0000, p_addr=0x39c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x39c) = 0x39c08e (pte)
   set 0x39c08e, %g2
   set 0x39c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=2,  ppnr=0x3a00000, p_addr=0x3a0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3a0) = 0x3a008e (pte)
   set 0x3a008e, %g2
   set 0x3a0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=2,  ppnr=0x3a40000, p_addr=0x3a4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3a4) = 0x3a408e (pte)
   set 0x3a408e, %g2
   set 0x3a4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=2,  ppnr=0x3a80000, p_addr=0x3a8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3a8) = 0x3a808e (pte)
   set 0x3a808e, %g2
   set 0x3a8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=2,  ppnr=0x3ac0000, p_addr=0x3ac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3ac) = 0x3ac08e (pte)
   set 0x3ac08e, %g2
   set 0x3ac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=2,  ppnr=0x3b00000, p_addr=0x3b0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3b0) = 0x3b008e (pte)
   set 0x3b008e, %g2
   set 0x3b0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=2,  ppnr=0x3b40000, p_addr=0x3b4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3b4) = 0x3b408e (pte)
   set 0x3b408e, %g2
   set 0x3b4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=2,  ppnr=0x3b80000, p_addr=0x3b8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3b8) = 0x3b808e (pte)
   set 0x3b808e, %g2
   set 0x3b8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=2,  ppnr=0x3bc0000, p_addr=0x3bc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3bc) = 0x3bc08e (pte)
   set 0x3bc08e, %g2
   set 0x3bc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=2,  ppnr=0x3c00000, p_addr=0x3c0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3c0) = 0x3c008e (pte)
   set 0x3c008e, %g2
   set 0x3c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=2,  ppnr=0x3c40000, p_addr=0x3c4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3c4) = 0x3c408e (pte)
   set 0x3c408e, %g2
   set 0x3c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=2,  ppnr=0x3c80000, p_addr=0x3c8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3c8) = 0x3c808e (pte)
   set 0x3c808e, %g2
   set 0x3c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=2,  ppnr=0x3cc0000, p_addr=0x3cc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3cc) = 0x3cc08e (pte)
   set 0x3cc08e, %g2
   set 0x3cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=52, level=2, child_p_addr=0x200, p_addr=0x3d0
   ! *(PAGE_TABLE_BASE + 0x3d0) = ptd(PAGE_TABLE_BASE + 0x200)
   ! make PTD from 0x200
   set 0x200, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x3d0, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x3d00000, p_addr=0x200, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x200) = 0x3d008e (pte)
   set 0x3d008e, %g2
   set 0x200, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=3,  ppnr=0x3d01000, p_addr=0x204, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x204) = 0x3d010e (pte)
   set 0x3d010e, %g2
   set 0x204, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=1,  ppnr=0x4000000, p_addr=0xc10, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc10) = 0x40008e (pte)
   set 0x40008e, %g2
   set 0xc10, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=1,  ppnr=0x5000000, p_addr=0xc14, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc14) = 0x50008e (pte)
   set 0x50008e, %g2
   set 0xc14, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=1,  ppnr=0x6000000, p_addr=0xc18, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc18) = 0x60008e (pte)
   set 0x60008e, %g2
   set 0xc18, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=1,  ppnr=0x7000000, p_addr=0xc1c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc1c) = 0x70008e (pte)
   set 0x70008e, %g2
   set 0xc1c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=1,  ppnr=0x8000000, p_addr=0xc20, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc20) = 0x80008e (pte)
   set 0x80008e, %g2
   set 0xc20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=1,  ppnr=0x9000000, p_addr=0xc24, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc24) = 0x90008e (pte)
   set 0x90008e, %g2
   set 0xc24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=1,  ppnr=0xa000000, p_addr=0xc28, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc28) = 0xa0008e (pte)
   set 0xa0008e, %g2
   set 0xc28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=1,  ppnr=0xb000000, p_addr=0xc2c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc2c) = 0xb0008e (pte)
   set 0xb0008e, %g2
   set 0xc2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=1,  ppnr=0xc000000, p_addr=0xc30, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc30) = 0xc0008e (pte)
   set 0xc0008e, %g2
   set 0xc30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=1,  ppnr=0xd000000, p_addr=0xc34, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc34) = 0xd0008e (pte)
   set 0xd0008e, %g2
   set 0xc34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=1,  ppnr=0xe000000, p_addr=0xc38, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc38) = 0xe0008e (pte)
   set 0xe0008e, %g2
   set 0xc38, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=1,  ppnr=0xf000000, p_addr=0xc3c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc3c) = 0xf0008e (pte)
   set 0xf0008e, %g2
   set 0xc3c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=1,  ppnr=0x10000000, p_addr=0xc40, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc40) = 0x100008e (pte)
   set 0x100008e, %g2
   set 0xc40, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=1,  ppnr=0x11000000, p_addr=0xc44, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc44) = 0x110008e (pte)
   set 0x110008e, %g2
   set 0xc44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=1,  ppnr=0x12000000, p_addr=0xc48, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc48) = 0x120008e (pte)
   set 0x120008e, %g2
   set 0xc48, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=1,  ppnr=0x13000000, p_addr=0xc4c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc4c) = 0x130008e (pte)
   set 0x130008e, %g2
   set 0xc4c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=1,  ppnr=0x14000000, p_addr=0xc50, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc50) = 0x140008e (pte)
   set 0x140008e, %g2
   set 0xc50, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=1,  ppnr=0x15000000, p_addr=0xc54, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc54) = 0x150008e (pte)
   set 0x150008e, %g2
   set 0xc54, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=1,  ppnr=0x16000000, p_addr=0xc58, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc58) = 0x160008e (pte)
   set 0x160008e, %g2
   set 0xc58, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=1,  ppnr=0x17000000, p_addr=0xc5c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc5c) = 0x170008e (pte)
   set 0x170008e, %g2
   set 0xc5c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=1,  ppnr=0x18000000, p_addr=0xc60, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc60) = 0x180008e (pte)
   set 0x180008e, %g2
   set 0xc60, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=1,  ppnr=0x19000000, p_addr=0xc64, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc64) = 0x190008e (pte)
   set 0x190008e, %g2
   set 0xc64, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=1,  ppnr=0x1a000000, p_addr=0xc68, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc68) = 0x1a0008e (pte)
   set 0x1a0008e, %g2
   set 0xc68, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=1,  ppnr=0x1b000000, p_addr=0xc6c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc6c) = 0x1b0008e (pte)
   set 0x1b0008e, %g2
   set 0xc6c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=1,  ppnr=0x1c000000, p_addr=0xc70, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc70) = 0x1c0008e (pte)
   set 0x1c0008e, %g2
   set 0xc70, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=1,  ppnr=0x1d000000, p_addr=0xc74, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc74) = 0x1d0008e (pte)
   set 0x1d0008e, %g2
   set 0xc74, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=1,  ppnr=0x1e000000, p_addr=0xc78, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc78) = 0x1e0008e (pte)
   set 0x1e0008e, %g2
   set 0xc78, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=1,  ppnr=0x1f000000, p_addr=0xc7c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc7c) = 0x1f0008e (pte)
   set 0x1f0008e, %g2
   set 0xc7c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=1,  ppnr=0x20000000, p_addr=0xc80, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc80) = 0x200008e (pte)
   set 0x200008e, %g2
   set 0xc80, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=1,  ppnr=0x21000000, p_addr=0xc84, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc84) = 0x210008e (pte)
   set 0x210008e, %g2
   set 0xc84, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=1,  ppnr=0x22000000, p_addr=0xc88, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc88) = 0x220008e (pte)
   set 0x220008e, %g2
   set 0xc88, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=35, level=1, child_p_addr=0x500, p_addr=0xc8c
   ! *(PAGE_TABLE_BASE + 0xc8c) = ptd(PAGE_TABLE_BASE + 0x500)
   ! make PTD from 0x500
   set 0x500, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xc8c, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x23000000, p_addr=0x500, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x500) = 0x230008e (pte)
   set 0x230008e, %g2
   set 0x500, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x23040000, p_addr=0x504, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x504) = 0x230408e (pte)
   set 0x230408e, %g2
   set 0x504, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x23080000, p_addr=0x508, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x508) = 0x230808e (pte)
   set 0x230808e, %g2
   set 0x508, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x230c0000, p_addr=0x50c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x50c) = 0x230c08e (pte)
   set 0x230c08e, %g2
   set 0x50c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x23100000, p_addr=0x510, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x510) = 0x231008e (pte)
   set 0x231008e, %g2
   set 0x510, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x23140000, p_addr=0x514, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x514) = 0x231408e (pte)
   set 0x231408e, %g2
   set 0x514, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x23180000, p_addr=0x518, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x518) = 0x231808e (pte)
   set 0x231808e, %g2
   set 0x518, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x231c0000, p_addr=0x51c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x51c) = 0x231c08e (pte)
   set 0x231c08e, %g2
   set 0x51c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x23200000, p_addr=0x520, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x520) = 0x232008e (pte)
   set 0x232008e, %g2
   set 0x520, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x23240000, p_addr=0x524, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x524) = 0x232408e (pte)
   set 0x232408e, %g2
   set 0x524, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x23280000, p_addr=0x528, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x528) = 0x232808e (pte)
   set 0x232808e, %g2
   set 0x528, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x232c0000, p_addr=0x52c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x52c) = 0x232c08e (pte)
   set 0x232c08e, %g2
   set 0x52c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x23300000, p_addr=0x530, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x530) = 0x233008e (pte)
   set 0x233008e, %g2
   set 0x530, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x23340000, p_addr=0x534, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x534) = 0x233408e (pte)
   set 0x233408e, %g2
   set 0x534, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x23380000, p_addr=0x538, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x538) = 0x233808e (pte)
   set 0x233808e, %g2
   set 0x538, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x233c0000, p_addr=0x53c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x53c) = 0x233c08e (pte)
   set 0x233c08e, %g2
   set 0x53c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=16, level=2, child_p_addr=0x400, p_addr=0x540
   ! *(PAGE_TABLE_BASE + 0x540) = ptd(PAGE_TABLE_BASE + 0x400)
   ! make PTD from 0x400
   set 0x400, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x540, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x23400000, p_addr=0x400, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x400) = 0x2340092 (pte)
   set 0x2340092, %g2
   set 0x400, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=1,  ppnr=0x24000000, p_addr=0xc90, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc90) = 0x240008e (pte)
   set 0x240008e, %g2
   set 0xc90, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=1,  ppnr=0x25000000, p_addr=0xc94, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc94) = 0x250008e (pte)
   set 0x250008e, %g2
   set 0xc94, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=1,  ppnr=0x26000000, p_addr=0xc98, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc98) = 0x260008e (pte)
   set 0x260008e, %g2
   set 0xc98, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=1,  ppnr=0x27000000, p_addr=0xc9c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc9c) = 0x270008e (pte)
   set 0x270008e, %g2
   set 0xc9c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=1,  ppnr=0x28000000, p_addr=0xca0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xca0) = 0x280008e (pte)
   set 0x280008e, %g2
   set 0xca0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=1,  ppnr=0x29000000, p_addr=0xca4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xca4) = 0x290008e (pte)
   set 0x290008e, %g2
   set 0xca4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=1,  ppnr=0x2a000000, p_addr=0xca8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xca8) = 0x2a0008e (pte)
   set 0x2a0008e, %g2
   set 0xca8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=1,  ppnr=0x2b000000, p_addr=0xcac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcac) = 0x2b0008e (pte)
   set 0x2b0008e, %g2
   set 0xcac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=1,  ppnr=0x2c000000, p_addr=0xcb0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcb0) = 0x2c0008e (pte)
   set 0x2c0008e, %g2
   set 0xcb0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=1,  ppnr=0x2d000000, p_addr=0xcb4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcb4) = 0x2d0008e (pte)
   set 0x2d0008e, %g2
   set 0xcb4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=1,  ppnr=0x2e000000, p_addr=0xcb8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcb8) = 0x2e0008e (pte)
   set 0x2e0008e, %g2
   set 0xcb8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=1,  ppnr=0x2f000000, p_addr=0xcbc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcbc) = 0x2f0008e (pte)
   set 0x2f0008e, %g2
   set 0xcbc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=1,  ppnr=0x30000000, p_addr=0xcc0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcc0) = 0x300008e (pte)
   set 0x300008e, %g2
   set 0xcc0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=1,  ppnr=0x31000000, p_addr=0xcc4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcc4) = 0x310008e (pte)
   set 0x310008e, %g2
   set 0xcc4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=1,  ppnr=0x32000000, p_addr=0xcc8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcc8) = 0x320008e (pte)
   set 0x320008e, %g2
   set 0xcc8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=1,  ppnr=0x33000000, p_addr=0xccc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xccc) = 0x330008e (pte)
   set 0x330008e, %g2
   set 0xccc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=1,  ppnr=0x34000000, p_addr=0xcd0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcd0) = 0x340008e (pte)
   set 0x340008e, %g2
   set 0xcd0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=1,  ppnr=0x35000000, p_addr=0xcd4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcd4) = 0x350008e (pte)
   set 0x350008e, %g2
   set 0xcd4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=1,  ppnr=0x36000000, p_addr=0xcd8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcd8) = 0x360008e (pte)
   set 0x360008e, %g2
   set 0xcd8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=1,  ppnr=0x37000000, p_addr=0xcdc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcdc) = 0x370008e (pte)
   set 0x370008e, %g2
   set 0xcdc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=1,  ppnr=0x38000000, p_addr=0xce0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xce0) = 0x380008e (pte)
   set 0x380008e, %g2
   set 0xce0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=1,  ppnr=0x39000000, p_addr=0xce4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xce4) = 0x390008e (pte)
   set 0x390008e, %g2
   set 0xce4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=1,  ppnr=0x3a000000, p_addr=0xce8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xce8) = 0x3a0008e (pte)
   set 0x3a0008e, %g2
   set 0xce8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=1,  ppnr=0x3b000000, p_addr=0xcec, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcec) = 0x3b0008e (pte)
   set 0x3b0008e, %g2
   set 0xcec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=1,  ppnr=0x3c000000, p_addr=0xcf0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcf0) = 0x3c0008e (pte)
   set 0x3c0008e, %g2
   set 0xcf0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=1,  ppnr=0x3d000000, p_addr=0xcf4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcf4) = 0x3d0008e (pte)
   set 0x3d0008e, %g2
   set 0xcf4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=1,  ppnr=0x3e000000, p_addr=0xcf8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcf8) = 0x3e0008e (pte)
   set 0x3e0008e, %g2
   set 0xcf8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=1,  ppnr=0x3f000000, p_addr=0xcfc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcfc) = 0x3f0008e (pte)
   set 0x3f0008e, %g2
   set 0xcfc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=64, level=1,  ppnr=0x40000000, p_addr=0xd00, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd00) = 0x400008e (pte)
   set 0x400008e, %g2
   set 0xd00, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=65, level=1,  ppnr=0x41000000, p_addr=0xd04, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd04) = 0x410008e (pte)
   set 0x410008e, %g2
   set 0xd04, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=66, level=1,  ppnr=0x42000000, p_addr=0xd08, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd08) = 0x420008e (pte)
   set 0x420008e, %g2
   set 0xd08, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=67, level=1,  ppnr=0x43000000, p_addr=0xd0c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd0c) = 0x430008e (pte)
   set 0x430008e, %g2
   set 0xd0c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=68, level=1,  ppnr=0x44000000, p_addr=0xd10, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd10) = 0x440008e (pte)
   set 0x440008e, %g2
   set 0xd10, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=69, level=1,  ppnr=0x45000000, p_addr=0xd14, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd14) = 0x450008e (pte)
   set 0x450008e, %g2
   set 0xd14, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=70, level=1,  ppnr=0x46000000, p_addr=0xd18, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd18) = 0x460008e (pte)
   set 0x460008e, %g2
   set 0xd18, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=71, level=1,  ppnr=0x47000000, p_addr=0xd1c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd1c) = 0x470008e (pte)
   set 0x470008e, %g2
   set 0xd1c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=72, level=1,  ppnr=0x48000000, p_addr=0xd20, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd20) = 0x480008e (pte)
   set 0x480008e, %g2
   set 0xd20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=73, level=1,  ppnr=0x49000000, p_addr=0xd24, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd24) = 0x490008e (pte)
   set 0x490008e, %g2
   set 0xd24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=74, level=1,  ppnr=0x4a000000, p_addr=0xd28, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd28) = 0x4a0008e (pte)
   set 0x4a0008e, %g2
   set 0xd28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=75, level=1,  ppnr=0x4b000000, p_addr=0xd2c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd2c) = 0x4b0008e (pte)
   set 0x4b0008e, %g2
   set 0xd2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=76, level=1,  ppnr=0x4c000000, p_addr=0xd30, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd30) = 0x4c0008e (pte)
   set 0x4c0008e, %g2
   set 0xd30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=77, level=1,  ppnr=0x4d000000, p_addr=0xd34, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd34) = 0x4d0008e (pte)
   set 0x4d0008e, %g2
   set 0xd34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=78, level=1,  ppnr=0x4e000000, p_addr=0xd38, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd38) = 0x4e0008e (pte)
   set 0x4e0008e, %g2
   set 0xd38, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=79, level=1,  ppnr=0x4f000000, p_addr=0xd3c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd3c) = 0x4f0008e (pte)
   set 0x4f0008e, %g2
   set 0xd3c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=80, level=1,  ppnr=0x50000000, p_addr=0xd40, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd40) = 0x500008e (pte)
   set 0x500008e, %g2
   set 0xd40, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=81, level=1,  ppnr=0x51000000, p_addr=0xd44, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd44) = 0x510008e (pte)
   set 0x510008e, %g2
   set 0xd44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=82, level=1,  ppnr=0x52000000, p_addr=0xd48, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd48) = 0x520008e (pte)
   set 0x520008e, %g2
   set 0xd48, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=83, level=1,  ppnr=0x53000000, p_addr=0xd4c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd4c) = 0x530008e (pte)
   set 0x530008e, %g2
   set 0xd4c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=84, level=1,  ppnr=0x54000000, p_addr=0xd50, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd50) = 0x540008e (pte)
   set 0x540008e, %g2
   set 0xd50, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=85, level=1,  ppnr=0x55000000, p_addr=0xd54, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd54) = 0x550008e (pte)
   set 0x550008e, %g2
   set 0xd54, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=86, level=1,  ppnr=0x56000000, p_addr=0xd58, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd58) = 0x560008e (pte)
   set 0x560008e, %g2
   set 0xd58, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=87, level=1,  ppnr=0x57000000, p_addr=0xd5c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd5c) = 0x570008e (pte)
   set 0x570008e, %g2
   set 0xd5c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=88, level=1,  ppnr=0x58000000, p_addr=0xd60, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd60) = 0x580008e (pte)
   set 0x580008e, %g2
   set 0xd60, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=89, level=1,  ppnr=0x59000000, p_addr=0xd64, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd64) = 0x590008e (pte)
   set 0x590008e, %g2
   set 0xd64, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=90, level=1,  ppnr=0x5a000000, p_addr=0xd68, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd68) = 0x5a0008e (pte)
   set 0x5a0008e, %g2
   set 0xd68, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=91, level=1,  ppnr=0x5b000000, p_addr=0xd6c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd6c) = 0x5b0008e (pte)
   set 0x5b0008e, %g2
   set 0xd6c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=92, level=1,  ppnr=0x5c000000, p_addr=0xd70, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd70) = 0x5c0008e (pte)
   set 0x5c0008e, %g2
   set 0xd70, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=93, level=1,  ppnr=0x5d000000, p_addr=0xd74, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd74) = 0x5d0008e (pte)
   set 0x5d0008e, %g2
   set 0xd74, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=94, level=1,  ppnr=0x5e000000, p_addr=0xd78, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd78) = 0x5e0008e (pte)
   set 0x5e0008e, %g2
   set 0xd78, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=95, level=1,  ppnr=0x5f000000, p_addr=0xd7c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd7c) = 0x5f0008e (pte)
   set 0x5f0008e, %g2
   set 0xd7c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=96, level=1,  ppnr=0x60000000, p_addr=0xd80, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd80) = 0x600008e (pte)
   set 0x600008e, %g2
   set 0xd80, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=97, level=1,  ppnr=0x61000000, p_addr=0xd84, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd84) = 0x610008e (pte)
   set 0x610008e, %g2
   set 0xd84, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=98, level=1,  ppnr=0x62000000, p_addr=0xd88, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd88) = 0x620008e (pte)
   set 0x620008e, %g2
   set 0xd88, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=99, level=1,  ppnr=0x63000000, p_addr=0xd8c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd8c) = 0x630008e (pte)
   set 0x630008e, %g2
   set 0xd8c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=100, level=1, child_p_addr=0x700, p_addr=0xd90
   ! *(PAGE_TABLE_BASE + 0xd90) = ptd(PAGE_TABLE_BASE + 0x700)
   ! make PTD from 0x700
   set 0x700, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xd90, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=2, child_p_addr=0x600, p_addr=0x700
   ! *(PAGE_TABLE_BASE + 0x700) = ptd(PAGE_TABLE_BASE + 0x600)
   ! make PTD from 0x600
   set 0x600, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x700, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x64000000, p_addr=0x600, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x600) = 0x6400092 (pte)
   set 0x6400092, %g2
   set 0x600, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=255, level=1, child_p_addr=0x9fc, p_addr=0xffc
   ! *(PAGE_TABLE_BASE + 0xffc) = ptd(PAGE_TABLE_BASE + 0x900)
   ! make PTD from 0x9fc
   set 0x900, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xffc, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=63, level=2, child_p_addr=0x8c0, p_addr=0x9fc
   ! *(PAGE_TABLE_BASE + 0x9fc) = ptd(PAGE_TABLE_BASE + 0x800)
   ! make PTD from 0x8c0
   set 0x800, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x9fc, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=48, level=3,  ppnr=0xffff0000, p_addr=0x8c0, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c0) = 0xffff00e (pte)
   set 0xffff00e, %g2
   set 0x8c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=3,  ppnr=0xffff1000, p_addr=0x8c4, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c4) = 0xffff10e (pte)
   set 0xffff10e, %g2
   set 0x8c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=3,  ppnr=0xffff2000, p_addr=0x8c8, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c8) = 0xffff20e (pte)
   set 0xffff20e, %g2
   set 0x8c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=3,  ppnr=0xffff3000, p_addr=0x8cc, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8cc) = 0xffff30e (pte)
   set 0xffff30e, %g2
   set 0x8cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=3,  ppnr=0xffff4000, p_addr=0x8d0, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8d0) = 0xffff40e (pte)
   set 0xffff40e, %g2
   set 0x8d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=3,  ppnr=0xffff5000, p_addr=0x8d4, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8d4) = 0xffff50e (pte)
   set 0xffff50e, %g2
   set 0x8d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=3,  ppnr=0xffff6000, p_addr=0x8d8, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8d8) = 0xffff60e (pte)
   set 0xffff60e, %g2
   set 0x8d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=3,  ppnr=0xffff7000, p_addr=0x8dc, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8dc) = 0xffff70e (pte)
   set 0xffff70e, %g2
   set 0x8dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=3,  ppnr=0xffff8000, p_addr=0x8e0, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8e0) = 0xffff80e (pte)
   set 0xffff80e, %g2
   set 0x8e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=3,  ppnr=0xffff9000, p_addr=0x8e4, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8e4) = 0xffff90e (pte)
   set 0xffff90e, %g2
   set 0x8e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=3,  ppnr=0xffffa000, p_addr=0x8e8, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8e8) = 0xffffa0e (pte)
   set 0xffffa0e, %g2
   set 0x8e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=3,  ppnr=0xffffb000, p_addr=0x8ec, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8ec) = 0xffffb0e (pte)
   set 0xffffb0e, %g2
   set 0x8ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=3,  ppnr=0xffffc000, p_addr=0x8f0, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8f0) = 0xffffc0e (pte)
   set 0xffffc0e, %g2
   set 0x8f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=3,  ppnr=0xffffd000, p_addr=0x8f4, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8f4) = 0xffffd0e (pte)
   set 0xffffd0e, %g2
   set 0x8f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=3,  ppnr=0xffffe000, p_addr=0x8f8, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8f8) = 0xffffe0e (pte)
   set 0xffffe0e, %g2
   set 0x8f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=3,  ppnr=0xfffff000, p_addr=0x8fc, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8fc) = 0xfffff0e (pte)
   set 0xfffff0e, %g2
   set 0x8fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   retl;
   nop;
! done: page_table_setup
! start: set context-table-pointer = PAGE_TABLE_BASE + 0x1000
.global set_context_table_pointer
set_context_table_pointer:
   set PAGE_TABLE_BASE, %g1
   set 0x1000, %g5
   add %g5, %g1, %g2
   srl  %g2, 0x4, %g2
   or  %g2, 0x1, %g2
   set 0x100, %g3
   sta %g2, [%g3] 0x4
   retl;
   nop;
! done: set  context-table-pointer
.align 1024
PAGE_TABLE_BASE: .skip 5120
