#!/bin/bash
ScriptDir=$PWD;
TimeStart=$(date +%s);

echo " -------------------------------------------------------------";
echo " |       Setup To Build AICP With Prebuilt Chromium          |";
echo " |                                                           |";
echo " |  Pros: Decreases Build Time Significantly                 |";
echo " |                                                           |";
echo " |  Cons: Gives Browser FC's on very few devices             |";
echo " |                                                           |";
echo " |  Exit With ctrl+c now if you don't want to take a risk    |";
echo " |                                                           |";
echo " -------------------------------------------------------------";

sleep 3s

echo "NOTE: BETTER NOT TO REPO SYNC UNTIL BUILD COMPLETION AFTER THIS SETUP";
echo " ";
sleep 2s
echo " Going to start in 5 seconds";
echo "5...";
sleep 1s
echo "4...";
sleep 1s
echo "3...";
sleep 1s
echo "2...";
sleep 1s
echo "1...";
sleep 1s

echo "Removing old Webview and adding the prebuilt repo";
echo " ";
sleep 1s
echo "This will take around 5-10 minutes depending on your network speed";
cd $ScriptDir/../frameworks;
rm -rf webview;
git clone https://www.github.com/AICP/frameworks_webview.git -b lp5.1;
mv frameworks_webview webview;
echo " ";
echo "Adding a few lines in core_minimal.mk";
cd $ScriptDir/target/product;
cat <<EOF>> core_minimal.mk

# Prebuilt Chromium
PRODUCT_PACKAGES += \ 
    libwebviewchromium_plat_support \ 
    libwebviewchromium_loader
EOF

echo "Added prebuilt chromium support. Now build as usual";
echo " ";
sleep 1s
echo "Press Return Key to exit this setup"
read key;
