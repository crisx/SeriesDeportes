//
//  TabController.swift
//  DeportesSeries
//
//  Created by Cristian Piedrahita on 6/01/20.
//  Copyright © 2020 Cristian Piedrahita. All rights reserved.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configTab()

        // Do any additional setup after loading the view.
    }
    func configTab(){
        guard let seriesController = UIStoryboard(name: "Series", bundle: nil).instantiateInitialViewController(),
              let seriesTableController = UIStoryboard(name: "SeriesInTable", bundle: nil).instantiateInitialViewController(),
              let deportesController = UIStoryboard(name: "Deportes", bundle: nil).instantiateInitialViewController() else {
            return
        }
        
        seriesController.tabBarItem.title = "Series"
        seriesController.tabBarItem.image = UIImage(named: "icon_series")
        seriesTableController.tabBarItem.title = "Series in Table"
        seriesTableController.tabBarItem.image = UIImage(named: "icon_seriesTable")
        deportesController.tabBarItem.title = "Deportes"
        deportesController.tabBarItem.image = UIImage(named: "icon_deportes")
        setViewControllers([seriesController,seriesTableController,deportesController], animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
