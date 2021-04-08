import Foundation
import UIKit
import PureLayout

class QuizzesViewController : UIViewController {
    
    let gradient: CAGradientLayer = CAGradientLayer()
    private var quizService = QuizService()
    var tableView: QuizTableView!
    var twController: TableViewController!
    var funFact: QuizFunFactView!
    

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
        nazivAplikacije.autoPinEdge(toSuperviewSafeArea: .top, withInset: 50)
        nazivAplikacije.autoSetDimension(.height, toSize: 50)
        
        let dohvatiKvizove = FetchQuizButton()
        dohvatiKvizove.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        self.view.addSubview(dohvatiKvizove)
        
        dohvatiKvizove.autoAlignAxis(toSuperviewAxis: .vertical)
        dohvatiKvizove.autoPinEdge(.top, to: .bottom, of: nazivAplikacije, withOffset: 30)
        dohvatiKvizove.autoPinEdge(toSuperviewSafeArea: .left, withInset: 20)
        dohvatiKvizove.autoPinEdge(toSuperviewSafeArea: .right, withInset: 20)
        dohvatiKvizove.autoSetDimension(.height, toSize: 40)
        
        funFact = QuizFunFactView()
        self.view.addSubview(funFact)
        funFact.autoPinEdge(.top, to: .bottom, of: dohvatiKvizove, withOffset: 15)
        funFact.autoPinEdge(toSuperviewSafeArea: .left, withInset: 20)
        funFact.autoPinEdge(toSuperviewSafeArea: .right, withInset: 20)
        
        tableView = QuizTableView()
        twController = TableViewController()
        tableView.delegate = twController
        tableView.register(QuizCell.self, forCellReuseIdentifier: "kviz")
        tableView.dataSource = twController
        self.view.addSubview(tableView)
        tableView.autoPinEdge(toSuperviewSafeArea: .left, withInset: 20)
        tableView.autoPinEdge(toSuperviewSafeArea: .right, withInset: 20)
        tableView.autoPinEdge(.top, to: .bottom, of: funFact, withOffset: 30)
        tableView.autoPinEdge(toSuperviewSafeArea: .bottom, withInset: 50)
    }
    
    @objc
    func clicked(sender: UIButton!) {
        twController.setQuizes(quizes: quizService.getQuizes())
        funFact.isHidden = false
        funFact.setText(numberOfWordsWithNBA: quizService.countWordsWithNBA(quizes: quizService.getQuizes()))
        tableView.reloadData()
        
    }
    
}
