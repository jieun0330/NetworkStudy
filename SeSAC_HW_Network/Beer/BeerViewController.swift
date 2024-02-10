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
    @IBOutlet var beerListButton: UIButton!
    
    let randomBeer = BeerAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        callRequest()
        beerListButton.addTarget(self, action: #selector(beerListButtonClicked), for: .touchUpInside)

        

    }
    
    @objc func beerListButtonClicked() {
        print("clicked")
//        let sb = UIStoryboard(name: "BeerListViewController", bundle: nil)
        let vc = storyboard?.instantiateViewController(identifier: "BeerListViewController") as! BeerListViewController
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.modalPresentationStyle = .fullScreen
//        navigationController.presentviewco
//        navigationController?.pushViewController(nav, animated: true)
        present(nav, animated: true)
    }
    
    
    func configureView() {
        beerTitle.font = UIFont.boldSystemFont(ofSize: 20)
        beerName.font = UIFont.boldSystemFont(ofSize: 16)
        
        beerListButton.setTitle("맥주 더보기", for: .normal)
    }
    

    
    
    func callRequest() {
        randomBeer.callRequest(url: .random) { result in
            self.beerImage.kf.setImage(with: URL(string: result[0].image_url))
            self.beerName.text = result[0].name
            self.beerDescription.text = result[0].description
        }
    }
    
    @IBAction func recommendBeer(_ sender: UIButton) {
        callRequest()
    }
}
