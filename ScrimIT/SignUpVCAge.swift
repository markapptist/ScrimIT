//
//  SignUpVCAge.swift
//  ScrimIT
//
//  Created by Mark Meritt on 2017-03-28.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit

class SignUpVCAge: SignUpLogInVC, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerView = UIPickerView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    let pickerData = ["1-10", "11-16", "16-25", "25+"]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        joinBtn.removeFromSuperview()
        logInBtn.removeFromSuperview()
        
        nextButton.isHidden = false
        nextButton.alpha = 1.0
        questionLabel.isHidden = false
        questionLabel.text = "What is your age group?"
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: self.questionLabel.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: self.questionLabel.centerYAnchor, constant: 70).isActive = true
        pickerView.widthAnchor.constraint(equalTo: self.questionLabel.widthAnchor, multiplier: 0.8).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: self.nextButton.topAnchor, constant: 10).isActive = true
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        index = row
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        let pickerTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "MyriadPro-BoldCond", size: 25)!, NSForegroundColorAttributeName:UIColor.blue])
        
        return pickerTitle
    }
    
    override func nextBtnPressed() {
        if(nextButton.alpha == 1.0) {
            userDefaults.setValue(pickerData[index], forKey: "ageGroup")
            self.navigationController?.pushViewController(SignUpVCCity(), animated: false)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       
   
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */


}
