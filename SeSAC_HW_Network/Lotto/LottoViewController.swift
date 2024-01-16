//
//  LottoViewController.swift
//  SeSAC_HW_Network
//
//  Created by 박지은 on 1/16/24.
//

import UIKit
import Alamofire

//Mark: - 파일 별도로 뺄 수 있는게 뭔지 확인하기
struct Lotto: Decodable {
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

class LottoViewController: UIViewController {
    
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var lottoNumberLabel: UILabel!
    
    //Mark: - 최신회차 숫자가 아닌 다른 방법이 있는지 고민만 해보기
    let numberList: [Int] = Array(1...1102).reversed()
    
    var lottoPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        numberTextField.tintColor = .clear
        numberTextField.inputView = lottoPickerView
        
        configureView()
        
        callRequest(number: numberList.endIndex)
        numberTextField.text = "\(numberList.endIndex)회차"
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func configureView() {
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
    }
    
    //Mark: - request 따로 파일 빼보기
    func callRequest(number: Int) {
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        AF
            .request(url, method: .get)
            .responseDecodable(of: Lotto.self) { response in
                switch response.result {
                case .success(let success):
                    //Mark: - 형변환 코드 바꿔보기
                    self.lottoNumberLabel.text = "\(String(success.drwtNo1)) \(String(success.drwtNo2)) \(String(success.drwtNo3)) \(String(success.drwtNo4)) \(String(success.drwtNo5)) \(String(success.drwtNo6))"
                case .failure(let failure):
                    print("오류 발생")
                }
            }
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource  {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callRequest(number: numberList[row])
        numberTextField.text = "\(numberList[row])회차"
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}
