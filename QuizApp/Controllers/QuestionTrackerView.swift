import Foundation
import UIKit
import PureLayout

class QuestionTrackerView: UIPageViewController {
    
    private var controllers: [UIViewController]!
    
    convenience init() {
        self.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setControllers(controllers: [UIViewController]) {
        for controller in controllers {
            self.controllers.append(controller)
        }
    }
    
    private func buildViews() {
        view.backgroundColor = .white
        
        guard let firstVC = controllers.first else {return}
        
        let pageAppearance = UIPageControl.appearance()
        pageAppearance.currentPageIndicatorTintColor = .black
        pageAppearance.pageIndicatorTintColor = .lightGray
        
        setViewControllers([firstVC], direction:.forward, animated: true, completion: nil)
    }
    
}
