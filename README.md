#ARPY

A simplistic `ARP-scan` front-end. Used to see which addresses are used on the local network.

##Usage

```
chmod +x arpy
sudo ./arpy
```

Now go to `http://localhost:8000`

##Dependencies

`arp-scan`

##How does it work

This wraps around the `arp-scan` utility, which sends Address Resolution Protocol requests to all IPs on the local network. It records the IPs that respond together with the associated MAC address.

This code parses the `arp-scan` output, does some simple html templating and fires up a server, serving the table of results.
