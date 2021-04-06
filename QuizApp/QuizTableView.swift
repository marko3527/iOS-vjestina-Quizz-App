import Foundation
import UIKit

class QuizTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    convenience init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: UITableView.Style.plain)
        makeTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeTableView() {
        backgroundColor = UIColor.white.withAlphaComponent(0)
        separatorStyle = .none
        rowHeight = 130
    }
    
}
