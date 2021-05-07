import Foundation
import UIKit
import PureLayout

class QuizzesViewController : UIViewController {
    
    let gradient: CAGradientLayer = CAGradientLayer()
    private var quizService = QuizService()
    var tableView: QuizTableView!
    var twController: TableViewController!
    var funFact: QuizFunFactView!
    
    
    private var router: AppRouterProtocol!
    
    convenience init(router: AppRouterProtocol) {
        self.init()
        self.router = router
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        gradient.frame = view.layer.bounds
    }
    
    
    func setGradientBackground() {
        
        self.view.backgroundColor = .white
        
        gradient.colors = [ColorsUtil.getLightBlue().cgColor, ColorsUtil.getBlue().cgColor,]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x:1.0, y:0.0)
        gradient.endPoint = CGPoint(x:0.0, y:1.0)
        gradient.frame = view.layer.bounds
        
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    
    func buildViews() {
        let nazivAplikacije = PopQuizLabel(labelText: "Pop Quiz", fontSize: 30)
        self.view.addSubview(nazivAplikacije)
        
        nazivAplikacije.autoAlignAxis(toSuperviewAxis: .vertical)
        nazivAplikacije.autoPinEdge(toSuperviewSafeArea: .top, withInset: 20)
       
        
        let dohvatiKvizove = FetchQuizButton()
        dohvatiKvizove.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        self.view.addSubview(dohvatiKvizove)
        
        dohvatiKvizove.autoAlignAxis(toSuperviewAxis: .vertical)
        dohvatiKvizove.autoPinEdge(.top, to: .bottom, of: nazivAplikacije, withOffset: 15)
        dohvatiKvizove.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        dohvatiKvizove.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
        dohvatiKvizove.autoSetDimension(.height, toSize: 30)
        
        funFact = QuizFunFactView()
        self.view.addSubview(funFact)
        funFact.autoPinEdge(.top, to: .bottom, of: dohvatiKvizove, withOffset: 5)
        funFact.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        funFact.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
        
        tableView = QuizTableView()
        twController = TableViewController(router: router)
        tableView.delegate = twController
        tableView.register(QuizCell.self, forCellReuseIdentifier: "kviz")
        tableView.dataSource = twController
        self.view.addSubview(tableView)
        tableView.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 20)
        tableView.autoPinEdge(toSuperviewSafeArea: .trailing, withInset: 20)
        tableView.autoPinEdge(.top, to: .bottom, of: funFact, withOffset: 15)
        tableView.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: 50)
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        let quizes = self
        let settings = SettingViewController(router: router)
        
        quizes.tabBarItem = UITabBarItem(title: "QUIZZES", image: .add, selectedImage: .add)
        settings.tabBarItem = UITabBarItem(title: "SETTINGS", image: .add, selectedImage: .add)
    
    }
    
    @objc
    func clicked(sender: UIButton!) {
        let quizes = quizService.getQuizes()
        twController.setQuizes(quizes: quizes)
        funFact.isHidden = false
        funFact.setText(numberOfWordsWithNBA: quizService.countWordsWithNBA(quizes: quizes))
        tableView.reloadData()
        
    }
    
}
