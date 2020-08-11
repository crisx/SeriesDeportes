//
//  SeriesInTableController.swift
//  DeportesSeries
//
//  Created by Cristian Piedrahita on 9/01/20.
//  Copyright © 2020 Cristian Piedrahita. All rights reserved.
//

import UIKit

class SeriesInTableController: UIViewController {

    @IBOutlet weak var seriesTable: UITableView! {
        didSet {
            seriesTable.register(UINib(nibName: "SeriesRowTableViewCell", bundle: nil), forCellReuseIdentifier: "seriesRow")
            seriesTable.dataSource = self
            seriesTable.delegate = self
        }
    }
    
    var seriesArray: [TvShow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Manager.getSeriesList(page: 0) { (listsSerie) in
            self.seriesArray.append(contentsOf: listsSerie)
            self.seriesTable.reloadData()
        }
        title = "Lists Series in Table"
    }
}
extension SeriesInTableController: UITableViewDataSource,
UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentShow = seriesArray[indexPath.row]
        let row = tableView.dequeueReusableCell(withIdentifier: "seriesRow", for: indexPath)
        (row as? SeriesRowTableViewCell)?.configurateRow(serie: currentShow)
        
        row.selectionStyle = .none
        
        return row
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: "SeriesDetailViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "SeriesDetailViewController") as! SeriesDetailViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }

}
