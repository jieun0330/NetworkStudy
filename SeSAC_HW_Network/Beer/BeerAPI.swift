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
    
//    let url = "https://api.punkapi.com/v2/beers/random"
    
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
    
//    func callRequestDetailBeer() {
//        let url = "https://api.punkapi.com/v2/beers"
//        
//        AF
//            .request(url, method: .get)
//            .responseDecodable(of: [Beer].self) { response in
//                switch response.result {
//                case .success(let success):
//                    print(success)
//                case .failure(let failure):
//                    print(failure)
//                }
//            }
//    }
    
    
}
