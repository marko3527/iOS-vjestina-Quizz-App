import Foundation
import UIKit
import PureLayout

class SettingViewController: UIViewController {
    
    let gradient: CAGradientLayer = CAGradientLayer()
    private var router: AppRouterProtocol!
    
    convenience init(router: AppRouterProtocol) {
        self.init()
        self.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradient.frame = view.layer.bounds
    }
    
    func setGradientBackground() {
        
        self.view.backgroundColor = .white
        
        gradient.colors = [ColorsUtil.getLightBlue().cgColor, ColorsUtil.getBlue().cgColor,]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x:1.0, y:0.0)
        gradient.endPoint = CGPoint(x:0.0, y:1.0)
        gradient.frame = view.layer.bounds
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func buildViews() {
        self.view.backgroundColor = .black
        
        let label = UILabel()
        label.text = "USERNAME"
        label.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
        label.textColor = ColorsUtil.getEarthy()
        
        view.addSubview(label)
        label.autoPinEdge(.top, to: .top, of: label.superview!, withOffset: 100)
        label.autoPinEdge(.leading, to: .leading, of: label.superview!, withOffset: 20)
        label.autoPinEdge(.trailing, to: .trailing, of: label.superview!, withOffset: -20)
        
        let userNameLabel = UILabel()
        userNameLabel.text = "Marko Grozaj"
        userNameLabel.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
        userNameLabel.textColor = .white
        
        view.addSubview(userNameLabel)
        userNameLabel.autoPinEdge(.top, to: .bottom, of: label, withOffset: 20)
        userNameLabel.autoPinEdge(.leading, to: .leading, of: userNameLabel.superview!, withOffset: 20)
        userNameLabel.autoPinEdge(.trailing, to: .trailing, of: userNameLabel.superview!, withOffset: -20)
        
        let button = PopQuizButton(text: "Log out")
        view.addSubview(button)
        button.autoPinEdge(.leading, to: .leading, of: button.superview!, withOffset: 20)
        button.autoPinEdge(.trailing, to: .trailing, of: button.superview!, withOffset: -20)
        button.autoPinEdge(.bottom, to: .bottom, of: button.superview!, withOffset: -100)
        
    }
    
}
