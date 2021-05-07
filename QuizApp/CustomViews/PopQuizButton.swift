import Foundation
import UIKit
import PureLayout

class PopQuizButton : UIButton {
    
    var text: String!
    
    override init(frame: CGRect) {
        super.init(frame : frame)
    }
    
    convenience init(text: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.text = text
        makeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeButton() {
        backgroundColor = ColorsUtil.getBrown().withAlphaComponent(0.7)
        layer.cornerRadius = 15.0
        setTitle(text, for: .normal)
        
        titleLabel?.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
    }
    
    
     
}
