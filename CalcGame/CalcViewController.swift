//
//  CalcViewController.swift
//  CalcGame
//
//  Created by Gomi Kouki on 2023/07/13.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var questionLabel:UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var buttom1: UIButton!
    @IBOutlet weak var buttom2: UIButton!
    @IBOutlet weak var buttom3: UIButton!
    @IBOutlet weak var buttom4: UIButton!
    
    var answer = 0
    var point = 0
    var time = 20
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        makeNewQuestion()
        setButtomTitle()
        
        buttom1.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        buttom2.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        buttom3.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
        buttom4.addTarget(self, action: #selector(onButton(_:)), for: .touchUpInside)
    }
    
    @objc func countTime(){
        time -= 1
        timeLabel.text = "残り\(time)秒"
        if time == 0 {
            //残り時間が０秒になった時にタイマーを終了する
            timer?.invalidate()
            performSegue(withIdentifier: "result", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! ResultViewController
        nextVC.point = point
    }
    
    @objc func onButton(_ sender:UIButton){
        let input = Int(sender.currentTitle!)
        if input == answer {
            //正解だった時の処理
            resultLabel.text = "前回の問題：正解！"
            point += 10
        }else {
            resultLabel.text = "前回の問題：不正解"
            point -= 10
        }
        makeNewQuestion()
        setButtomTitle()
    }
    
    func makeNewQuestion(){
        let num1 = Int.random(in: 0...9)
        let num2 = Int.random(in: 0...9)
        questionLabel.text = "\(num1) + \(num2) ="
        answer = num1 + num2
    }
    
    func setButtomTitle(){
        var answerList = [answer]
        while answerList.count < 4 {
            let randomAnswer = Int.random(in: 0...18)
            if !answerList.contains(randomAnswer){
                answerList.append(randomAnswer)
            }
        }
        answerList.shuffle()
        buttom1.setTitle(String(answerList[0]), for: .normal)
        buttom2.setTitle(String(answerList[1]), for: .normal)
        buttom3.setTitle(String(answerList[2]), for: .normal)
        buttom4.setTitle(String(answerList[3]), for: .normal)
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
