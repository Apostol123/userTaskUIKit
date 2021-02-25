//
//  LoginViewController.swift
//  UserTasksUIKit
//
//  Created by Apostol, Alexandru on 15/02/2021.
//  Copyright © 2021 Apostol, Alexandru. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var presenter: LoginViewControllerPresenterProtocol
    let model: LoginViewControllerModel

    
    lazy var  titleLabel: UIView = {
        let view = UIView(frame: .zero)
        let titleLabel = UILabel(frame: .zero)
        titleLabel.text = model.title
        titleLabel.font = UIFont(name: "AvenirNext-Bold", size: 28)
        titleLabel.textAlignment = .center
        view.fill(view: titleLabel, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 0, right: 0))
        return view
    }()
    
    lazy var usernameTextField: UITextField = {
       
        let textField = UITextField(frame: .zero)
        textField.placeholder = model.usernameHint
        textField.textAlignment = .center
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 3.0
        
        return textField
    }()
    
    lazy var usernameTextFieldContainer: UIView = {
         let view = UIView(frame: .zero)
        view.fill(view: usernameTextField, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 0, right: -16))
        return view
    }()
    
    lazy var passwordTextField: UITextField = {
         
        let textField = UITextField(frame: .zero)
        textField.isSecureTextEntry = true
        textField.textAlignment = .center
        textField.placeholder = model.passwordHint
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 3.0
        
        return textField
    }()
    
    lazy var passwordTextFieldContainer: UIView = {
        let view = UIView(frame: .zero)
        view.fill(view: passwordTextField, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 0, right: -16))
        return view
    }()
    
    lazy var loginButton: UIView = {
        let view = UIView(frame: .zero)
        let button = UIButton(frame: .zero)
        button.titleLabel?.textColor = .green
        button.backgroundColor = .orange
        button.setTitle(model.buttonTitle, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5.0
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.addTarget(self, action: #selector(loginPressed), for: .touchDown)
         view.fill(view: button, edgeInset: UIEdgeInsets(top: 16, left: -16, bottom: 0, right: -16))
        return view
    }()
    
    lazy var freeSpaceView: UIView = {
         let view = UIView(frame: .zero)
         return view
     }()
    
    lazy var textStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.addArrangedSubview(titleLabel)

        stackView.addArrangedSubview(usernameTextFieldContainer)
        stackView.addArrangedSubview(passwordTextFieldContainer)
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    init(presenter: LoginViewControllerPresenterProtocol) {
        self.presenter = presenter
        self.model = presenter.loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureStackView()
        print(model.title)
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    func configureStackView() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: navigationController!.navigationBar.frame.height + 40).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -38).isActive = true
        mainStackView.addArrangedSubview(textStackView)
        mainStackView.addArrangedSubview(freeSpaceView)
        mainStackView.addArrangedSubview(loginButton)
    }
    
    @objc func loginPressed() {
        if let username = usernameTextField.text,
            let password = passwordTextField.text {
            presenter.login(username: username, password: password)
        } 
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



extension UIView {
    public func fill(view : UIView, edgeInset: UIEdgeInsets = UIEdgeInsets.zero) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInset.left).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -edgeInset.right).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: -edgeInset.top).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: edgeInset.bottom).isActive = true
    }
}

extension LoginViewController: LoginViewProtocol {
}
