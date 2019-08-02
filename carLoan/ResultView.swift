//
//  ResultView.swift
//  carLoan
//
//  Created by developer on 2019/7/29.
//  Copyright © 2019年 developer. All rights reserved.
//

import Foundation
import UIKit

class ResultView:UIViewController{
    
    var firstPay:Int = 0
    var rent:Float = 0.0
    var overPay:Float = 0.0
    var period:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "计算结果"
        view.backgroundColor = UIColor.white
        
        print("首付金额: %d",firstPay)
        print("月供: %f",rent)
        print("贷款期数: %d",period)
        print("利息支出: %f",overPay)
        
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        
        let statusHeight = UIApplication.shared.statusBarFrame.height
        let navigationHeight = self.navigationController?.navigationBar.frame.height
        var fixedHeight = statusHeight + navigationHeight!
        
        var  firstPayLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+20, width: (screenWidth-20)/2, height:20))
        //firstPayLab.backgroundColor = UIColor.gray
        firstPayLab.text = "首付金额(元)"
        self.view.addSubview(firstPayLab)
        var  firstPayNum =  UILabel(frame:CGRect.init(x: 10+(screenWidth-20)/2, y:fixedHeight+20, width: (screenWidth-20)/2, height:20))
        //firstPayNum.backgroundColor = UIColor.blue
        firstPayNum.text = String(firstPay)
        self.view.addSubview(firstPayNum)
        
        var  periodLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+60, width: (screenWidth-20)/2, height:20))
        periodLab.text = "贷款期数(月)"
        self.view.addSubview(periodLab)
        var  periodNum =  UILabel(frame:CGRect.init(x: 10+(screenWidth-20)/2, y:fixedHeight+60, width: (screenWidth-20)/2, height:20))
        periodNum.text = String(period)
        self.view.addSubview(periodNum)
        
        var  rentLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+100, width: (screenWidth-20)/2, height:20))
        rentLab.text = "月供金额(元)"
        self.view.addSubview(rentLab)
        var  rentNum =  UILabel(frame:CGRect.init(x: 10+(screenWidth-20)/2, y:fixedHeight+100, width: (screenWidth-20)/2, height:20))
        rentNum.text = String(Int(rent))
        self.view.addSubview(rentNum)
        
        var  overPayLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+140, width: (screenWidth-20)/2, height:20))
        overPayLab.text = "利息支出(元)"
        self.view.addSubview(overPayLab)
        var  overPayNum =  UILabel(frame:CGRect.init(x: 10+(screenWidth-20)/2, y:fixedHeight+140, width: (screenWidth-20)/2, height:20))
        overPayNum.text = String(Int(overPay))
        self.view.addSubview(overPayNum)
        
        
        var btn = UIButton(frame:CGRect.init(x: 20, y:fixedHeight+180, width: screenWidth-40, height:44))
        btn.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
        btn.setTitle("复制", for:.normal)
        btn.titleLabel?.textColor = UIColor.white
        btn.addTarget(self, action:#selector(self.tapped), for:.touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    @objc func tapped(){
        var str = ""
        str += "首付金额:"
        str += String(firstPay)+"元\n"
        str += "月供:"
        str += String(Int(rent))+"元\n"
        str += "贷款期数:"
        str += String(Int(period))+"月\n"
        str += "利息支出:"
        str += String(Int(overPay))+"元\n"

        let pas = UIPasteboard.general
        pas.string = str
        print(pas.string)
        
        var alertController = UIAlertController(title: "复制成功",message: "",preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in
            //执行的代码
            self.presentedViewController?.dismiss(animated: false, completion: nil)
            
        }
    }
}
