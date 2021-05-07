import Foundation
import UIKit


class LandingPageController: UIViewController {
    
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
        let quizes = QuizzesViewController(router: router)
        let settings = SettingViewController(router: router)
        
        quizes.tabBarItem = UITabBarItem(title: "QUIZZES", image: .add, selectedImage: .add)
        settings.tabBarItem = UITabBarItem(title: "SETTINGS", image: .add, selectedImage: .add)
    
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [quizes, settings]
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.tabBar.barTintColor = ColorsUtil.getBlue()
        tabBarController.tabBar.tintColor = ColorsUtil.getEarthy()
        present(tabBarController, animated: true)
    }
    
}
