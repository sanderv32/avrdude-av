## AVRDUDE-av
At the moment the AVR-Eclipse plugin doesn't recognize the output of AVRDUDE which results in an error if you try "Load MCU" in your project to identify your Atmel microprocessor. This little python script will fix this.

### Installation
Make sure you have AVRDUDE installed before continuing.
Just run the __install.sh__ script which will find the original AVRDUDE and will modify the script for you. In Eclipse point the path of AVRDUDE to the directory where this wrapper is installed.
