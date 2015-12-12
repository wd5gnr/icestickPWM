This is the Hackaday iCEstick PWM demo by Al Williams

This combines the Jenkins UART (see below) and a custom
PWM component.

What is below is the original UART README. This is all released under
the same license. 



# iCEstick-UART-Demo

[![Build Status](https://jenkins.cyrozap.com/job/iCEstick-UART-Demo/badge/icon)](https://jenkins.cyrozap.com/job/iCEstick-UART-Demo/)
[![License](http://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)

## Prerequisites

- [Yosys][1]
- [arachne-pnr][2]
- [IceStorm][3]

## Building

    git clone https://github.com/cyrozap/iCEstick-UART-Demo.git
    cd iCEstick-UART-Demo
    git submodule update --init
    make

## Flashing

Plug in your iCEstick, then run `make flash`. Depending on your permissions, you
may need to run it with `sudo`.


[1]: http://www.clifford.at/yosys/
[2]: https://github.com/cseed/arachne-pnr
[3]: http://www.clifford.at/icestorm/
