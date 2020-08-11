//
//  Manager.swift
//  DeportesSeries
//
//  Created by Cristian Piedrahita on 8/01/20.
//  Copyright © 2020 Cristian Piedrahita. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Manager {
   class func getSeriesList(page: Int, completion: @escaping (_ series: [TvShow]) -> Void) {
        //1. utilizamos el pod Alamofire para indicarle la url que debe de conectarse y la respuesta de que tipo es
    Alamofire.request(SeriesApiTarget.listAllSeries.urlTarget, method: SeriesApiTarget.listAllSeries.method).responseJSON { response in
             //2. Creamos una condicion de que si listsSeries es = a un array tipo directorio entre
            if let listsSeries = response.result.value as? [[String: Any]] {
                //3. creamos la array que contendra las series
                var listsSerie: [TvShow] = []
                //4. recorremos el listado de series
                for serie in listsSeries {
                    //5. Sacamos los valores de la serie
                    let serieId = serie["id"] as? Int
                    let title = serie["name"] as? String
                    let imageDictionary = serie["image"] as? [String: String]
                    let imageMediumURL = imageDictionary?["medium"]
                    let imageOriginalURL = imageDictionary?["original"]
                    let summary = serie["summary"] as? String
                    let score = serie["score"] as? Int
                    //6. creamos un objeto tipo TvShow para darle el valor encontrado anteriormente
                    let addList = TvShow()
                    addList.id = serieId
                    addList.name = title
                    addList.imageMedium = imageMediumURL
                    addList.imageOriginal = imageOriginalURL
                    addList.summary = summary
                    addList.score = score
                    //7. agregamos el contenido de la serie a nuestra array tipo TvShow
                    listsSerie.append(addList)
                }
                //8. retornamos el listado o la array de series
                completion(listsSerie)
             }
          }
    }
}
