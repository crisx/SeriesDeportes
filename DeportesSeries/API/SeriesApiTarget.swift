//
//  SeriesApiTarget.swift
//  DeportesSeries
//
//  Created by Cristian Piedrahita on 6/01/20.
//  Copyright © 2020 Cristian Piedrahita. All rights reserved.
//

import Foundation
import Alamofire

enum SeriesApiTarget {
    
    case listAllSeries
    case serieInfo(id: Int)
}

extension SeriesApiTarget {
    
    var baseURL: URL { URL(string: "http://api.tvmaze.com")! }
    
    var path: String {
        switch self {
        case .listAllSeries: return "/shows"
        case .serieInfo(let id): return "/shows/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .listAllSeries, .serieInfo:
            return .get
        }
    }
    
    var urlTarget: String {
        return baseURL.absoluteString + self.path
    }
}
