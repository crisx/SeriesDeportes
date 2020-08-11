//
//  SeriesRowTableViewCell.swift
//  DeportesSeries
//
//  Created by Cristian Piedrahita on 9/01/20.
//  Copyright © 2020 Cristian Piedrahita. All rights reserved.
//

import UIKit

class SeriesRowTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewTable: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configurateRow(serie: TvShow) {
    
        let placeholderImage = UIImage(named: "placeholder")!
        if let urlString = serie.imageMedium, let url = URL(string: urlString) {
            imageViewTable.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
        
        titleLabel.text = serie.name
        descriptionLabel.text = serie.summary
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    
}
