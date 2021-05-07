import Foundation

class AuthFacade {
    
    private var email : PopQuizTextField!
    private var pass : PopQuizTextField!
    
    init(email: PopQuizTextField, pass: PopQuizTextField) {
        self.email = email
        self.pass = pass
    }
    
    func authenticate() -> Bool{
        let dataService = DataService()
        let login = dataService.login(email: getEmailText(), password: getPassText())
        switch login {
        case .success:
            print(getEmailText() + " " + getPassText())
            return true
        case .error(_, _):
            email.wrongInput()
            pass.wrongInput()
            print("" + getEmailText() + " " + getPassText() + "  error")
            return false
        }
    }
    
    func getEmailText() -> String{
        return email.text!
    }
    
    func getPassText() -> String {
        return pass.text!
    }
    
}


