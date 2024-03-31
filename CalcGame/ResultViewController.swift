//
//  ResultViewController.swift
//  CalcGame
//
//  Created by Gomi Kouki on 2023/07/14.
//

import UIKit

class ResultViewController: UIViewController {
    
    var point = 0

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var MaxRecord: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recordLabel.text = "あなたの記録 \(point)P"
        MaxPoint()
    }
    
    func MaxPoint(){
        UserDefaults.standard.register(defaults: ["point":0])
        let value1 = UserDefaults.standard.integer(forKey: "point")
        if (value1 < point){
            UserDefaults.standard.set(point, forKey: "point")
        }
        let value2 = UserDefaults.standard.integer(forKey: "point")
        MaxRecord.text = "あなたの最高記録：\(value2)P"
    }
    

    @IBAction func onBackTop(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
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
