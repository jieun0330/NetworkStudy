//
//  BeerAPI.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 2/9/24.
//

import Foundation
import Alamofire

enum beerURL {
    case random
    case collection
    
    var urlString: String {
        switch self {
        case .random:
            return "https://api.punkapi.com/v2/beers/random"
        case .collection:
            return "https://api.punkapi.com/v2/beers"
        }
    }
}

class BeerAPI {
    
    func callRequest(url: beerURL, completionHandler: @escaping ([Beer]) -> Void) {
        
        AF
            .request(url.urlString)
            .responseDecodable(of: [Beer].self) { response in
                switch response.result {
                case .success(let success): // success: [Beer]
                    
                    completionHandler(success)
                    
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
    }
}
