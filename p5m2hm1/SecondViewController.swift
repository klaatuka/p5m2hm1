//
//  SecondViewController.swift
//  p5m2hm1



import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    var delegate: ViewControllerDelegate?
    
    lazy var imputData: UILabel = {
        let text = UILabel()
        text.frame = CGRect(x: 46, y: 88, width: 184, height: 29)
        text.text = "Ввести данные"
        text.font = .boldSystemFont(ofSize: 24)
        text.textColor = .black
        return text
    }()
    //MARK: - 2TextFields
    lazy var num1Text: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 46, y: 153, width: 162, height: 55)
        text.textColor = .black
        text.delegate = self
        text.font = .systemFont(ofSize: 24)
        text.attributedPlaceholder = NSAttributedString(string: "число 1",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)])
        text.backgroundColor = #colorLiteral(red: 0.965680182, green: 0.965680182, blue: 0.965680182, alpha: 1)
        text.textAlignment = .center
        return text
    }()
    lazy var num2Text: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 223, y: 153, width: 162, height: 55)
        text.textColor = .black
        text.delegate = self
        text.font = .systemFont(ofSize: 24)
        text.attributedPlaceholder = NSAttributedString(string: "число 2",
                                                         attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)])
        text.backgroundColor = #colorLiteral(red: 0.965680182, green: 0.965680182, blue: 0.965680182, alpha: 1)
        text.textAlignment = .center
        return text
    }()
    
    //MARK: - 4Buttons
    
    lazy var addBtn: UIButton = {
        let btn = UIButton(primaryAction: actionAdd)
        btn.frame = CGRect(x: 48, y: 269, width: 63, height: 63)
        btn.setTitle("+", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.6066274047, blue: 1, alpha: 1)
        btn.tintColor = .white
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        
        return btn
    }()
    lazy var subBtn: UIButton = {
        let btn = UIButton(primaryAction: actionSub)
        btn.frame = CGRect(x: 139, y: 269, width: 63, height: 63)
        btn.setTitle("-", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.6066274047, blue: 1, alpha: 1)
        btn.tintColor = .white
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        return btn
    }()
    lazy var divideBtn: UIButton = {
        let btn = UIButton(primaryAction: actionDivide)
        btn.frame = CGRect(x: 230, y: 269, width: 63, height: 63)
        btn.setTitle("/", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.6066274047, blue: 1, alpha: 1)
        btn.tintColor = .white
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        return btn
    }()
    lazy var multBtn: UIButton = {
        let btn = UIButton(primaryAction: actionMult)
        btn.frame = CGRect(x: 321, y: 269, width: 63, height: 63)
        btn.setTitle("*", for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.6066274047, blue: 1, alpha: 1)
        btn.tintColor = .white
        btn.titleLabel?.font = .systemFont(ofSize: 20)
        return btn
    }()
    lazy var alertLabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 350, width: 200, height: 19))
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.center.x = view.center.x
        return label
    }()
    //MARK: - 2StackView
    lazy var stackViewBtn = {
        let stack = UIStackView()
        stack.frame = CGRect(x: 0, y: 269, width: 312, height: 63)
        stack.center.x = view.center.x
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    lazy var stackViewLbl = {
        let stack = UIStackView()
        stack.frame = CGRect(x: 0, y: 153, width: 312, height: 63)
        stack.center.x = view.center.x
        stack.spacing = 15
        stack.distribution = .fillEqually
        return stack
    }()
    //MARK: - reset
    lazy var resetBtn: UIButton = {
        let btn = UIButton(primaryAction: resetAction)
        btn.frame = CGRect(x: 0, y: 400, width: 200, height: 63)
        btn.center.x = view.center.x
        btn.setTitle("сбросить данные", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.6066274047, blue: 1, alpha: 1)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imputData)
        stackViewLbl.addArrangedSubview(num1Text)
        stackViewLbl.addArrangedSubview(num2Text)
        view.addSubview(stackViewLbl)
        view.addSubview(alertLabel)
        view.addSubview(resetBtn)
        stackViewBtn.addArrangedSubview(addBtn)
        stackViewBtn.addArrangedSubview(subBtn)
        stackViewBtn.addArrangedSubview(divideBtn)
        stackViewBtn.addArrangedSubview(multBtn)
        view.addSubview(stackViewBtn)
    }
  //MARK: - buttonsAction
    lazy var actionAdd = UIAction { [self] _ in
        if num1Text.text != "", num2Text.text != ""{
        delegate?.addNum(num1: num1Text.text!, num2: num2Text.text!)
        navigationController?.popViewController(animated: true)
        } else {
            alertLabel.text = "Заполните все поля"
        }
    }
    lazy var actionSub = UIAction { [self] _ in
        if num1Text.text != "", num2Text.text != ""{
        delegate?.subNum(num1: num1Text.text!, num2: num2Text.text!)
        navigationController?.popViewController(animated: true)
        } else {
            alertLabel.text = "Заполните все поля"
        }
    }
    lazy var actionDivide = UIAction { [self] _ in
        if num1Text.text != "", num2Text.text != ""{
            if num1Text.text != "0" && num2Text.text != "0"{
                delegate?.divisionNum(num1: num1Text.text!, num2: num2Text.text!)
                navigationController?.popViewController(animated: true)
            } else {
                alertLabel.text = "на 0 делить нельзя"
            }
        } else {
            alertLabel.text = "Заполните все поля"
        }
    }
    lazy var actionMult = UIAction { [self] _ in
        if num1Text.text != "", num2Text.text != ""{
        delegate?.multNum(num1: num1Text.text!, num2: num2Text.text!)
        navigationController?.popViewController(animated: true)
        } else {
            alertLabel.text = "Заполните все поля"
        }
    }
    //MARK: - resetAction
    lazy var resetAction = UIAction { _ in
        self.num1Text.text = ""
        self.num2Text.text = ""
    }
    //MARK: - UITextFielDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.keyboardType = .numberPad
    }
}
