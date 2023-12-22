#!/usr/bin/python2.7 
from mininet.cli import CLI
from mininet.topo import Topo
from mininet.net import Mininet
from mininet.util import dumpNodeConnections
from mininet.log import setLogLevel

class MyTopo(Topo):
    def __init__(self):
        Topo.__init__(self)
        #Create switches
        self.addSwitch("S1")
        self.addSwitch("S2")
        self.addSwitch("S3")
        self.addSwitch("S4")

        #Create Hosts
        self.addHost("H1",mac="00:00:00:00:00:01",ip="10.0.0.1/24")
        self.addHost("H2",mac="00:00:00:00:00:02",ip="10.0.0.2/24")
        self.addHost("H4",mac="00:00:00:00:00:04",ip="10.0.0.4/24")
        self.addHost("H5",mac="00:00:00:00:00:05",ip="10.0.0.5/24")
        self.addHost("H6",mac="00:00:00:00:00:06",ip="10.0.0.6/24")
        self.addHost("H7",mac="00:00:00:00:00:07",ip="10.0.0.7/24")
        self.addHost("H8",mac="00:00:00:00:00:08",ip="10.0.0.8/24")

        #Adding links to switches
        self.addLink("S1","H1")
        self.addLink("S1","H2")

        self.addLink("S3","H5")
        self.addLink("S3","H6")
        self.addLink("S3","H7")
        self.addLink("S3","H8")

        self.addLink("S4","H4")

        #Add links between switches
        self.addLink("S1","S2")
        self.addLink("S1","S4")
        self.addLink("S2","S3")

def starter():
        topology = MyTopo()
        net = Mininet(topo=topology, controller=None)
        net.start()
        dumpNodeConnections(net.hosts) 
        CLI(net)
        net.stop()

setLogLevel('info')
starter()


