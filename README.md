# tiny-ntrip

tiny-ntrip is a small NTRIP 2.0 client.

## Usage

<!-- usage-marker -->
```
./tiny-ntrip --server SERVER --port PORT --mount MOUNT ...
  --server SERVER     the IP of the ntrip server
  --port PORT         the port of the ntrip server
  --mount MOUNT       the mount point or stream of the desired data set
  --device DEVICE     the path of the nmea device
  --user USER         the username used for authenticatation to the ntrip server
  --password PASSWORD the password used for authenticatation to the ntrip server
  --interval INTERVAL the number of seconds to delay between readings of new ntrip data
  --verbose           enable verbose output
  --help -h           prints this help text
```