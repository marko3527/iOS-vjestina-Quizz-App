import Foundation
import UIKit

class FetchQuizButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        makeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeButton() {
        backgroundColor = ColorsUtil.getEarthy()
        setTitleColor(ColorsUtil.getBrown(), for: .normal)
        layer.cornerRadius = 15.0
        setTitle("Get Quiz", for: .normal)
        
        titleLabel?.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
    }
    
    
    
}
