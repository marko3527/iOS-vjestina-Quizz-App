import Foundation
import UIKit
import PureLayout

class QuizFacade {
    
    func getQuizes() -> [Quiz] {
        let dataService = DataService()
        let listOfQuizess = dataService.fetchQuizes()
        for quiz in listOfQuizess {
            print(quiz.level)
        }
        return listOfQuizess
    }
    
}
