//
//  Series.swift
//  DeportesSeries
//
//  Created by Cristian Piedrahita on 6/01/20.
//  Copyright © 2020 Cristian Piedrahita. All rights reserved.
//

import UIKit

class SeriesController: UIViewController {

    //MARK: OUTLETS
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: "SerieCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "serieCell")
        }
    }
    
    var seriesArray: [TvShow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Manager.getSeriesList(page: 0) { (listsSerie) in
            self.seriesArray.append(contentsOf: listsSerie)
            self.collectionView.reloadData()
        }
    title = "lists Series"
    }
    
}

//MARK: COLLECTIONVIEW DELEGATE AND DATASOURCE

extension SeriesController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let curentShow = seriesArray[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "serieCell", for: indexPath)
        (cell as? SerieCellCollectionViewCell)?.configurate(serie: curentShow)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.frame.width
        for numeroItem in 2...1000 {
            let spaceCell: CGFloat = (20 + (10 * (CGFloat(numeroItem) - 1)))
            let width = (collectionWidth - spaceCell) / CGFloat(numeroItem)
            let newHeigth = (295 * width) / 210
            
            if width <= 192 {
                return CGSize(width: width, height: newHeigth)
            }
        }
        return CGSize(width: 192, height: 269)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "SeriesDetailViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SeriesDetailViewController") as! SeriesDetailViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
        
}
