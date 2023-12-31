//
//  AuthViewController.swift
//  ImageFeed_8_sprint
//
//  Created by Марат Хасанов on 06.10.2023.
//

import UIKit

protocol AuthViewControllerDelegate: AnyObject {
    func authViewController(_ vc: AuthViewController, didAuthenticateWithCode code: String)
}
//Экран авторизации с кнопкой "Войти"
final class AuthViewController: UIViewController {
    
    weak var delegate: AuthViewControllerDelegate?
    
    private let webViewSegueIdentifier: String = "ShowWebView"
    
    //Делаем тек. класс делегатом WebViewViewController'a
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == webViewSegueIdentifier {
            guard let webViewController = segue.destination as? WebViewViewController
            else { fatalError("Failed to prepare for \(webViewSegueIdentifier)") }
            webViewController.delegate = self
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

//Добавляем делегат
extension AuthViewController: WebViewViewControllerDelegate {
    func webViewViewController(_ vc: WebViewViewController, didAuthenticateWithCode code: String) {
        delegate?.authViewController(self, didAuthenticateWithCode: code)
    }
    
    func webViewViewControllerDidCancel(_ vc: WebViewViewController) {
        dismiss(animated: true)
    }
}

