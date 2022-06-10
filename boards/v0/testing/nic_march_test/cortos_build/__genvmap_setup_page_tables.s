.section .text.pagetablesetup
.global page_table_setup
page_table_setup:
   set PAGE_TABLE_BASE, %g1
   !PTD: context=0, index=0, level=0, child_p_addr=0x800, p_addr=0xc00
   ! *(PAGE_TABLE_BASE + 0xc00) = ptd(PAGE_TABLE_BASE + 0x800)
   ! make PTD from 0x800
   set 0x800, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xc00, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=1, child_p_addr=0x100, p_addr=0x800
   ! *(PAGE_TABLE_BASE + 0x800) = ptd(PAGE_TABLE_BASE + 0x100)
   ! make PTD from 0x100
   set 0x100, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x800, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=2, child_p_addr=0x0, p_addr=0x100
   ! *(PAGE_TABLE_BASE + 0x100) = ptd(PAGE_TABLE_BASE + 0x0)
   ! make PTD from 0x0
   set 0x0, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x100, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x0, p_addr=0x0, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x0) = 0x8a (pte)
   set 0x8a, %g2
   set 0x0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=3,  ppnr=0x1000, p_addr=0x4, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4) = 0x18a (pte)
   set 0x18a, %g2
   set 0x4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=3,  ppnr=0x2000, p_addr=0x8, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x8) = 0x28a (pte)
   set 0x28a, %g2
   set 0x8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=3,  ppnr=0x3000, p_addr=0xc, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0xc) = 0x38a (pte)
   set 0x38a, %g2
   set 0xc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=3,  ppnr=0x4000, p_addr=0x10, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x10) = 0x48a (pte)
   set 0x48a, %g2
   set 0x10, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=3,  ppnr=0x5000, p_addr=0x14, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x14) = 0x58a (pte)
   set 0x58a, %g2
   set 0x14, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=3,  ppnr=0x6000, p_addr=0x18, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x18) = 0x68a (pte)
   set 0x68a, %g2
   set 0x18, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=3,  ppnr=0x7000, p_addr=0x1c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x1c) = 0x78a (pte)
   set 0x78a, %g2
   set 0x1c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=3,  ppnr=0x8000, p_addr=0x20, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x20) = 0x88a (pte)
   set 0x88a, %g2
   set 0x20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=3,  ppnr=0x9000, p_addr=0x24, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x24) = 0x98a (pte)
   set 0x98a, %g2
   set 0x24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=3,  ppnr=0xa000, p_addr=0x28, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x28) = 0xa8e (pte)
   set 0xa8e, %g2
   set 0x28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=3,  ppnr=0xb000, p_addr=0x2c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x2c) = 0xb8e (pte)
   set 0xb8e, %g2
   set 0x2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=3,  ppnr=0xc000, p_addr=0x30, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x30) = 0xc8e (pte)
   set 0xc8e, %g2
   set 0x30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=3,  ppnr=0xd000, p_addr=0x34, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x34) = 0xd0e (pte)
   set 0xd0e, %g2
   set 0x34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x200000, p_addr=0x120, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x120) = 0x20016 (pte)
   set 0x20016, %g2
   set 0x120, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x240000, p_addr=0x124, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x124) = 0x24016 (pte)
   set 0x24016, %g2
   set 0x124, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x280000, p_addr=0x128, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x128) = 0x28016 (pte)
   set 0x28016, %g2
   set 0x128, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x2c0000, p_addr=0x12c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x12c) = 0x2c016 (pte)
   set 0x2c016, %g2
   set 0x12c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x300000, p_addr=0x130, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x130) = 0x30016 (pte)
   set 0x30016, %g2
   set 0x130, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x340000, p_addr=0x134, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x134) = 0x34016 (pte)
   set 0x34016, %g2
   set 0x134, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x380000, p_addr=0x138, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x138) = 0x38016 (pte)
   set 0x38016, %g2
   set 0x138, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x3c0000, p_addr=0x13c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x13c) = 0x3c016 (pte)
   set 0x3c016, %g2
   set 0x13c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=1,  ppnr=0x1000000, p_addr=0x804, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x804) = 0x10008e (pte)
   set 0x10008e, %g2
   set 0x804, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=1,  ppnr=0x2000000, p_addr=0x808, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x808) = 0x20008e (pte)
   set 0x20008e, %g2
   set 0x808, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=1,  ppnr=0x3000000, p_addr=0x80c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x80c) = 0x30008e (pte)
   set 0x30008e, %g2
   set 0x80c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=1,  ppnr=0x4000000, p_addr=0x810, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x810) = 0x40008e (pte)
   set 0x40008e, %g2
   set 0x810, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=1,  ppnr=0x5000000, p_addr=0x814, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x814) = 0x50008e (pte)
   set 0x50008e, %g2
   set 0x814, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=1,  ppnr=0x6000000, p_addr=0x818, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x818) = 0x60008e (pte)
   set 0x60008e, %g2
   set 0x818, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=1,  ppnr=0x7000000, p_addr=0x81c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x81c) = 0x70008e (pte)
   set 0x70008e, %g2
   set 0x81c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=1,  ppnr=0x8000000, p_addr=0x820, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x820) = 0x80008e (pte)
   set 0x80008e, %g2
   set 0x820, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=1,  ppnr=0x9000000, p_addr=0x824, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x824) = 0x90008e (pte)
   set 0x90008e, %g2
   set 0x824, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=1,  ppnr=0xa000000, p_addr=0x828, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x828) = 0xa0008e (pte)
   set 0xa0008e, %g2
   set 0x828, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=1,  ppnr=0xb000000, p_addr=0x82c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x82c) = 0xb0008e (pte)
   set 0xb0008e, %g2
   set 0x82c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=1,  ppnr=0xc000000, p_addr=0x830, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x830) = 0xc0008e (pte)
   set 0xc0008e, %g2
   set 0x830, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=1,  ppnr=0xd000000, p_addr=0x834, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x834) = 0xd0008e (pte)
   set 0xd0008e, %g2
   set 0x834, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=1,  ppnr=0xe000000, p_addr=0x838, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x838) = 0xe0008e (pte)
   set 0xe0008e, %g2
   set 0x838, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=1,  ppnr=0xf000000, p_addr=0x83c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x83c) = 0xf0008e (pte)
   set 0xf0008e, %g2
   set 0x83c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=1,  ppnr=0x10000000, p_addr=0x840, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x840) = 0x100008e (pte)
   set 0x100008e, %g2
   set 0x840, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=1,  ppnr=0x11000000, p_addr=0x844, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x844) = 0x110008e (pte)
   set 0x110008e, %g2
   set 0x844, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=1,  ppnr=0x12000000, p_addr=0x848, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x848) = 0x120008e (pte)
   set 0x120008e, %g2
   set 0x848, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=1,  ppnr=0x13000000, p_addr=0x84c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x84c) = 0x130008e (pte)
   set 0x130008e, %g2
   set 0x84c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=1,  ppnr=0x14000000, p_addr=0x850, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x850) = 0x140008e (pte)
   set 0x140008e, %g2
   set 0x850, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=1,  ppnr=0x15000000, p_addr=0x854, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x854) = 0x150008e (pte)
   set 0x150008e, %g2
   set 0x854, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=1,  ppnr=0x16000000, p_addr=0x858, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x858) = 0x160008e (pte)
   set 0x160008e, %g2
   set 0x858, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=1,  ppnr=0x17000000, p_addr=0x85c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x85c) = 0x170008e (pte)
   set 0x170008e, %g2
   set 0x85c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=1,  ppnr=0x18000000, p_addr=0x860, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x860) = 0x180008e (pte)
   set 0x180008e, %g2
   set 0x860, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=1,  ppnr=0x19000000, p_addr=0x864, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x864) = 0x190008e (pte)
   set 0x190008e, %g2
   set 0x864, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=1,  ppnr=0x1a000000, p_addr=0x868, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x868) = 0x1a0008e (pte)
   set 0x1a0008e, %g2
   set 0x868, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=1,  ppnr=0x1b000000, p_addr=0x86c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x86c) = 0x1b0008e (pte)
   set 0x1b0008e, %g2
   set 0x86c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=1,  ppnr=0x1c000000, p_addr=0x870, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x870) = 0x1c0008e (pte)
   set 0x1c0008e, %g2
   set 0x870, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=1,  ppnr=0x1d000000, p_addr=0x874, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x874) = 0x1d0008e (pte)
   set 0x1d0008e, %g2
   set 0x874, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=1,  ppnr=0x1e000000, p_addr=0x878, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x878) = 0x1e0008e (pte)
   set 0x1e0008e, %g2
   set 0x878, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=1,  ppnr=0x1f000000, p_addr=0x87c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x87c) = 0x1f0008e (pte)
   set 0x1f0008e, %g2
   set 0x87c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=32, level=1, child_p_addr=0x300, p_addr=0x880
   ! *(PAGE_TABLE_BASE + 0x880) = ptd(PAGE_TABLE_BASE + 0x300)
   ! make PTD from 0x300
   set 0x300, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x880, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x20000000, p_addr=0x300, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x300) = 0x200008e (pte)
   set 0x200008e, %g2
   set 0x300, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x20040000, p_addr=0x304, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x304) = 0x200408e (pte)
   set 0x200408e, %g2
   set 0x304, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x20080000, p_addr=0x308, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x308) = 0x200808e (pte)
   set 0x200808e, %g2
   set 0x308, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x200c0000, p_addr=0x30c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x30c) = 0x200c08e (pte)
   set 0x200c08e, %g2
   set 0x30c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x20100000, p_addr=0x310, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x310) = 0x201008e (pte)
   set 0x201008e, %g2
   set 0x310, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x20140000, p_addr=0x314, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x314) = 0x201408e (pte)
   set 0x201408e, %g2
   set 0x314, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x20180000, p_addr=0x318, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x318) = 0x201808e (pte)
   set 0x201808e, %g2
   set 0x318, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x201c0000, p_addr=0x31c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x31c) = 0x201c08e (pte)
   set 0x201c08e, %g2
   set 0x31c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x20200000, p_addr=0x320, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x320) = 0x202008e (pte)
   set 0x202008e, %g2
   set 0x320, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x20240000, p_addr=0x324, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x324) = 0x202408e (pte)
   set 0x202408e, %g2
   set 0x324, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x20280000, p_addr=0x328, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x328) = 0x202808e (pte)
   set 0x202808e, %g2
   set 0x328, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x202c0000, p_addr=0x32c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x32c) = 0x202c08e (pte)
   set 0x202c08e, %g2
   set 0x32c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x20300000, p_addr=0x330, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x330) = 0x203008e (pte)
   set 0x203008e, %g2
   set 0x330, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x20340000, p_addr=0x334, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x334) = 0x203408e (pte)
   set 0x203408e, %g2
   set 0x334, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x20380000, p_addr=0x338, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x338) = 0x203808e (pte)
   set 0x203808e, %g2
   set 0x338, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x203c0000, p_addr=0x33c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x33c) = 0x203c08e (pte)
   set 0x203c08e, %g2
   set 0x33c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=16, level=2, child_p_addr=0x200, p_addr=0x340
   ! *(PAGE_TABLE_BASE + 0x340) = ptd(PAGE_TABLE_BASE + 0x200)
   ! make PTD from 0x200
   set 0x200, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x340, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x20400000, p_addr=0x200, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x200) = 0x2040092 (pte)
   set 0x2040092, %g2
   set 0x200, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=1,  ppnr=0x21000000, p_addr=0x884, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x884) = 0x210008e (pte)
   set 0x210008e, %g2
   set 0x884, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=1,  ppnr=0x22000000, p_addr=0x888, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x888) = 0x220008e (pte)
   set 0x220008e, %g2
   set 0x888, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=1,  ppnr=0x23000000, p_addr=0x88c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x88c) = 0x230008e (pte)
   set 0x230008e, %g2
   set 0x88c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=1,  ppnr=0x24000000, p_addr=0x890, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x890) = 0x240008e (pte)
   set 0x240008e, %g2
   set 0x890, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=1,  ppnr=0x25000000, p_addr=0x894, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x894) = 0x250008e (pte)
   set 0x250008e, %g2
   set 0x894, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=1,  ppnr=0x26000000, p_addr=0x898, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x898) = 0x260008e (pte)
   set 0x260008e, %g2
   set 0x898, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=1,  ppnr=0x27000000, p_addr=0x89c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x89c) = 0x270008e (pte)
   set 0x270008e, %g2
   set 0x89c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=1,  ppnr=0x28000000, p_addr=0x8a0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8a0) = 0x280008e (pte)
   set 0x280008e, %g2
   set 0x8a0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=1,  ppnr=0x29000000, p_addr=0x8a4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8a4) = 0x290008e (pte)
   set 0x290008e, %g2
   set 0x8a4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=1,  ppnr=0x2a000000, p_addr=0x8a8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8a8) = 0x2a0008e (pte)
   set 0x2a0008e, %g2
   set 0x8a8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=1,  ppnr=0x2b000000, p_addr=0x8ac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8ac) = 0x2b0008e (pte)
   set 0x2b0008e, %g2
   set 0x8ac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=1,  ppnr=0x2c000000, p_addr=0x8b0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8b0) = 0x2c0008e (pte)
   set 0x2c0008e, %g2
   set 0x8b0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=1,  ppnr=0x2d000000, p_addr=0x8b4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8b4) = 0x2d0008e (pte)
   set 0x2d0008e, %g2
   set 0x8b4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=1,  ppnr=0x2e000000, p_addr=0x8b8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8b8) = 0x2e0008e (pte)
   set 0x2e0008e, %g2
   set 0x8b8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=1,  ppnr=0x2f000000, p_addr=0x8bc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8bc) = 0x2f0008e (pte)
   set 0x2f0008e, %g2
   set 0x8bc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=1,  ppnr=0x30000000, p_addr=0x8c0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c0) = 0x300008e (pte)
   set 0x300008e, %g2
   set 0x8c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=1,  ppnr=0x31000000, p_addr=0x8c4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c4) = 0x310008e (pte)
   set 0x310008e, %g2
   set 0x8c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=1,  ppnr=0x32000000, p_addr=0x8c8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c8) = 0x320008e (pte)
   set 0x320008e, %g2
   set 0x8c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=1,  ppnr=0x33000000, p_addr=0x8cc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8cc) = 0x330008e (pte)
   set 0x330008e, %g2
   set 0x8cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=1,  ppnr=0x34000000, p_addr=0x8d0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8d0) = 0x340008e (pte)
   set 0x340008e, %g2
   set 0x8d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=1,  ppnr=0x35000000, p_addr=0x8d4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8d4) = 0x350008e (pte)
   set 0x350008e, %g2
   set 0x8d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=1,  ppnr=0x36000000, p_addr=0x8d8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8d8) = 0x360008e (pte)
   set 0x360008e, %g2
   set 0x8d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=1,  ppnr=0x37000000, p_addr=0x8dc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8dc) = 0x370008e (pte)
   set 0x370008e, %g2
   set 0x8dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=1,  ppnr=0x38000000, p_addr=0x8e0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8e0) = 0x380008e (pte)
   set 0x380008e, %g2
   set 0x8e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=1,  ppnr=0x39000000, p_addr=0x8e4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8e4) = 0x390008e (pte)
   set 0x390008e, %g2
   set 0x8e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=1,  ppnr=0x3a000000, p_addr=0x8e8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8e8) = 0x3a0008e (pte)
   set 0x3a0008e, %g2
   set 0x8e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=1,  ppnr=0x3b000000, p_addr=0x8ec, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8ec) = 0x3b0008e (pte)
   set 0x3b0008e, %g2
   set 0x8ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=1,  ppnr=0x3c000000, p_addr=0x8f0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8f0) = 0x3c0008e (pte)
   set 0x3c0008e, %g2
   set 0x8f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=1,  ppnr=0x3d000000, p_addr=0x8f4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8f4) = 0x3d0008e (pte)
   set 0x3d0008e, %g2
   set 0x8f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=1,  ppnr=0x3e000000, p_addr=0x8f8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8f8) = 0x3e0008e (pte)
   set 0x3e0008e, %g2
   set 0x8f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=1,  ppnr=0x3f000000, p_addr=0x8fc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8fc) = 0x3f0008e (pte)
   set 0x3f0008e, %g2
   set 0x8fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=64, level=1,  ppnr=0x40000000, p_addr=0x900, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x900) = 0x400008e (pte)
   set 0x400008e, %g2
   set 0x900, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=65, level=1,  ppnr=0x41000000, p_addr=0x904, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x904) = 0x410008e (pte)
   set 0x410008e, %g2
   set 0x904, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=66, level=1,  ppnr=0x42000000, p_addr=0x908, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x908) = 0x420008e (pte)
   set 0x420008e, %g2
   set 0x908, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=67, level=1,  ppnr=0x43000000, p_addr=0x90c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x90c) = 0x430008e (pte)
   set 0x430008e, %g2
   set 0x90c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=68, level=1,  ppnr=0x44000000, p_addr=0x910, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x910) = 0x440008e (pte)
   set 0x440008e, %g2
   set 0x910, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=69, level=1,  ppnr=0x45000000, p_addr=0x914, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x914) = 0x450008e (pte)
   set 0x450008e, %g2
   set 0x914, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=70, level=1,  ppnr=0x46000000, p_addr=0x918, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x918) = 0x460008e (pte)
   set 0x460008e, %g2
   set 0x918, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=71, level=1,  ppnr=0x47000000, p_addr=0x91c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x91c) = 0x470008e (pte)
   set 0x470008e, %g2
   set 0x91c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=72, level=1,  ppnr=0x48000000, p_addr=0x920, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x920) = 0x480008e (pte)
   set 0x480008e, %g2
   set 0x920, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=73, level=1,  ppnr=0x49000000, p_addr=0x924, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x924) = 0x490008e (pte)
   set 0x490008e, %g2
   set 0x924, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=74, level=1,  ppnr=0x4a000000, p_addr=0x928, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x928) = 0x4a0008e (pte)
   set 0x4a0008e, %g2
   set 0x928, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=75, level=1,  ppnr=0x4b000000, p_addr=0x92c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x92c) = 0x4b0008e (pte)
   set 0x4b0008e, %g2
   set 0x92c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=76, level=1,  ppnr=0x4c000000, p_addr=0x930, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x930) = 0x4c0008e (pte)
   set 0x4c0008e, %g2
   set 0x930, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=77, level=1,  ppnr=0x4d000000, p_addr=0x934, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x934) = 0x4d0008e (pte)
   set 0x4d0008e, %g2
   set 0x934, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=78, level=1,  ppnr=0x4e000000, p_addr=0x938, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x938) = 0x4e0008e (pte)
   set 0x4e0008e, %g2
   set 0x938, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=79, level=1,  ppnr=0x4f000000, p_addr=0x93c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x93c) = 0x4f0008e (pte)
   set 0x4f0008e, %g2
   set 0x93c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=80, level=1,  ppnr=0x50000000, p_addr=0x940, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x940) = 0x500008e (pte)
   set 0x500008e, %g2
   set 0x940, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=81, level=1,  ppnr=0x51000000, p_addr=0x944, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x944) = 0x510008e (pte)
   set 0x510008e, %g2
   set 0x944, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=82, level=1,  ppnr=0x52000000, p_addr=0x948, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x948) = 0x520008e (pte)
   set 0x520008e, %g2
   set 0x948, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=83, level=1,  ppnr=0x53000000, p_addr=0x94c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x94c) = 0x530008e (pte)
   set 0x530008e, %g2
   set 0x94c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=84, level=1,  ppnr=0x54000000, p_addr=0x950, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x950) = 0x540008e (pte)
   set 0x540008e, %g2
   set 0x950, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=85, level=1,  ppnr=0x55000000, p_addr=0x954, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x954) = 0x550008e (pte)
   set 0x550008e, %g2
   set 0x954, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=86, level=1,  ppnr=0x56000000, p_addr=0x958, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x958) = 0x560008e (pte)
   set 0x560008e, %g2
   set 0x958, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=87, level=1,  ppnr=0x57000000, p_addr=0x95c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x95c) = 0x570008e (pte)
   set 0x570008e, %g2
   set 0x95c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=88, level=1,  ppnr=0x58000000, p_addr=0x960, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x960) = 0x580008e (pte)
   set 0x580008e, %g2
   set 0x960, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=89, level=1,  ppnr=0x59000000, p_addr=0x964, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x964) = 0x590008e (pte)
   set 0x590008e, %g2
   set 0x964, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=90, level=1,  ppnr=0x5a000000, p_addr=0x968, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x968) = 0x5a0008e (pte)
   set 0x5a0008e, %g2
   set 0x968, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=91, level=1,  ppnr=0x5b000000, p_addr=0x96c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x96c) = 0x5b0008e (pte)
   set 0x5b0008e, %g2
   set 0x96c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=92, level=1,  ppnr=0x5c000000, p_addr=0x970, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x970) = 0x5c0008e (pte)
   set 0x5c0008e, %g2
   set 0x970, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=93, level=1,  ppnr=0x5d000000, p_addr=0x974, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x974) = 0x5d0008e (pte)
   set 0x5d0008e, %g2
   set 0x974, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=94, level=1,  ppnr=0x5e000000, p_addr=0x978, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x978) = 0x5e0008e (pte)
   set 0x5e0008e, %g2
   set 0x978, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=95, level=1,  ppnr=0x5f000000, p_addr=0x97c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x97c) = 0x5f0008e (pte)
   set 0x5f0008e, %g2
   set 0x97c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=96, level=1,  ppnr=0x60000000, p_addr=0x980, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x980) = 0x600008e (pte)
   set 0x600008e, %g2
   set 0x980, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=97, level=1, child_p_addr=0x500, p_addr=0x984
   ! *(PAGE_TABLE_BASE + 0x984) = ptd(PAGE_TABLE_BASE + 0x500)
   ! make PTD from 0x500
   set 0x500, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x984, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=2, child_p_addr=0x400, p_addr=0x500
   ! *(PAGE_TABLE_BASE + 0x500) = ptd(PAGE_TABLE_BASE + 0x400)
   ! make PTD from 0x400
   set 0x400, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x500, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x61000000, p_addr=0x400, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x400) = 0x6100092 (pte)
   set 0x6100092, %g2
   set 0x400, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=255, level=1, child_p_addr=0x7fc, p_addr=0xbfc
   ! *(PAGE_TABLE_BASE + 0xbfc) = ptd(PAGE_TABLE_BASE + 0x700)
   ! make PTD from 0x7fc
   set 0x700, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xbfc, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=63, level=2, child_p_addr=0x6c0, p_addr=0x7fc
   ! *(PAGE_TABLE_BASE + 0x7fc) = ptd(PAGE_TABLE_BASE + 0x600)
   ! make PTD from 0x6c0
   set 0x600, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x7fc, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=48, level=3,  ppnr=0xffff0000, p_addr=0x6c0, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6c0) = 0xffff00e (pte)
   set 0xffff00e, %g2
   set 0x6c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=3,  ppnr=0xffff1000, p_addr=0x6c4, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6c4) = 0xffff10e (pte)
   set 0xffff10e, %g2
   set 0x6c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=3,  ppnr=0xffff2000, p_addr=0x6c8, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6c8) = 0xffff20e (pte)
   set 0xffff20e, %g2
   set 0x6c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=3,  ppnr=0xffff3000, p_addr=0x6cc, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6cc) = 0xffff30e (pte)
   set 0xffff30e, %g2
   set 0x6cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=3,  ppnr=0xffff4000, p_addr=0x6d0, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6d0) = 0xffff40e (pte)
   set 0xffff40e, %g2
   set 0x6d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=3,  ppnr=0xffff5000, p_addr=0x6d4, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6d4) = 0xffff50e (pte)
   set 0xffff50e, %g2
   set 0x6d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=3,  ppnr=0xffff6000, p_addr=0x6d8, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6d8) = 0xffff60e (pte)
   set 0xffff60e, %g2
   set 0x6d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=3,  ppnr=0xffff7000, p_addr=0x6dc, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6dc) = 0xffff70e (pte)
   set 0xffff70e, %g2
   set 0x6dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=3,  ppnr=0xffff8000, p_addr=0x6e0, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6e0) = 0xffff80e (pte)
   set 0xffff80e, %g2
   set 0x6e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=3,  ppnr=0xffff9000, p_addr=0x6e4, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6e4) = 0xffff90e (pte)
   set 0xffff90e, %g2
   set 0x6e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=3,  ppnr=0xffffa000, p_addr=0x6e8, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6e8) = 0xffffa0e (pte)
   set 0xffffa0e, %g2
   set 0x6e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=3,  ppnr=0xffffb000, p_addr=0x6ec, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6ec) = 0xffffb0e (pte)
   set 0xffffb0e, %g2
   set 0x6ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=3,  ppnr=0xffffc000, p_addr=0x6f0, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6f0) = 0xffffc0e (pte)
   set 0xffffc0e, %g2
   set 0x6f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=3,  ppnr=0xffffd000, p_addr=0x6f4, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6f4) = 0xffffd0e (pte)
   set 0xffffd0e, %g2
   set 0x6f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=3,  ppnr=0xffffe000, p_addr=0x6f8, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6f8) = 0xffffe0e (pte)
   set 0xffffe0e, %g2
   set 0x6f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=3,  ppnr=0xfffff000, p_addr=0x6fc, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6fc) = 0xfffff0e (pte)
   set 0xfffff0e, %g2
   set 0x6fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   retl;
   nop;
! done: page_table_setup
! start: set context-table-pointer = PAGE_TABLE_BASE + 0xc00
.global set_context_table_pointer
set_context_table_pointer:
   set PAGE_TABLE_BASE, %g1
   set 0xc00, %g5
   add %g5, %g1, %g2
   srl  %g2, 0x4, %g2
   or  %g2, 0x1, %g2
   set 0x100, %g3
   sta %g2, [%g3] 0x4
   retl;
   nop;
! done: set  context-table-pointer
.align 1024
PAGE_TABLE_BASE: .skip 4096
