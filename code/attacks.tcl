
 set val(chan)         Channel/WirelessChannel  ;# channel type
 set val(prop)         Propagation/TwoRayGround ;# radio-propagation model
 set val(ant)          Antenna/OmniAntenna      ;# Antenna type
 set val(ll)           LL                       ;# Link layer type
 set val(ifq)          Queue/DropTail/PriQueue  ;# Interface queue type
 set val(ifqlen)       50                       ;# max packet in ifq
 set val(netif)        Phy/WirelessPhy          ;# network interface type
 set val(mac)          Mac/802_11               ;# MAC type
 set val(nn)           38                     ;# number of mobilenodes
 set val(rp)	       DSDV                     ;# routing protocol
 set val(x)            800
 set val(y)            800
set ns [new Simulator]
set f [open wsn1.tr w]
$ns trace-all $f
set namtrace [open attack.nam w]
set windowVsTime2 [open wins3.tr w]
set runall [open cluster.bat w]
$ns namtrace-all-wireless $namtrace $val(x) $val(y)
set f0 [open attack-CM_Overhead.tr w]
set f1 [open attack-Delay.tr w]
set f2 [open attack-THROUGHPUT.tr w]
set f3 [open attack-Packetloss.tr w]
set f4 [open attack-Powerconsumption.tr w]

set topo [new Topography]
$topo load_flatgrid 800 800
create-god $val(nn)
set chan_1 [new $val(chan)]
set chan_2 [new $val(chan)]
set chan_3 [new $val(chan)]
set chan_4 [new $val(chan)]
set chan_5 [new $val(chan)]
set chan_6 [new $val(chan)]
set chan_7 [new $val(chan)]
set chan_8 [new $val(chan)]
set chan_9 [new $val(chan)]
set chan_10 [new $val(chan)]

$ns node-config  -adhocRouting $val(rp) \
 		 -llType $val(ll) \
                 -macType $val(mac) \
                 -ifqType $val(ifq) \
                 -ifqLen $val(ifqlen) \
                 -antType $val(ant) \
                 -propType $val(prop) \
                 -phyType $val(netif) \
                 -topoInstance $topo \
                 -agentTrace OFF \
                 -routerTrace ON \
                 -macTrace ON \
                 -movementTrace OFF \
                 -channel $chan_1 
proc finish {} {
	global ns f f0 f1  namtrace
	$ns flush-trace
        close $namtrace   
	close $f0
        close $f1              
       	exit 0
}
proc record {} {
  global sink17 sink15 sink24  f0 f1 f2 f3 f4
   set ns [Simulator instance]
   set time 0.05
   set bw0 [$sink17 set npkts_]
   set bw1 [$sink15 set npkts_]
   set bw2 [$sink24 set npkts_]
    set bw3 [$sink15 set npkts_]
   set bw4 [$sink17 set npkts_]
   set bw5 [$sink24 set npkts_] 
  set now [$ns now]
   puts $f0 "$now [expr ($bw1+$bw2)*5]"
   puts $f1 "$now [expr ($bw4)*(4)]"
   puts $f2 "$now [expr ($bw4+$bw5+$bw3)/8]"
   puts $f3 "$now [expr ($bw0)*(4)]"
   puts $f4 "$now [expr ($bw1+$bw4)*2]"

   
   $ns at [expr $now+$time] "record"
  } 
   $ns color 1 dodgerblue
      $ns color 2 blue
      $ns color 3 cyan
      $ns color 4 darkgreen
      $ns color 5 yellow
      $ns color 6 black
      $ns color 7 orange
      $ns color 8 gold
      $ns color 9 red
      for {set i 0} {$i < $val(nn) } { incr i } {
            set n($i) [$ns node]     
		$n($i) color "red"
      }
$n(0) set X_ -262.331
$n(0) set Y_ 628.566
$n(0) set Z_ 0.0

$n(1) set X_ -121.096
$n(1) set Y_ 660.789
$n(1) set Z_ 0.0

$n(2) set X_ 549.009
$n(2) set Y_ 517.219
$n(2) set Z_ 0.0

$n(3) set X_ 463.825
$n(3) set Y_ 436.203
$n(3) set Z_ 0.0

$n(4) set X_ 469.846
$n(4) set Y_ 680.643
$n(4) set Z_ 0.0

$n(5) set X_ 264.743
$n(5) set Y_ 459.254
$n(5) set Z_ 0.0

$n(6) set X_ 408.124
$n(6) set Y_ 500.66
$n(6) set Z_ 0.0

$n(7) set X_ 18.832
$n(7) set Y_ 483.955
$n(7) set Z_ 0.0

$n(8) set X_ -278.238
$n(8) set Y_ 391.057
$n(8) set Z_ 0.0

$n(9) set X_ -42.1666
$n(9) set Y_ 400.333
$n(9) set Z_ 0.0

$n(10) set X_ -194.719
$n(10) set Y_ 582.866
$n(10) set Z_ 0.0

$n(11) set X_ -126.488
$n(11) set Y_ 532.739
$n(11) set Z_ 0.0

$n(12) set X_ 307.343
$n(12) set Y_ 521.725
$n(12) set Z_ 0.0

$n(13) set X_ 473.179
$n(13) set Y_ 546.283
$n(13) set Z_ 0.0

$n(14) set X_ 521.991
$n(14) set Y_ 625.06
$n(14) set Z_ 0.0

$n(15) set X_ 257.813
$n(15) set Y_ 611.917
$n(15) set Z_ 0.0

$n(16) set X_ 367.509
$n(16) set Y_ 675.263
$n(16) set Z_ 0.0

$n(17) set X_ -23.3672
$n(17) set Y_ 567.259
$n(17) set Z_ 0.0

$n(18) set X_ -164.649
$n(18) set Y_ 457.988
$n(18) set Z_ 0.0

$n(19) set X_ -270.873
$n(19) set Y_ 517.331
$n(19) set Z_ 0.0

$n(20) set X_ -82.0268
$n(20) set Y_ 498.247
$n(20) set Z_ 0.0

$n(21) set X_ 370.451
$n(21) set Y_ 583.08
$n(21) set Z_ 0.0

$n(22) set X_ -166.153
$n(22) set Y_ 362.294
$n(22) set Z_ 0.0

$n(23) set X_ 348.473
$n(23) set Y_ 430.493
$n(23) set Z_ 0.0

$n(24) set X_ 87.5096
$n(24) set Y_ 715.132
$n(24) set Z_ 0.0

$n(25) set X_ 60.3414
$n(25) set Y_ 326.219
$n(25) set Z_ 0.0

$n(26) set X_ -75.3741
$n(26) set Y_ 315.654
$n(26) set Z_ 0.0

$n(27) set X_ -142.908
$n(27) set Y_ 242.747
$n(27) set Z_ 0.0

$n(28) set X_ -143.747
$n(28) set Y_ 140.34
$n(28) set Z_ 0.0

$n(29) set X_ -63.366
$n(29) set Y_ 96.0257
$n(29) set Z_ 0.0

$n(30) set X_ 52.9006
$n(30) set Y_ 137.104
$n(30) set Z_ 0.0

$n(31) set X_ 0.567816
$n(31) set Y_ 219.955
$n(31) set Z_ 0.0

$n(32) set X_ 252.945
$n(32) set Y_ 321.238
$n(32) set Z_ 0.0

$n(33) set X_ 432.701
$n(33) set Y_ 325.616
$n(33) set Z_ 0.0

$n(34) set X_ 472.115
$n(34) set Y_ 205.012
$n(34) set Z_ 0.0

$n(35) set X_ 398.259
$n(35) set Y_ 90.6134
$n(35) set Z_ 0.0

$n(36) set X_ 242.143
$n(36) set Y_ 130.894
$n(36) set Z_ 0.0

$n(37) set X_ 347.725
$n(37) set Y_ 218.378
$n(37) set Z_ 0.0




for {set i 0} {$i < $val(nn)} { incr i } {
$ns initial_node_pos  $n($i) 30
}

$ns at 0.1 "$n(0) color darkgreen"
$ns at 0.1 "$n(1) color darkgreen"
$ns at 0.1 "$n(17) color darkgreen"
$ns at 0.1 "$n(7) color darkgreen"
$ns at 0.1 "$n(9) color darkgreen"
$ns at 0.1 "$n(22) color darkgreen"
$ns at 0.1 "$n(8) color darkgreen"
$ns at 0.1 "$n(19) color darkgreen"
$ns at 0.1 "$n(10) color darkgreen"
$ns at 0.1 "$n(11) color darkgreen"
$ns at 0.1 "$n(20) color darkgreen"
$ns at 0.1 "$n(18) color darkgreen"


$ns at 0.2 "$n(15) color deepskyblue"
$ns at 0.2 "$n(16) color deepskyblue"
$ns at 0.2 "$n(4) color deepskyblue"
$ns at 0.2 "$n(14) color deepskyblue"
$ns at 0.2 "$n(13) color deepskyblue"
$ns at 0.2 "$n(6) color deepskyblue"
$ns at 0.2 "$n(12) color deepskyblue"
$ns at 0.2 "$n(21) color deepskyblue"
$ns at 0.2 "$n(2) color deepskyblue"
$ns at 0.2 "$n(3) color deepskyblue"
$ns at 0.2 "$n(23) color deepskyblue"
$ns at 0.2 "$n(5) color deepskyblue"
##################################################################
$ns at 0.1 "$n(25) color orange"
$ns at 0.1 "$n(26) color orange"
$ns at 0.1 "$n(27) color orange"
$ns at 0.1 "$n(28) color orange"
$ns at 0.1 "$n(29) color orange"
$ns at 0.1 "$n(30) color orange"
$ns at 0.1 "$n(31) color orange"

$ns at 0.2 "$n(32) color yellow"
$ns at 0.2 "$n(33) color yellow"
$ns at 0.2 "$n(34) color yellow"
$ns at 0.2 "$n(35) color yellow"
$ns at 0.2 "$n(36) color yellow"
$ns at 0.2 "$n(37) color yellow"
#$ns at 0.2 "$n(31) color orange"
######################################################################
$ns at 0.1 "$n(17) add-mark m1 green circle"
$ns at 0.2 "$n(15) add-mark m1 blue circle"

$ns at 0.1 "$n(25) add-mark m1 orange circle"
$ns at 0.2 "$n(32) add-mark m1 yellow circle"

$ns at 0.1 "$n(17) label CH"
$ns at 0.2 "$n(15) label CH"

$ns at 0.1 "$n(25) label CH"
$ns at 0.2 "$n(32) label CH"

######################################################
$ns at 0.1 "$n(24) label SINK"
$ns at 0.1 "$n(24) add-mark m1 red circle"

#############################################################

$ns at 0.0 "$ns trace-annotate \"election for cluster formation\""
$ns at 0.1 "$ns trace-annotate \"Cluster head selection\""
$ns at 0.3 "$ns trace-annotate \"Sensor nodes aggregating data to CH\""
$ns at 6.8 "$ns trace-annotate \"Cluster head start sending data to sink\""
$ns at 8.21 "$ns trace-annotate \"Malicious Node trigger attack\""

set sink0 [new Agent/LossMonitor]
set sink1 [new Agent/LossMonitor]
set sink2 [new Agent/LossMonitor]
set sink3 [new Agent/LossMonitor]
set sink4 [new Agent/LossMonitor]
set sink5 [new Agent/LossMonitor]
set sink6 [new Agent/LossMonitor]
set sink7 [new Agent/LossMonitor]
set sink8 [new Agent/LossMonitor]
set sink9 [new Agent/LossMonitor]
set sink10 [new Agent/LossMonitor]
set sink11 [new Agent/LossMonitor]
set sink12 [new Agent/LossMonitor]
set sink13 [new Agent/LossMonitor]
set sink14 [new Agent/LossMonitor]
set sink15 [new Agent/LossMonitor]
set sink16 [new Agent/LossMonitor]
set sink17 [new Agent/LossMonitor]
set sink18 [new Agent/LossMonitor]
set sink19 [new Agent/LossMonitor]
set sink20 [new Agent/LossMonitor]
set sink21 [new Agent/LossMonitor]
set sink22 [new Agent/LossMonitor]
set sink23 [new Agent/LossMonitor]
set sink24 [new Agent/LossMonitor]
set sink25 [new Agent/LossMonitor]
set sink31 [new Agent/LossMonitor]
set sink26 [new Agent/LossMonitor]

$ns attach-agent $n(26) $sink26
$ns attach-agent $n(20) $sink20
$ns attach-agent $n(31) $sink31
$ns attach-agent $n(17) $sink17
#################################################
$ns attach-agent $n(15) $sink15

$ns attach-agent $n(24) $sink24

$ns attach-agent $n(25) $sink23

$ns attach-agent $n(32) $sink22

$ns attach-agent $n(5) $sink5

$ns attach-agent $n(9) $sink9

$ns attach-agent $n(7) $sink7


$ns attach-agent $n(18) $sink18

$ns attach-agent $n(19) $sink19

$ns attach-agent $n(0) $sink0
$ns attach-agent $n(25) $sink25

set tcp0 [new Agent/TCP]
$ns attach-agent $n(0) $tcp0
set tcp1 [new Agent/TCP]
$ns attach-agent $n(1) $tcp1
set tcp2 [new Agent/TCP]
$ns attach-agent $n(19) $tcp2
set tcp3 [new Agent/TCP]
$ns attach-agent $n(18) $tcp3
###########################################
set tcp4 [new Agent/TCP]
$ns attach-agent $n(10) $tcp4
set tcp5 [new Agent/TCP]
$ns attach-agent $n(11) $tcp5
set tcp6 [new Agent/TCP]
$ns attach-agent $n(8) $tcp6
set tcp7 [new Agent/TCP]
$ns attach-agent $n(7) $tcp7
######################################
set tcp8 [new Agent/TCP]
$ns attach-agent $n(4) $tcp8
set tcp9 [new Agent/TCP]
$ns attach-agent $n(2) $tcp9
set tcp10 [new Agent/TCP]
$ns attach-agent $n(3) $tcp10
set tcp11 [new Agent/TCP]
$ns attach-agent $n(6) $tcp11
##########################################
set tcp12 [new Agent/TCP]
$ns attach-agent $n(16) $tcp12
set tcp13 [new Agent/TCP]
$ns attach-agent $n(12) $tcp13
set tcp14 [new Agent/TCP]
$ns attach-agent $n(13) $tcp14
set tcp15 [new Agent/TCP]
$ns attach-agent $n(14) $tcp15
#######################################
set tcp17 [new Agent/TCP]
$ns attach-agent $n(24) $tcp17

set tcp18 [new Agent/TCP]
$ns attach-agent $n(15) $tcp18

set tcp19 [new Agent/TCP]
$ns attach-agent $n(17) $tcp19

proc attach-CBR-traffic { node sink size interval } {
   set ns [Simulator instance]
   set cbr [new Agent/CBR]
   $ns attach-agent $node $cbr
   $cbr set packetSize_ $size
   $cbr set interval_ $interval
   $ns connect $cbr $sink
   return $cbr
  }
proc plotWindow {tcpSource file} {
global ns
set time 2.2
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file" }
$ns at 10.0 "plotWindow $tcp0 $windowVsTime2" 

set cbr0 [attach-CBR-traffic $n(0) $sink17 1000 .05]
set cbr1 [attach-CBR-traffic $n(1) $sink17 1000 .05]
set cbr2 [attach-CBR-traffic $n(10) $sink17 1000 .05]
set cbr3 [attach-CBR-traffic $n(19) $sink17 1000 .05]
set cbr4 [attach-CBR-traffic $n(11) $sink17 1000 .05]
set cbr5 [attach-CBR-traffic $n(20) $sink17 1000 .05]
set cbr6 [attach-CBR-traffic $n(7) $sink17 1000 .05]
set cbr7 [attach-CBR-traffic $n(9) $sink17 1000 .05]
set cbr8 [attach-CBR-traffic $n(18) $sink17 1000 .05]
set cbr9 [attach-CBR-traffic $n(22) $sink17 1000 .05]
####################################################################
set cbr10 [attach-CBR-traffic $n(16) $sink15 1000 .05]
set cbr11 [attach-CBR-traffic $n(4) $sink15 1000 .05]
set cbr12 [attach-CBR-traffic $n(21) $sink15 1000 .05]
set cbr13 [attach-CBR-traffic $n(12) $sink15 1000 .05]
set cbr14 [attach-CBR-traffic $n(5) $sink15 1000 .05]
set cbr15 [attach-CBR-traffic $n(6) $sink15 1000 .05]
set cbr16 [attach-CBR-traffic $n(13) $sink15 1000 .05]
set cbr17 [attach-CBR-traffic $n(14) $sink15 1000 .05]
set cbr18 [attach-CBR-traffic $n(23) $sink15 1000 .05]
set cbr19 [attach-CBR-traffic $n(3) $sink15 1000 .05]
##############################################################
set cbr20 [attach-CBR-traffic $n(26) $sink23 1000 .05]
set cbr21 [attach-CBR-traffic $n(27) $sink23 1000 .05]
set cbr22 [attach-CBR-traffic $n(28) $sink23 1000 .05]
set cbr23 [attach-CBR-traffic $n(29) $sink23 1000 .05]
set cbr24 [attach-CBR-traffic $n(30) $sink23 1000 .05]
set cbr25 [attach-CBR-traffic $n(31) $sink23 1000 .05]
##################################################################
set cbr26 [attach-CBR-traffic $n(33) $sink22 1000 .05]
set cbr27 [attach-CBR-traffic $n(34) $sink22 1000 .05]
set cbr28 [attach-CBR-traffic $n(35) $sink22 1000 .05]
set cbr29 [attach-CBR-traffic $n(36) $sink22 1000 .05]
set cbr30 [attach-CBR-traffic $n(37) $sink22 1000 .05]
###########################################################3
set cbr31 [attach-CBR-traffic $n(9) $sink19 1000 .05]
set cbr32 [attach-CBR-traffic $n(9) $sink7 1000 .05]
set cbr33 [attach-CBR-traffic $n(9) $sink25 1000 .05]
set cbr34 [attach-CBR-traffic $n(9) $sink31 1000 .05]
set cbr35 [attach-CBR-traffic $n(9) $sink18 1000 .05]
set cbr36 [attach-CBR-traffic $n(9) $sink26 1000 .05]
set cbr37 [attach-CBR-traffic $n(9) $sink20 1000 .05]


$ns at 0.0 "record"

$ns at 0.5 "$cbr0 start"
$ns at 0.5 "$cbr1 start"
$ns at 0.5 "$cbr2 start"
$ns at 0.5 "$cbr3 start"
$ns at 0.5 "$cbr4 start"
$ns at 0.5 "$cbr5 start"
$ns at 0.5 "$cbr6 start"
$ns at 0.5 "$cbr7 start"
$ns at 0.5 "$cbr8 start"
$ns at 0.5 "$cbr9 start"

$ns at 2.5 "$cbr0 stop"
$ns at 2.5 "$cbr1 stop"
$ns at 2.5 "$cbr2 stop"
$ns at 2.5 "$cbr3 stop"
$ns at 2.5 "$cbr4 stop"
$ns at 2.5 "$cbr5 stop"
$ns at 2.5 "$cbr6 stop"
$ns at 2.5 "$cbr7 stop"
$ns at 2.5 "$cbr8 stop"
$ns at 2.5 "$cbr9 stop"

$ns at 2.5 "$cbr10 start"
$ns at 2.5 "$cbr11 start"
$ns at 2.5 "$cbr12 start"
$ns at 2.5 "$cbr13 start"
$ns at 2.5 "$cbr14 start"
$ns at 2.5 "$cbr15 start"
$ns at 2.5 "$cbr16 start"
$ns at 2.5 "$cbr17 start"
$ns at 2.5 "$cbr18 start"
$ns at 2.5 "$cbr19 start"


$ns at 4.5 "$cbr10 stop"
$ns at 4.5 "$cbr11 stop"
$ns at 4.5 "$cbr12 stop"
$ns at 4.5 "$cbr13 stop"
$ns at 4.5 "$cbr14 stop"
$ns at 4.5 "$cbr15 stop"
$ns at 4.5 "$cbr16 stop"
$ns at 4.5 "$cbr17 stop"
$ns at 4.5 "$cbr18 stop"
$ns at 4.5 "$cbr19 stop"


$ns at 4.6 "$cbr20 start"
$ns at 4.6 "$cbr21 start"
$ns at 4.6 "$cbr22 start"
$ns at 4.6 "$cbr23 start"
$ns at 4.6 "$cbr24 start"
$ns at 4.6 "$cbr25 start"

$ns at 5.5 "$cbr20 stop"
$ns at 5.5 "$cbr21 stop"
$ns at 5.5 "$cbr22 stop"
$ns at 5.5 "$cbr23 stop"
$ns at 5.5 "$cbr24 stop"
$ns at 5.5 "$cbr25 stop"

###############################
$ns at 5.6 "$cbr26 start"
$ns at 5.6 "$cbr27 start"
$ns at 5.6 "$cbr28 start"
$ns at 5.6 "$cbr29 start"
$ns at 5.6 "$cbr30 start"

$ns at 6.6 "$cbr26 stop"
$ns at 6.6 "$cbr27 stop"
$ns at 6.6 "$cbr28 stop"
$ns at 6.6 "$cbr29 stop"
$ns at 6.6 "$cbr30 stop"
#############################
$ns at 6.7 "$n(9) label Malicious"
$ns at 6.7 "$n(9) add-mark m1 red circle"
#############################################
$ns at 6.8 "$cbr31 start"
$ns at 6.8 "$cbr32 start"
$ns at 6.8 "$cbr33 start"
$ns at 6.8 "$cbr34 start"
$ns at 6.8 "$cbr35 start"
$ns at 6.8 "$cbr36 start"
$ns at 6.8 "$cbr37 start"

$ns at 14.0 "finish"
puts "Start of simulation.."
$ns run

