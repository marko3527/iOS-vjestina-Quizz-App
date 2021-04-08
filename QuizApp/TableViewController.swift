import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var listOfQuizes : [Quiz]!
    var mappedCategories:[QuizCategory:[Quiz]]!
    private var quizService = QuizService()
    
    func setQuizes(quizes: [Quiz]) {
        listOfQuizes = quizes
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (listOfQuizes != nil){
            mappedCategories = quizService.mapCategories(quizes: listOfQuizes)
            return quizService.countCategories(quizes: listOfQuizes)
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(listOfQuizes == nil) {
            return 0
        }
        else {
            return mappedCategories[section].value.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kviz", for: indexPath) as! QuizCell
    
        let quiz = mappedCategories[indexPath.section].value[indexPath.row]
        cell.setDifficulty(difficulty: quiz.level)
        cell.setImage(category: quiz.category.rawValue)
        cell.quizTitle.text = quiz.title
        cell.quizDescription.text = quiz.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = UIView()
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-HeavyItalic", size: 20)
        label.textAlignment = .left
        label.textColor = .white
        if(mappedCategories != nil){
            label.text = mappedCategories[section].key.rawValue
        }
        label.backgroundColor = .clear
        sectionHeader.addSubview(label)
        label.autoPinEdge(.leading, to: .leading, of: label.superview!)
        label.autoPinEdge(.trailing, to: .trailing, of: label.superview!)
        label.autoPinEdge(.top, to: .top, of: label.superview!)
        return sectionHeader
    }
    
}
