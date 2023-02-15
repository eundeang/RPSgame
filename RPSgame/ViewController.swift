//
//  ViewController.swift
//  RPSgame
//
//  Created by 허은정 on 2023/02/14.
//

import UIKit

class ViewController: UIViewController {
    
    // 변수, 속성
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiseLabel: UILabel!
    @IBOutlet weak var myChoiseLabel: UILabel!
    
    var comChoise :Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoise : Rps = Rps.rock
    
    
    // 함수 , 메소드
    //viewDidLoad함수는 앱이 처음 실행될 때, 실행되는 초기값 함수임
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 첫번째/두번째 이미지 뷰에 준비 이미지를 띄워야 함
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
    
        // 첫번째/두번째 레이블에 준비라고 문자열을 띄워줘야 함
        comChoiseLabel.text = "준비"
        myChoiseLabel.text = "준비"
    }
    
    //가위 바위 보, 세개믜 버튼에 연결되어 있음
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위/바위/보를 선택해서 그 정보를 저장해야 함
//        guard let title = sender.currentTitle else
//        {
//            return
//        }
        //버튼의 문자를 가져옴
        let title = sender.currentTitle!
        
        switch title
        {
        case "가위" :
            myChoise = Rps.scissors
        case "바위" :
            myChoise = Rps.rock
        case "보" :
            myChoise = Rps.paper
        default :
            break
        }
        
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        //컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        //컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoise
        {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiseLabel.text = "주먹"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiseLabel.text = "가위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiseLabel.text = "보"
        }
        //내가
        //내가
        switch myChoise
        {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiseLabel.text = "주먹"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiseLabel.text = "가위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiseLabel.text = "보"
        }
    
        
        // 비교
        if comChoise==myChoise{
            mainLabel.text = "비겼다"
        }else if comChoise == .rock && myChoise == .paper{
            mainLabel.text = "이겼다"
        }else if comChoise == .scissors && myChoise == .rock{
            mainLabel.text = "이겼다"
        }else if comChoise == .paper && myChoise == .scissors{
            mainLabel.text = "이겼다"
        }else{
            mainLabel.text = "졌다"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        //컴퓨터가 다시 준비한 것을 이미지뷰에 표시
        //컴퓨터가 다시 준비 한 것을 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiseLabel.text = "준비"
        //내가
        //내가
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiseLabel.text = "준비"
        // 메인 레이블 선택하세요 표시
        mainLabel.text = "다시 선택하세요"
        comChoise = Rps(rawValue: Int.random(in: 0...2))!
        
        //컴츄터가 다시
    }
    
}
