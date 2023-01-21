//
//  ViewController.swift
//  faceIdAndTouchId
//
//  Created by Maria Eduarda Ferreira Da Silva on 17/11/22.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 18
        button.titleLabel?.font = UIFont(name: "Inter-Light", size: 17)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(button)
        configConstraints()
    }
    
    @objc func tappedLoginButton(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "informe sua authenticacao"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { sucess, error in
                if sucess {
                    print("Sucesso")
                } else {
                    print("Falha na autenticação")
                }
            }
        } else {
            print("Authenticacao indisponivel")
        }
    }

    public func configConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:  -20),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

}

