import Foundation

class AuthFacade {
    
    private var email : PopQuizTextField!
    private var pass : PopQuizTextField!
    
    init(email: PopQuizTextField, pass: PopQuizTextField) {
        self.email = email
        self.pass = pass
    }
    
    func authenticate() -> String{
        let dataService = DataService()
        let login = dataService.login(email: getEmailText(), password: getPassText())
        switch login {
        case .success:
            return(getEmailText() + " " + getPassText())
        case .error(_, _):
            email.wrongInput()
            pass.wrongInput()
            return("" + getEmailText() + " " + getPassText() + "  error")
        }
    }
    
    func getEmailText() -> String{
        return email.text!
    }
    
    func getPassText() -> String {
        return pass.text!
    }
    
}


