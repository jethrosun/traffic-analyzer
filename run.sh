#!/bin/bash



declare -a TraceList=(
'tls_handshake_trace.pcap' 'p2p-small-re.pcap'
'rdr-browsing-re.pcap' 'video_trace_2_re.pcap'
'net-2009-11-23-16:54-re.pcap' 'net-2009-12-07-11:59-re.pcap'
'net-2009-12-08-11:59-re.pcap'
'ictf2010-0-re.pcap' 'ictf2010-11-re.pcap' 'ictf2010-1-re.pcap'
'ictf2010-12-re.pcap' 'ictf2010-10-re.pcap' 'ictf2010-13-re.pcap')


for trace in ${TraceList[@]}; do
	echo $trace
	python bin/procpktsize.py  $HOME/traces/$trace > tmp/$trace.pktsize
	python bin/pltpktsize.py  tmp/$trace.pktsize  tmp/$trace.eps
	epstopdf tmp/$trace.eps results/$trace.pdf
done

rm tmp/*
