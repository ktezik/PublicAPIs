//
//  InfoViewController.swift
//  PublicAPIs
//
//  Created by Иван Гришин on 08.10.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var apiLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var authLabel: UILabel!
    @IBOutlet var httpsLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var linkLabel: UILabel!
    
    
    var infoAPI: APIs!

    override func viewDidLoad() {
        super.viewDidLoad()
        setInfoVC()
    }
    
    // MARK: - Private Methods
    func setInfoVC() {
        apiLabel.text = infoAPI.API
        descriptionLabel.text = infoAPI.Description
        if infoAPI.Auth == "" {
            authLabel.text = "Auth: absent"
        } else {
            authLabel.text = "Auth: \(infoAPI.Auth ?? "absent")"
        }
        
        if infoAPI.HTTPS {
            httpsLabel.text = "HTTPS: \(infoAPI.HTTPS)"
        } else {
            httpsLabel.text = "HTTPS: \(infoAPI.HTTPS)"
        }
        categoryLabel.text = "Category: \(infoAPI.Category ?? "...")"
        linkLabel.text = infoAPI.Link
    }
}
