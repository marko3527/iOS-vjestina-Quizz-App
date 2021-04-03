import Foundation
import UIKit

class PopQuizTextField : UITextField {
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(text: String) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        makeTextField(text: text)
    }
    
    func makeTextField(text: String) {
        backgroundColor = ColorsUtil.getEarthy()
        layer.cornerRadius = 15.0
        placeholder = text
        textColor = UIColor.white
        textAlignment = .center
        font = UIFont(name: "AvenirNext-HeavyItalic", size: 15)
    }
    
}

extension PopQuizLabel : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderWidth = 2.0
        layer.borderColor = ColorsUtil.getBrown().withAlphaComponent(0.5).cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderColor = ColorsUtil.getBrown().withAlphaComponent(0).cgColor
    }
}
