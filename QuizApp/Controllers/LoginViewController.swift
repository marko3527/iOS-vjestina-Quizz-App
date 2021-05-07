import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    
    let gradient: CAGradientLayer = CAGradientLayer()
    private var auth: AuthFacade!
    private var router: AppRouterProtocol!
    
    convenience init(router: AppRouterProtocol){
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
    
    
    func buildViews() {
        let nazivAplikacije = PopQuizLabel(labelText: "Pop Quiz", fontSize: 40)
        self.view.addSubview(nazivAplikacije)
        
        nazivAplikacije.autoAlignAxis(toSuperviewAxis: .vertical)
        nazivAplikacije.autoPinEdge(toSuperviewSafeArea: .top, withInset: 50)
        nazivAplikacije.autoSetDimension(.height, toSize: 50)
        
        let email = PopQuizTextField(text: "Email")
        self.view.addSubview(email)
        
        
        email.autoAlignAxis(toSuperviewAxis: .vertical)
        email.autoAlignAxis(toSuperviewAxis: .horizontal)
        email.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        email.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
        email.autoSetDimension(.height, toSize: 40)
        
        let pass = PopQuizTextField(text: "Password")
        self.view.addSubview(pass)
        pass.isSecureTextEntry = true
        
        pass.autoAlignAxis(toSuperviewAxis: .vertical)
        pass.autoPinEdge(.top,to: .bottom, of: email, withOffset: 20)
        pass.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        pass.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
        pass.autoSetDimension(.height, toSize: 40)
        
        auth = AuthFacade(email: email, pass: pass)
        let login = PopQuizButton(text: "Login")
        self.view.addSubview(login)
        
        login.autoAlignAxis(toSuperviewAxis: .vertical)
        login.autoPinEdge(.top, to: .bottom, of: pass, withOffset: 20)
        login.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        login.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
        login.autoSetDimension(.height, toSize: 40)
        login.addTarget(self, action: #selector(clicked), for: .touchUpInside)
    
    }
    
    @objc
    func clicked(sender: UIButton!) {
        if(auth.authenticate()) {
            router.showQuizzesController()
        }
    }


}
