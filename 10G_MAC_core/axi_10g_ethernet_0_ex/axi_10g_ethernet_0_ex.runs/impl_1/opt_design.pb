
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2%
xc7vx690t-ffg17612default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2%
xc7vx690t-ffg17612default:defaultZ17-349h px? 
?
?The version limit for your license is '%s' and will expire in %s days. A version limit expiration means that, although you may be able to continue to use the current version of tools or IP with this license, you will not be eligible for any updates or new releases.
519*common2
2017.072default:default2
-17322default:defaultZ17-1223h px? 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px? 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px? 
t
Command: %s
53*	vivadotcl2C
/report_drc (run_mandatory_drcs) for: opt_checks2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px? 
q
%s completed successfully
29*	vivadotcl23
report_drc (run_mandatory_drcs)2default:defaultZ4-42h px? 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px? 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:02 ; elapsed = 00:00:00.83 . Memory (MB): peak = 2421.492 ; gain = 32.012 ; free physical = 220 ; free virtual = 100232default:defaulth px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px? 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12default:default2
22default:defaultZ31-138h px? 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px? 
;
&Phase 1 Retarget | Checksum: 65790302
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.89 ; elapsed = 00:00:00.64 . Memory (MB): peak = 2421.492 ; gain = 0.000 ; free physical = 221 ; free virtual = 100242default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2
Retarget2default:default2
02default:default2
1042default:defaultZ31-389h px? 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px? 
v
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
42default:default2
122default:defaultZ31-138h px? 
G
2Phase 2 Constant propagation | Checksum: 489dc7b1
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 2421.492 ; gain = 0.000 ; free physical = 219 ; free virtual = 100222default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
4382default:default2
8702default:defaultZ31-389h px? 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px? 
8
#Phase 3 Sweep | Checksum: 8cb50d65
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:03 ; elapsed = 00:00:02 . Memory (MB): peak = 2421.492 ; gain = 0.000 ; free physical = 219 ; free virtual = 100222default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
02default:default2
6152default:defaultZ31-389h px? 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px? 
D
/Phase 4 BUFG optimization | Checksum: 8cb50d65
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 2421.492 ; gain = 0.000 ; free physical = 219 ; free virtual = 100222default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2%
BUFG optimization2default:default2
02default:default2
02default:defaultZ31-389h px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px? 
N
9Phase 5 Shift Register Optimization | Checksum: 8cb50d65
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 2421.492 ; gain = 0.000 ; free physical = 219 ; free virtual = 100222default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2/
Shift Register Optimization2default:default2
02default:default2
02default:defaultZ31-389h px? 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.03 ; elapsed = 00:00:00.02 . Memory (MB): peak = 2421.492 ; gain = 0.000 ; free physical = 219 ; free virtual = 100222default:defaulth px? 
I
4Ending Logic Optimization Task | Checksum: 8cb50d65
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 2421.492 ; gain = 0.000 ; free physical = 219 ; free virtual = 100222default:defaulth px? 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px? 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px? 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px? 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 


*pwropth px? 
e

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px? 
?
?WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02default:default2
42default:defaultZ34-162h px? 
d
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201h px? 
?
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
12default:default2
02default:default2
82default:defaultZ34-65h px? 
M
8Ending PowerOpt Patch Enables Task | Checksum: a5143090
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:00.03 ; elapsed = 00:00:00.03 . Memory (MB): peak = 2584.598 ; gain = 0.000 ; free physical = 267 ; free virtual = 100132default:defaulth px? 
I
4Ending Power Optimization Task | Checksum: a5143090
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:00:04 ; elapsed = 00:00:03 . Memory (MB): peak = 2584.598 ; gain = 163.105 ; free physical = 273 ; free virtual = 100192default:defaulth px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
342default:default2
52default:default2
12default:default2
02default:defaultZ4-41h px? 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
opt_design: 2default:default2
00:00:102default:default2
00:00:472default:default2
2584.5982default:default2
195.1212default:default2
2732default:default2
100192default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/impl_1/axi_10g_ethernet_0_example_design_opt.dcp2default:defaultZ17-1381h px? 
?
Command: %s
53*	vivadotcl2T
@report_drc -file axi_10g_ethernet_0_example_design_drc_opted.rpt2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/impl_1/axi_10g_ethernet_0_example_design_drc_opted.rpt?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/impl_1/axi_10g_ethernet_0_example_design_drc_opted.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 


End Record