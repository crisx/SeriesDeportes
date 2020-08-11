//
//  SerieCellCollectionViewCell.swift
//  DeportesSeries
//
//  Created by Cristian Piedrahita on 7/01/20.
//  Copyright © 2020 Cristian Piedrahita. All rights reserved.
//

import UIKit
import AlamofireImage

class SerieCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewTitle: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var contentsViews: UIView!
    
    
    
    func configurate(serie: TvShow) {
        // se le agrega las puntas del item rodondiada a 6
        self.layer.cornerRadius = 6
        self.layer.masksToBounds = false
        // Se le agrega las puntas redondiadas y se le habilta el corte de las puntas
        contentsViews.layer.cornerRadius = 6
        contentsViews.layer.masksToBounds = true
        // se agrega la sombra al item
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        // se realiza el cargo de las imagenes de las series
        let placeholderImage = UIImage(named: "placeholder")!
        if let urlString = serie.imageMedium, let url = URL(string: urlString) {
            imageView.af_setImage(withURL: url, placeholderImage: placeholderImage)
        }
        //
        
        // se cargan los titulos de las series
        labelTitle.text = serie.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
