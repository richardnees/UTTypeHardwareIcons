import Cocoa
import UTTypeHardwareIcons

let customSize = CGSize(width: 1024, height: 1024)

//:Current model

let currentImage = NSImage(deviceModel: .current)
let currentImageCustom = NSImage(deviceModel: .current, size: customSize)

//:iPhone model

let iphoneImage = NSImage(deviceModel: "iPhone1,1")
let iphoneImageCustom = NSImage(deviceModel: "iPhone1,1", size: customSize)

//:iPad model

let ipadImage = NSImage(deviceModel: "iPad3,1")
let ipadImageCustom = NSImage(deviceModel: "iPad3,1", size: customSize)

//:MacBook Pro model

let macBookProImage = NSImage(deviceModel: "MacBookPro14,1")
let macBookProImageCustom = NSImage(deviceModel: "MacBookPro14,1", size: customSize)

//:iMac model

let iMacImage = NSImage(deviceModel: "iMac10,1")
let iMacImageCustom = NSImage(deviceModel: "iMac10,1", size: customSize)

