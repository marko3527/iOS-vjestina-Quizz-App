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
    
    var quizDifficulty = UIImageView(image: UIImage(named: "oneStar"))
    var quizImage = UIImageView(image: UIImage(named: "sports"))
    
    var spacedCell: UIView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        spacedCell = UIView()
        spacedCell.backgroundColor = ColorsUtil.getEarthy()
        spacedCell.layer.cornerRadius = 15
        
        addSubview(spacedCell)
        spacedCell.addSubview(quizDescription)
        spacedCell.addSubview(quizTitle)
        spacedCell.addSubview(quizDifficulty)
        spacedCell.addSubview(quizImage)
        
        spacedCell.autoPinEdge(.top, to: .top, of: spacedCell.superview!, withOffset: 0)
        spacedCell.autoPinEdge(.leading, to: .leading, of: spacedCell.superview!,withOffset: 0)
        spacedCell.autoPinEdge(.trailing, to: .trailing, of: spacedCell.superview!, withOffset: 0)
        spacedCell.autoPinEdge(.bottom, to: .bottom, of: spacedCell.superview!, withOffset: -10)
        
        quizTitle.autoPinEdge(.left, to: .left, of: quizTitle.superview!, withOffset: 120)
        quizTitle.autoPinEdge(.right, to: .right, of: quizTitle.superview!, withOffset: -20)
        
        quizDescription.autoPinEdge(.top, to: .bottom, of: quizTitle, withOffset: 5)
        quizDescription.autoPinEdge(.left, to: .left, of: quizDescription.superview!, withOffset: 120)
        quizDescription.autoPinEdge(.right, to: .right, of: quizDescription.superview!, withOffset: -20)
        
        quizDifficulty.autoPinEdge(.top, to: .top, of: quizDifficulty.superview!, withOffset: 5)
        quizDifficulty.autoPinEdge(.left, to: .right, of: quizTitle, withOffset: -35)
        quizDifficulty.autoPinEdge(.right, to: .right, of: quizDifficulty.superview!, withOffset: -10)
        quizDifficulty.autoSetDimension(.height, toSize: 15)
        
        quizTitle.autoPinEdge(.top, to: .bottom, of: quizDifficulty)
        
        quizImage.autoPinEdge(.leading, to: .leading, of: quizImage.superview!, withOffset: 15)
        quizImage.autoPinEdge(.top, to: .top, of: quizImage.superview!, withOffset: 20)
        quizImage.autoPinEdge(.trailing, to: .leading, of: quizTitle, withOffset: -15)
        quizImage.autoPinEdge(.bottom, to: .bottom, of: quizImage.superview!, withOffset: -15)
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(category: String) {
        quizImage.image = UIImage(named: category.lowercased())
    }
    
    func setDifficulty(difficulty: Int) {
        switch difficulty {
        case 2:
            quizDifficulty.image = UIImage(named: "twoStars")
        case 3:
            quizDifficulty.image = UIImage(named: "threeStars")
        default:
            quizDifficulty.image = UIImage(named: "oneStar")
        }
    }

    
}
