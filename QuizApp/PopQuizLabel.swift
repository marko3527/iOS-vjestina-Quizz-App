import Foundation
import UIKit

class PopQuizLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(labelText: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        makeLabel(labelText: labelText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLabel(labelText : String) {
        text = "Pop Quiz"
        textColor = ColorsUtil.getEarthy()
        font = UIFont(name: "AvenirNext-HeavyItalic", size: 40)
        
        //label-shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width:4, height:4)
        layer.masksToBounds = false
    }
}
