import Foundation
import UIKit
import PureLayout

class CurrentQuestionView: UIView {
    
    private var currentNumber: Int!
    private var numberOfQuestions: Int!
    
    convenience init(numberOfQuestions: Int, currentNumber: Int) {
        self.init()
        self.currentNumber = currentNumber
        self.numberOfQuestions = numberOfQuestions
        buildViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        let label = UILabel()
        label.textColor = ColorsUtil.getEarthy()
        label.text = String(currentNumber) + "/" + String(numberOfQuestions)
        addSubview(label)
        
        label.autoPinEdgesToSuperviewEdges()
        
    }
    
}
