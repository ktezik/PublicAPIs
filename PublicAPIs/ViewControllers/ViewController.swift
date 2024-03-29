//
//  ViewController.swift
//  PublicAPIs
//
//  Created by Иван Гришин on 07.10.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private var publicAPIsCount: PublicAPIs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData(from: Link.publicAPIs.rawValue)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        let tableVC = navigationController.topViewController as! TableViewController
        tableVC.publicAPI = publicAPIsCount
        
    }
    
    // MARK: - Private methods
    private func fetchData(from url: String?) {
        activityIndicator.startAnimating()
        NetworkManager.shared.fetchData(from: url) { publicAPIs in
            self.publicAPIsCount = publicAPIs
            DispatchQueue.main.async {
                self.loadView()
                self.activityIndicator.startAnimating()
                if self.countLabel.text != nil {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidesWhenStopped = true
                }
                self.countLabel.text = String(self.publicAPIsCount?.count ?? 0)
            }
        }
    }
}




