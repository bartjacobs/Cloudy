//
//  WeatherViewController.swift
//  Cloudy
//
//  Created by Bart Jacobs on 01/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - View Methods

    private func setupView() {
        // Configure Message Label
        self.messageLabel.isHidden = true

        // Configure Activity Indicator View
        self.activityIndicatorView.startAnimating()
        self.activityIndicatorView.hidesWhenStopped = true
    }

    private func updateView() {

    }

}
