import Foundation
import UIKit
import PureLayout

class QuizFunFactView: UIView {
    
    var funFact = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        makeView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeView() {
        isHidden = true
        funFact.font = UIFont(name: "AvenirNext-HeavyItalic", size: 15)
        funFact.textAlignment = .left
        funFact.textColor = .white
        funFact.lineBreakMode = .byWordWrapping
        funFact.numberOfLines = 0
        addSubview(funFact)
        
        let funFactTitle = UILabel()
        funFactTitle.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
        funFactTitle.textAlignment = .left
        funFactTitle.textColor = .systemYellow
        funFactTitle.text = "Fun fact"
        addSubview(funFactTitle)
        
        let lightBulb = UIImageView(image: UIImage(named: "bulb"))
        addSubview(lightBulb)
        
        lightBulb.autoPinEdge(.leading, to: .leading, of: lightBulb.superview!, withOffset: 5)
        lightBulb.autoPinEdge(.top, to: .top, of: lightBulb.superview!)
        lightBulb.autoSetDimension(.height, toSize: 40)
        lightBulb.autoSetDimension(.width, toSize: 40)
        
        
        funFactTitle.autoPinEdge(.leading, to: .trailing, of: lightBulb, withOffset: 5)
        funFactTitle.autoPinEdge(.top, to: .top, of: funFactTitle.superview!, withOffset: 10)
        
        funFact.autoPinEdge(.leading, to: .leading, of: funFact.superview!, withOffset: 5)
        funFact.autoPinEdge(.trailing, to: .trailing, of: funFact.superview!, withOffset: -5)
        funFact.autoPinEdge(.top, to: .bottom, of: lightBulb)
        funFact.autoPinEdge(.bottom, to: .bottom, of: funFact.superview!)
    }
    
    func setText(numberOfWordsWithNBA: Int) {
        funFact.text = "There are " + numberOfWordsWithNBA.description +
                       " questions containg word NBA"
    }
}
