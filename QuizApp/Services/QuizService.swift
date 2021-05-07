import Foundation
import UIKit
import PureLayout

class QuizService {
    
    func getQuizes() -> [Quiz] {
        let dataService = DataService()
        return dataService.fetchQuizes()
    }
    
    func mapCategories(quizes: [Quiz]) -> [QuizCategory:[Quiz]] {
        var dict = [QuizCategory:[Quiz]]()
        for quiz in quizes {
            if(dict[quiz.category] == nil){
                dict[quiz.category] = [quiz]
            }
            else{
                dict[quiz.category]! += [quiz]
            }
        }
        return dict
    }
    
    func countCategories(quizes: [Quiz]) -> Int {
        let mappedItems = quizes.map { (quiz: Quiz) -> String in
            return quiz.category.rawValue
        }
        let items = mappedItems.map { ($0, 1) }
        let categories = Dictionary(items, uniquingKeysWith: +)
        return categories.count
    }
    
    func countWordsWithNBA(quizes: [Quiz]) -> Int {
        var cnt = 0
        quizes.map({(value: Quiz) -> [Question] in
            return value.questions
        }).forEach({(value: [Question]) in
            cnt += value.filter({(value: Question) -> Bool in
                    return value.question.contains("NBA")
                    }).count
        })
        return cnt
    }
    
}

extension Dictionary {
    subscript(i: Int) -> (key:Key, value: Value){
        get{
            return self[index(startIndex, offsetBy: i)]
        }
    }
}
