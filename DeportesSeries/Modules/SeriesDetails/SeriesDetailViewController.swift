//
//  SeriesDetailViewController.swift
//  DeportesSeries
//
//  Created by Cristian Piedrahita on 10/01/20.
//  Copyright © 2020 Cristian Piedrahita. All rights reserved.
//

import UIKit

class SeriesDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "hola mundo"
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2) {
            self.view.backgroundColor = .orange
            
        }
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
