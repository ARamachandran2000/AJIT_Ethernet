
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
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
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
w
Command: %s
53*	vivadotcl2F
2report_drc (run_mandatory_drcs) for: router_checks2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px? 
q
%s completed successfully
29*	vivadotcl23
report_drc (run_mandatory_drcs)2default:defaultZ4-42h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
42default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
B
-Phase 1 Build RT Design | Checksum: f136e13b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:04 ; elapsed = 00:00:36 . Memory (MB): peak = 2999.250 ; gain = 414.652 ; free physical = 207 ; free virtual = 95682default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
A
,Phase 2.1 Create Timer | Checksum: f136e13b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:04 ; elapsed = 00:00:36 . Memory (MB): peak = 2999.250 ; gain = 414.652 ; free physical = 206 ; free virtual = 95682default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
M
8Phase 2.2 Fix Topology Constraints | Checksum: f136e13b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:04 ; elapsed = 00:00:37 . Memory (MB): peak = 2999.250 ; gain = 414.652 ; free physical = 172 ; free virtual = 95352default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
F
1Phase 2.3 Pre Route Cleanup | Checksum: f136e13b
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:04 ; elapsed = 00:00:37 . Memory (MB): peak = 2999.250 ; gain = 414.652 ; free physical = 172 ; free virtual = 95352default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.4 Update Timing | Checksum: 26373c64d
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:11 ; elapsed = 00:00:42 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 296 ; free virtual = 95352default:defaulth px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=0.596  | TNS=0.000  | WHS=-0.483 | THS=-667.708|
2default:defaultZ35-416h px? 
I
4Phase 2 Router Initialization | Checksum: 23706e2bd
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:13 ; elapsed = 00:00:43 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 280 ; free virtual = 95262default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
C
.Phase 3 Initial Routing | Checksum: 1a7d40a11
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:16 ; elapsed = 00:00:44 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 269 ; free virtual = 95162default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.433  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
G
2Phase 4.1 Global Iteration 0 | Checksum: d805cfb0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:24 ; elapsed = 00:00:48 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 247 ; free virtual = 95152default:defaulth px? 
E
0Phase 4 Rip-up And Reroute | Checksum: d805cfb0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:24 ; elapsed = 00:00:48 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 247 ; free virtual = 95152default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
B
-Phase 5.1 Delay CleanUp | Checksum: d805cfb0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:24 ; elapsed = 00:00:48 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 247 ; free virtual = 95152default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
L
7Phase 5.2 Clock Skew Optimization | Checksum: d805cfb0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:24 ; elapsed = 00:00:48 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 247 ; free virtual = 95152default:defaulth px? 
N
9Phase 5 Delay and Skew Optimization | Checksum: d805cfb0
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:24 ; elapsed = 00:00:48 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 247 ; free virtual = 95152default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
D
/Phase 6.1.1 Update Timing | Checksum: e519ce65
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:25 ; elapsed = 00:00:49 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 246 ; free virtual = 95142default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.433  | TNS=0.000  | WHS=0.056  | THS=0.000  |
2default:defaultZ35-416h px? 
B
-Phase 6.1 Hold Fix Iter | Checksum: e519ce65
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:25 ; elapsed = 00:00:49 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 246 ; free virtual = 95142default:defaulth px? 
@
+Phase 6 Post Hold Fix | Checksum: e519ce65
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:25 ; elapsed = 00:00:49 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 246 ; free virtual = 95142default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
A
,Phase 7 Route finalize | Checksum: cd6327f1
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:25 ; elapsed = 00:00:49 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 241 ; free virtual = 95092default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
H
3Phase 8 Verifying routed nets | Checksum: cd6327f1
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:25 ; elapsed = 00:00:49 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 241 ; free virtual = 95092default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 192459159
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:26 ; elapsed = 00:00:49 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 240 ; free virtual = 95102default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=0.433  | TNS=0.000  | WHS=0.056  | THS=0.000  |
2default:defaultZ35-57h px? 
?
?The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px? 
G
2Phase 10 Post Router Timing | Checksum: 192459159
*commonh px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:26 ; elapsed = 00:00:50 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 244 ; free virtual = 95142default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2?
?Time (s): cpu = 00:01:26 ; elapsed = 00:00:50 . Memory (MB): peak = 3088.828 ; gain = 504.230 ; free physical = 301 ; free virtual = 95722default:defaulth px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
672default:default2
52default:default2
12default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
route_design: 2default:default2
00:01:302default:default2
00:01:122default:default2
3088.8282default:default2
504.2302default:default2
3002default:default2
95722default:defaultZ17-722h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:022default:default2
00:00:00.682default:default2
3088.8282default:default2
0.0002default:default2
2782default:default2
95682default:defaultZ17-722h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/impl_1/axi_10g_ethernet_0_example_design_routed.dcp2default:defaultZ17-1381h px? 
?
Command: %s
53*	vivadotcl2?
?report_drc -file axi_10g_ethernet_0_example_design_drc_routed.rpt -pb axi_10g_ethernet_0_example_design_drc_routed.pb -rpx axi_10g_ethernet_0_example_design_drc_routed.rpx2default:defaultZ4-113h px? 
P
Running DRC with %s threads
24*drc2
42default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/impl_1/axi_10g_ethernet_0_example_design_drc_routed.rpt?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/impl_1/axi_10g_ethernet_0_example_design_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
Command: %s
53*	vivadotcl2?
?report_methodology -file axi_10g_ethernet_0_example_design_methodology_drc_routed.rpt -rpx axi_10g_ethernet_0_example_design_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
42default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/impl_1/axi_10g_ethernet_0_example_design_methodology_drc_routed.rpt?/home/harshad/Project/git/AJIT_Ethernet/10G_MAC_core/axi_10g_ethernet_0_ex/axi_10g_ethernet_0_ex.runs/impl_1/axi_10g_ethernet_0_example_design_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
Command: %s
53*	vivadotcl2?
?report_power -file axi_10g_ethernet_0_example_design_power_routed.rpt -pb axi_10g_ethernet_0_example_design_power_summary_routed.pb -rpx axi_10g_ethernet_0_example_design_power_routed.rpx2default:defaultZ4-113h px? 
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
?
?Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
742default:default2
62default:default2
12default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -2, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
42default:defaultZ38-191h px? 


End Record