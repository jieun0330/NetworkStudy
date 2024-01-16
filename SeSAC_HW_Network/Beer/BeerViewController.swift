//
//  BeerViewController.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 1/16/24.
//

import UIKit
import Alamofire
import Kingfisher

struct Beer: Decodable {
    let image_url: String
    let name: String
    let description: String
}

class BeerViewController: UIViewController {
    
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerName: UILabel!
    @IBOutlet var beerDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest()
        
    }
    
    @IBAction func recommendBeer(_ sender: UIButton) {
        callRequest()
    }
    
    func callRequest() {
        let url = "https://api.punkapi.com/v2/beers/random"
        
        AF
            .request(url)
            .responseDecodable(of: [Beer].self) { response in
                switch response.result {
                case .success(let success):
                    //Mark: - 애초에 사이트에서 랜덤으로 뿌려주니까 [0] 이렇게 해도 되는건가?
                    self.beerImage.kf.setImage(with: URL(string: success[0].image_url))
                    self.beerName.text = success[0].name
                    self.beerDescription.text = success[0].description
                    
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
    }
}
