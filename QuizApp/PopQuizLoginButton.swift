import Foundation
import UIKit
import PureLayout

class PopQuizLoginButton : UIButton {
    
    var auth: AuthFacade!
    
    override init(frame: CGRect) {
        super.init(frame : frame)
    }
    
    convenience init(auth: AuthFacade) {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.auth = auth
        makeLoginButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeLoginButton() {
        backgroundColor = ColorsUtil.getBrown()
        layer.opacity = 0.5
        layer.cornerRadius = 15.0
        setTitle("Login", for: .normal)
        addTarget(self, action: #selector(clicked), for: .touchUpInside)
        
        titleLabel?.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
    }
    
    @objc
    func clicked(sender: UIButton!) {
        print(auth.authenticate())
    }
     
}
