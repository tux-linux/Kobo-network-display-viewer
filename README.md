# Kobo-network-display-viewer
A way to use your Kobo to display the screen of your computer on it.

I had an idea an evening of August. I've thought that I could use NiLuJe's excellent FBInk library to display the screen of a computer on a recent Kobo device. I ended up finishing a program in 3 hours that replaced continuously live screenshots of the screen via SCP on the /tmp directory of a Kobo device. FBInk would then display the image, over and over as it gets replaced. That works well, except that it's *very* slow. I plan to improve it very soon.

## Installation
Install instructions are here: https://www.mobileread.com/forums/showthread.php?t=332585
I resume:
<br></br><b>1.</b> Download the script here on GitHub or at Mobileread.
<br></br><b>2.</b> Install NiLuJe's excellent FBInk and SSH bundle for Kobos here: https://www.mobileread.com/forums/showthread.php?t=254214
<br></br><b>3.</b> Hook up your Kobo to a WiFi network or via USBNet and write down its IP address.
<br></br><b>4.</b> In your Linux computer (that is connected to the Internet), type './vnc.sh' on a terminal. Write the IP and resolution information of your Kobo and you're good to go!
