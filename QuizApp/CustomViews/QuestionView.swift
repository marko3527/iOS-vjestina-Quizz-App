import Foundation
import UIKit

class QuestionView: UIViewController {
    
    private var question: Question!
    var answerButtons = [PopQuizButton]()
    
    convenience init(question: Question) {
        self.init()
        self.question = question
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    
    func setQuestion(question: Question) {
        self.question = question
    }
    
    convenience init() {
        self.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViews() {
        
        let questionText = UILabel()
        questionText.text = question.question
        questionText.textColor = .white
        questionText.lineBreakMode = NSLineBreakMode.byWordWrapping
        questionText.numberOfLines = 0
        questionText.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
        view.addSubview(questionText)
        
        questionText.autoAlignAxis(toSuperviewAxis: .vertical)
        questionText.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        questionText.autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        questionText.autoSetDimension(.height, toSize: 80)
        
        for i in 0...3 {
            let answerButton = PopQuizButton(text: question.answers[i])
            answerButtons.append(answerButton)
            view.addSubview(answerButton)
        }
        
        answerButtons[0].addTarget(self, action: #selector(firstAnswerClicked), for: .touchUpInside)
        answerButtons[1].addTarget(self, action: #selector(secondAnswerClicked), for: .touchUpInside)
        answerButtons[2].addTarget(self, action: #selector(thirdAnswerClicked), for: .touchUpInside)
        answerButtons[3].addTarget(self, action: #selector(fourthAnswerClicked), for: .touchUpInside)
        
        answerButtons[0].autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        answerButtons[0].autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
        answerButtons[0].autoPinEdge(.top, to: .bottom, of: questionText, withOffset: 30)
        answerButtons[0].autoSetDimension(.height, toSize: 80)
        
        for i in 1...3 {
            answerButtons[i].autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
            answerButtons[i].autoPinEdge(toSuperviewEdge: .trailing, withInset: 20)
            answerButtons[i].autoPinEdge(.top, to: .bottom, of: answerButtons[i-1], withOffset: 30)
            answerButtons[i].autoSetDimension(.height, toSize: 80)
        }
    }
    
    @objc
    func firstAnswerClicked(sender: PopQuizButton!) {
        if(question.correctAnswer == 0) {
            answerButtons[0].backgroundColor = .green
        }
    }
    
    @objc
    func secondAnswerClicked(sender: PopQuizButton!) {
        if(question.correctAnswer == 1) {
            answerButtons[1].backgroundColor = .green
        }
    }
    
    @objc
    func thirdAnswerClicked(sender: PopQuizButton!) {
        if(question.correctAnswer == 2) {
            answerButtons[2].backgroundColor = .green
        }
    }
    
    @objc
    func fourthAnswerClicked(sender: PopQuizButton!) {
        if(question.correctAnswer == 3) {
            answerButtons[3].backgroundColor = .green
        }
    }
    
}

