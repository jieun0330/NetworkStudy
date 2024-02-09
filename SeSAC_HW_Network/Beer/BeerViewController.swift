//
//  BeerViewController.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 1/16/24.
//

import UIKit
import Alamofire
import Kingfisher

class BeerViewController: UIViewController {
    
    @IBOutlet var beerTitle: UILabel!
    @IBOutlet var beerImage: UIImageView!
    @IBOutlet var beerName: UILabel!
    @IBOutlet var beerDescription: UILabel!
    
    let randomBeer = BeerAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        callRequest()

    }
    
    func configureView() {
        beerTitle.font = UIFont.boldSystemFont(ofSize: 20)
        beerName.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func callRequest() {
        randomBeer.callRequest { result in
            self.beerImage.kf.setImage(with: URL(string: result[0].image_url))
            self.beerName.text = result[0].name
            self.beerDescription.text = result[0].description
        }
    }
    
    @IBAction func recommendBeer(_ sender: UIButton) {
        callRequest()
    }
}
