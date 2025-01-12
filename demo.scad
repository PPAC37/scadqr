// QR code purpose (configure the section depending on the type you choose here)
qrcode_type = "text"; // [text:"Text/URL", wifi:"Wi-Fi", phone:"Phone Number"]

/* [Text/URL] */
// Content of the QR code
text = "some text or url";

/* [Wi-Fi] */
// SSID wifi network name
ssid = "wifi_network";
// Wi-Fi password
psk = "1234";
// Autentication type
auth = "WPA";// [WPA:"WPA/WPA2 (password protected)", nopass:"open network (no password)", WEP:"WEP (obsolete password protection)"]
// Whether network is hidden
hidden = 0; // [ 0:false, 1:true ]

/* [Phone] */
// Phone number
phone = "0123456789";

/* [Dimensions] */
// Width of the QR code
width = 100; // [1:1000]
// Height of the QR code
height = 100; // [1:1000]
// Thickness of the QR code
thickness = 5; // [1:50]
// Place the QR code in the center
center = 0; // [0:false, 1:true]

/* [QR code parameters (advanced)] */
// Error correction level
error_correction = "L"; // [L:"Low (~7%)", M:"Medium (~15%)", Q: "Quartile (~25%)", H: "High (~30%)"]
// Mask pattern
mask_pattern = 0; // [0:"000: (y + x)%2=0", 1:"001: y % 2=0", 2:"010: x % 3=0", 3:"011: (y + x)%3=0", 4:"100: (y/2 + x/3)%2=0", 5:"101: (y*x)%2+(y*x)%3=0", 6:"110: ((y*x)%3+y*x)%2=0", 7:"111: ((y*x)%3+y+x)%2=0"]
// Character encoding
encoding = "UTF-8"; // [ UTF-8:"UTF-8 (Unicode)", Shift_JIS:"Shift JIS (Shift Japanese International Standards)"]

include <qr.scad>

content =
    qrcode_type == "wifi" ? qr_wifi(ssid, psk, auth, hidden) :
    qrcode_type == "phone" ? qr_phone_call(phone) :
    text;

color("black")
qr(content, error_correction, width, height, thickness, center, mask_pattern, encoding);
