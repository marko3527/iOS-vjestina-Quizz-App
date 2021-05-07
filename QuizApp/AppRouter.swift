import Foundation
import UIKit

protocol AppRouterProtocol {
    func setStartScreen(in window: UIWindow?)
    func showQuizzesController()
    func showQuizController(quiz: Quiz)
}

class AppRouter : AppRouterProtocol {
    
    private let navigationController: UINavigationController!
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func setStartScreen(in window: UIWindow?) {
        navigationController.navigationBar.barTintColor = ColorsUtil.getBlue()
        navigationController.navigationBar.tintColor = ColorsUtil.getEarthy()
        //let vc = LoginViewController(router: self)
        let vc = QuizzesViewController(router: self)
        
        navigationController.pushViewController(vc, animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func showQuizzesController() {
        let vc = QuizzesViewController(router: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showQuizController(quiz: Quiz) {
        let vc = QuizViewController(quiz: quiz, router: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
}
