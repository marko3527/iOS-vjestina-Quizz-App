import Foundation
import UIKit

class PopQuizTextField : UITextField, UITextFieldDelegate {
    

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
        addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        delegate = self
    }
    
    func wrongInput(){
        layer.borderColor = UIColor.red.withAlphaComponent(0.3).cgColor
        layer.borderWidth = 3
        text = ""
    }
    
    private func textFieldIsBeingEdited() {
        layer.borderWidth = 2
        layer.borderColor = ColorsUtil.getBrown().cgColor
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        textFieldIsBeingEdited()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldIsBeingEdited()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(!(textField.layer.borderColor == UIColor.red.withAlphaComponent(0.5).cgColor)){
            textField.layer.borderColor = ColorsUtil.getBrown().withAlphaComponent(0).cgColor
        }
    }
    
}

    

