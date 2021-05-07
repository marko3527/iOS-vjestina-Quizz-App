import Foundation
import UIKit
import PureLayout

class QuizViewController: UIViewController {
    
    let gradient: CAGradientLayer = CAGradientLayer()
    private var quiz: Quiz!
    private var router: AppRouterProtocol!
    
    convenience init(quiz: Quiz, router: AppRouterProtocol) {
        self.init()
        self.quiz = quiz
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
        
        navigationController?.navigationBar.tintColor = ColorsUtil.getEarthy()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorsUtil.getEarthy()]
        navigationItem.title = quiz.title
        
        let questionNumber = CurrentQuestionView(numberOfQuestions: 8, currentNumber: 1)
        view.addSubview(questionNumber)
        
        questionNumber.autoPinEdge(toSuperviewSafeArea: .top, withInset: 20)
        questionNumber.autoPinEdge(toSuperviewSafeArea: .leading,
                          withInset: 15)
        
        let firstQuestion = QuestionView(question: quiz.questions[0])
        
        view.addSubview(firstQuestion)
        firstQuestion.autoPinEdge(toSuperviewEdge: .leading)
        firstQuestion.autoPinEdge(toSuperviewEdge: .trailing)
        firstQuestion.autoPinEdge(.top, to: .bottom, of: questionNumber, withOffset: 50)
        

    }
    
    
}
