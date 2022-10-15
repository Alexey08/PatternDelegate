//
//  SecondViewController.swift
//  PatternDelegate
//
//  Created by Алексей Уланов on 25.09.2022.
//

import UIKit

protocol SecondVCDelegate: AnyObject {
    
    func delegateText (text: String)
}

class SecondViewController: UIViewController {
    
    weak var delegate: SecondVCDelegate?
    
    // создаем UITextField
    private lazy var enterText: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .systemGray5
        text.font = UIFont.systemFont(ofSize: 16)
        text.placeholder = "Enter text"
        text.borderStyle = .roundedRect
        return text
    }()
    
    // создаем UIButton
    private lazy var pressButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(enterText)
        view.addSubview(pressButton)
        
        addConstraint()
        hideKeyboardWhenTappedAround()
    }
    
    private func addConstraint() {
        
        // расставляем элементы
        NSLayoutConstraint.activate([
            enterText.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            enterText.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            enterText.bottomAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            enterText.heightAnchor.constraint(equalToConstant: 64),
            
            pressButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            pressButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            pressButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            pressButton.heightAnchor.constraint(equalToConstant: 64),
        ])
    }
    
    // функция для кнопки
    @objc
    private func tapButton() {

        delegate?.delegateText(text: enterText.text!)
        enterText.text = ""
    }
    
    
    // Функция скрытия клавиатуры
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

