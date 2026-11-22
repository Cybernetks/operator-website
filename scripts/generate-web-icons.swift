import AppKit
// Render the approved brand badge without changing its geometry.
let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let badge = NSImage(contentsOf: root.appendingPathComponent("assets/operator.svg"))!
func render(_ width: Int, _ height: Int, _ file: String, _ margin: CGFloat) throws {
    let bitmap = NSBitmapImageRep(bitmapDataPlanes:nil,pixelsWide:width,pixelsHigh:height,bitsPerSample:8,samplesPerPixel:4,hasAlpha:true,isPlanar:false,colorSpaceName:.deviceRGB,bytesPerRow:0,bitsPerPixel:0)!
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep:bitmap)
    NSColor(srgbRed:32/255,green:32/255,blue:45/255,alpha:1).setFill()
    NSBezierPath(rect:NSRect(x:0,y:0,width:width,height:height)).fill()
    let size = CGFloat(min(width,height)) - margin * 2
    badge.draw(in:NSRect(x:(CGFloat(width)-size)/2,y:(CGFloat(height)-size)/2,width:size,height:size))
    NSGraphicsContext.restoreGraphicsState()
    try bitmap.representation(using:.png,properties:[:])!.write(to:root.appendingPathComponent(file))
}
try render(1200,630,"assets/operator-share-v2.png",90)
try render(512,512,"assets/icon-512.png",0)
try render(180,180,"assets/apple-touch-icon.png",0)
try render(32,32,"assets/favicon-32.png",0)
