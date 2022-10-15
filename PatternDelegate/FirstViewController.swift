//
//  ViewController.swift
//  PatternDelegate
//
//  Created by Алексей Уланов on 25.09.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    // создаем UILabel
    private lazy var textLabel: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.textColor = .black
        lable.backgroundColor = .systemGray3
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textAlignment = .center
        lable.layer.cornerRadius = 10
        lable.clipsToBounds = true
        return lable
    }()
    
    // создаем UIButton
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open", for: .normal)
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
        
        view.addSubview(textLabel)
        view.addSubview(openButton)
        
        addConstraint()
    }
    
    private func addConstraint() {
        
        // расставляем элементы
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 64),
            
            openButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            openButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            openButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            openButton.heightAnchor.constraint(equalToConstant: 64),            
        ])
    }                
    
    // функция для кнопки
    @objc
    private func tapButton() {
            
        let secondVC = SecondViewController()
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension FirstViewController: SecondVCDelegate {
    
    func delegateText(text: String) {
        textLabel.text = text
    }
}

