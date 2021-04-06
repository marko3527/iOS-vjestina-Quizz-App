import Foundation
import UIKit

class EmptyCircle: UIView {
    
    
    override func draw(_ rect: CGRect) {
        var path = UIBezierPath()
        print(frame.origin.x)
        path = UIBezierPath(ovalIn: CGRect(x:frame.origin.x, y: frame.origin.y, width: 200, height: 200))
        UIColor.yellow.setStroke()
        UIColor.gray.setFill()
        path.lineWidth = 5
        path.stroke()
        path.fill()

    }
}
