//
//  WeatherDayTableViewCell.swift
//  Cloudy
//
//  Created by Bart Jacobs on 02/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class WeatherDayTableViewCell: UITableViewCell {

    // MARK: - Type Properties

    static let reuseIdentifier = "WeatherDayCell"

    // MARK: - Properties

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        // Configure Cell
        selectionStyle = .none
    }

}
