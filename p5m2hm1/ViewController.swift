//
//  ViewController.swift
//  p5m2hm1


import UIKit

protocol ViewControllerDelegate {
    func addNum(num1: String, num2: String)
    func subNum(num1: String, num2: String)
    func divisionNum(num1: String, num2: String)
    func multNum(num1: String, num2: String)
}

class ViewController: UIViewController {
    
    
//MARK: - view
    lazy var titleName = {
       let label = UILabel(frame: CGRect(x: 46, y: 58, width: 158, height: 29))
        label.text = "Калькулятор"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    lazy var resultLabelTitle = {
       let label = UILabel(frame: CGRect(x: 154, y: 218, width: 82, height: 19))
        label.text = "Результат"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.center.x = view.center.x
        return label
    }()
    
    lazy var rLabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 243, width: 200, height: 60))
        label.textColor = .black
        label.font = .systemFont(ofSize: 46)
        label.textAlignment = .center
        label.center.x = view.center.x
        return label
    }()
    lazy var num1Label = {
       let text = UILabel()
        text.frame = CGRect(x: 30, y: 243, width: 60, height: 60)
        text.textColor = .black
        text.textAlignment = .center
        return text
    }()
  
    lazy var num2Label = {
       let text = UILabel()
        text.frame = CGRect(x: 170, y: 243, width: 60, height: 60)
        text.textColor = .black
        text.textAlignment = .center
        return text
    }()
  
    lazy var btnGo: UIButton = {
        let btn = UIButton(primaryAction: action)
        btn.frame = CGRect(x: 30, y: 439, width: 340, height: 54)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.6066274047, blue: 1, alpha: 1)
        btn.setTitle("расчитать", for: .normal)
        btn.tintColor = .white
        btn.center.x = view.center.x
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleName)
        view.addSubview(resultLabelTitle)
        view.addSubview(btnGo)
        view.addSubview(rLabel)
   
    }
    lazy var action = UIAction { _ in
        let vc = SecondViewController()
        vc.delegate = self
        vc.num1Text.text = self.num1Label.text
        vc.num2Text.text = self.num2Label.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: ViewControllerDelegate {

    func addNum(num1: String, num2: String) {
        num1Label.text = num1
        num2Label.text = num2
        if let a = Int(num1), let b = Int(num2) {
            let c = a + b
            rLabel.text = "\(a) \(SecondViewController().addBtn.title(for: .normal)!) \(b) = \(c)"
        }
    }
    func subNum(num1: String, num2: String) {
        num1Label.text = num1
        num2Label.text = num2
        if let a = Int(num1), let b = Int(num2) {
            let c = a - b
            rLabel.text = "\(a) \(SecondViewController().subBtn.title(for: .normal)!) \(b) = \(c)"
        }
    }
    func divisionNum(num1: String, num2: String) {
        num1Label.text = num1
        num2Label.text = num2
        if let a = Int(num1), let b = Int(num2) {
                let c = a / b
                rLabel.text = "\(a) \(SecondViewController().divideBtn.title(for: .normal)!) \(b) = \(c)"
        }
    }
    func multNum(num1: String, num2: String) {
        num1Label.text = num1
        num2Label.text = num2
        if let a = Int(num1), let b = Int(num2) {
            let c = a * b
            rLabel.text = "\(a) \(SecondViewController().multBtn.title(for: .normal)!) \(b) = \(c)"
        }
    }
}
