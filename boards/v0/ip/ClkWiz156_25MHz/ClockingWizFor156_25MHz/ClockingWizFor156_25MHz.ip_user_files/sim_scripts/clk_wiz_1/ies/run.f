-makelib ies/xil_defaultlib -sv \
  "/home/harshad/Vivado/2017.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies/xpm \
  "/home/harshad/Vivado/2017.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../../ClockingWizFor156_25MHz.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1_clk_wiz.v" \
  "../../../../ClockingWizFor156_25MHz.srcs/sources_1/ip/clk_wiz_1/clk_wiz_1.v" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

