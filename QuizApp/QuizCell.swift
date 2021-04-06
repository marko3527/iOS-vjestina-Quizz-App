import Foundation
import UIKit
import PureLayout

class QuizCell : UITableViewCell {
        
    let quizTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
        label.textAlignment = .left
        label.textColor = .white
        
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0

        return label
    }()
    
    let quizDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-HeavyItalic", size: 15)
        label.textAlignment = .left
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let quizDifficulty: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-HeavyItalic", size: 15)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(quizDescription)
        addSubview(quizTitle)
        addSubview(quizDifficulty)
        
        quizTitle.autoPinEdge(.top, to: .top, of: quizTitle.superview!, withOffset: 15)
        quizTitle.autoPinEdge(.left, to: .left, of: quizTitle.superview!, withOffset: 120)
        quizTitle.autoPinEdge(.right, to: .right, of: quizTitle.superview!, withOffset: -20)
        
        quizDescription.autoPinEdge(.top, to: .bottom, of: quizTitle, withOffset: 5)
        quizDescription.autoPinEdge(.left, to: .left, of: quizDescription.superview!, withOffset: 120)
        quizDescription.autoPinEdge(.right, to: .right, of: quizDescription.superview!, withOffset: -20)
        
        quizDifficulty.autoPinEdge(.top, to: .top, of: quizDifficulty.superview!, withOffset: 5)
        quizDifficulty.autoPinEdge(.left, to: .right, of: quizTitle, withOffset: -15)
        
        backgroundColor = ColorsUtil.getEarthy()
        layer.cornerRadius = 15
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
