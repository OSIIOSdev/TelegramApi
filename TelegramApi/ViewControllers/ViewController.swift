//
//  ViewController.swift
//  TelegramApi
//
//  Created by Илья on 19.09.2022.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTelegram()
    }
    
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func fetchTelegram() {
        guard let url = URL(string: "https://core.telegram.org/schema/json") else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Nop error description")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let telegram = try jsonDecoder.decode(Telegram.self, from: data)
                print(telegram)
                self.successAlert()
            } catch {
                print(error.localizedDescription)
                self.failedAlert()
            }
        }
                                            
        task.resume()
    }

}

