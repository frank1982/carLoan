
import Foundation
import UIKit

class MainViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

    var pickerOne: UIPickerView!
    var pickerData:[String] = ["20%","30%","40%","50%","60%","70%","80%"]
    var pickerDataList:[Float] = [0.2,0.3,0.4,0.5,0.6,0.7,0.8]
    var loanRate:Float = 0
    var loanRateLabSelected =  UILabel()
    //var selectedData = [12,24,36,48,60]
    var selected = [0,0,1,0,0]
    var btnLoan0:UIButton = UIButton()
    var btnLoan1:UIButton = UIButton()
    var btnLoan2:UIButton = UIButton()
    var btnLoan3:UIButton = UIButton()
    var btnLoan4:UIButton = UIButton()
    var textField:UITextField = UITextField()
    var textField2:UITextField = UITextField()
    var alertController:UIAlertController = UIAlertController(title: "价格或利率有误",message: "请重新输入",preferredStyle: .alert)
    var price:Int = 0
    var rate:Float = 0.0
    var period:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.frame.width;
        let screenHeight = self.view.frame.height;
        view.backgroundColor = UIColor.white
        self.title = "车贷计算"
 
        
        let statusHeight = UIApplication.shared.statusBarFrame.height
        let navigationHeight = self.navigationController?.navigationBar.frame.height
        var fixedHeight = statusHeight + navigationHeight!
        
        var  priceLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+20, width: screenWidth-20, height:20))
        priceLab.text = "购车价格(元)"
        priceLab.textColor = UIColor.black
        self.view.addSubview(priceLab)
        
        textField=UITextField(frame: CGRect(x:10, y:fixedHeight+60, width:screenWidth-20, height:30))
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.layer.borderWidth = 0.5
        textField.keyboardType = UIKeyboardType.numberPad
        self.view.addSubview(textField)
        
        var  loanRateLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+110, width: screenWidth-20, height:20))
        loanRateLab.text = "贷款比例"
        loanRateLab.textColor = UIColor.black
        self.view.addSubview(loanRateLab)
        
        loanRateLabSelected =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+140, width: (screenWidth-20)/2, height:30))
        loanRateLabSelected.text = "70%"
        loanRateLabSelected.textColor = UIColor.black
        //loanRateLabSelected.backgroundColor = UIColor.red
        self.view.addSubview(loanRateLabSelected)
        rate = pickerDataList[5]
        
        var imageArrow = UIImage(named: "arrow")
        var height = imageArrow?.size.height
        var scale = 30/height!
        var arrow = UIImageView(frame:CGRect.init(x: screenWidth-10-30, y:fixedHeight+140, width: 30, height:30))
        arrow.image = imageArrow
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(arrowClick))
        arrow.addGestureRecognizer(singleTapGesture)
        arrow.isUserInteractionEnabled = true
        self.view.addSubview(arrow)
        
        var  loanYear =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+190, width: screenWidth-20, height:20))
        loanYear.text = "贷款期限(月)"
        loanYear.textColor = UIColor.black
        self.view.addSubview(loanYear)
        
        /*
        var loanYearSelected =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+220, width: (screenWidth-20)/2, height:30))
        loanYearSelected.text = "36"
        loanYearSelected.textColor = UIColor.black
        self.view.addSubview(loanYearSelected)
        */
        btnLoan0 = UIButton(frame:CGRect.init(x: 20, y:fixedHeight+230, width: (screenWidth-80)/3, height:30))
        //btnLoan0.backgroundColor = UIColor.blue
        btnLoan0.setTitle("12", for:.normal)
        btnLoan0.setTitleColor(UIColor.black,for:.normal)
        //btnLoan0.layer.borderWidth = 1
        //btnLoan0.layer.borderColor = UIColor.gray.cgColor
        btnLoan0.addTarget(self, action:#selector(self.monthSelected0), for:.touchUpInside)
        self.view.addSubview(btnLoan0)
        
        btnLoan1 = UIButton(frame:CGRect.init(x: 40+(screenWidth-80)/3, y:fixedHeight+230, width: (screenWidth-80)/3, height:30))
        btnLoan1.setTitle("24", for:.normal)
        btnLoan1.setTitleColor(UIColor.black,for:.normal)
        //btnLoan1.layer.borderWidth = 1
        //btnLoan1.layer.borderColor = UIColor.gray.cgColor
        btnLoan1.addTarget(self, action:#selector(self.monthSelected1), for:.touchUpInside)
        self.view.addSubview(btnLoan1)
        
        btnLoan2 = UIButton(frame:CGRect.init(x: 60+(screenWidth-80)*2/3, y:fixedHeight+230, width: (screenWidth-80)/3, height:30))
        btnLoan2.setTitle("36", for:.normal)
        btnLoan2.setTitleColor(UIColor.black,for:.normal)
        //btnLoan2.layer.borderWidth = 1
        //btnLoan2.layer.borderColor = UIColor.gray.cgColor
        btnLoan2.addTarget(self, action:#selector(self.monthSelected2), for:.touchUpInside)
        btnLoan2.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
        self.view.addSubview(btnLoan2)
        period = 36
        
        btnLoan3 = UIButton(frame:CGRect.init(x: 20, y:fixedHeight+270, width: (screenWidth-80)/3, height:30))
        btnLoan3.setTitle("48", for:.normal)
        btnLoan3.setTitleColor(UIColor.black,for:.normal)
        btnLoan3.addTarget(self, action:#selector(self.monthSelected3), for:.touchUpInside)
        self.view.addSubview(btnLoan3)
        
        btnLoan4 = UIButton(frame:CGRect.init(x: 40+(screenWidth-80)/3, y:fixedHeight+270, width: (screenWidth-80)/3, height:30))
        btnLoan4.setTitle("60", for:.normal)
        btnLoan4.setTitleColor(UIColor.black,for:.normal)
        btnLoan4.addTarget(self, action:#selector(self.monthSelected4), for:.touchUpInside)
        self.view.addSubview(btnLoan4)
        
        var  rateLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+320, width: screenWidth-20, height:20))
        rateLab.text = "贷款利率(%)"
        rateLab.textColor = UIColor.black
        self.view.addSubview(rateLab)
        
        textField2=UITextField(frame: CGRect(x:10, y:fixedHeight+360, width:screenWidth-20, height:30))
        textField2.borderStyle = UITextBorderStyle.roundedRect
        textField2.layer.borderWidth = 0.5
        textField2.text = "5.25"
        textField2.keyboardType = UIKeyboardType.decimalPad
        self.view.addSubview(textField2)
        
        var btn = UIButton(frame:CGRect.init(x: 20, y:fixedHeight+410, width: screenWidth-40, height:44))
        btn.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
        btn.setTitle("计算", for:.normal)
        btn.titleLabel?.textColor = UIColor.white
        btn.addTarget(self, action:#selector(self.tapped), for:.touchUpInside)
        self.view.addSubview(btn)
        
        pickerOne=UIPickerView(frame:CGRect(x:10, y:screenHeight/2, width:screenWidth-20, height:200))
        pickerOne.dataSource = self
        pickerOne.delegate = self
        pickerOne.isHidden = true
        pickerOne.backgroundColor = UIColor.white
        pickerOne.selectRow(5,inComponent:0,animated:true)
        self.view.addSubview(pickerOne)
        
    }
    @objc func tapped(){
        
        var inputText = textField.text
        print(inputText)
        let reg = "^[0-9]+$"
        let pre = NSPredicate(format: "SELF MATCHES %@", reg)
        if pre.evaluate(with: inputText) {
            if(textField2.text == ""){
                self.present(alertController, animated: true, completion: nil)
                //self.view.addSubview(alertController)
                Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
                    //执行的代码
                    print("in time")
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                    
                }
            }else{
                
                //在这里计算结果
                price = Int(inputText!)!
                var loanPay = Float(price)*rate
                var loanRate = Float(textField2.text!)
                var resultViewController = ResultView()
                resultViewController.firstPay = price - Int(loanPay)
                resultViewController.rent = PMT(rate: loanRate!/100,nper: Float(period),pv: loanPay)
                resultViewController.overPay = Float(resultViewController.firstPay)+resultViewController.rent*Float(period) - Float(price)
                resultViewController.period = period
                self.navigationController?.pushViewController(resultViewController, animated: true)
            }
        }else{
            print("不是纯数字字母")
            //alertController = UIAlertController(title: "购车价格有误",message: "请重新输入",preferredStyle: .alert)
            self.present(alertController, animated: true, completion: nil)
            //self.view.addSubview(alertController)
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
                //执行的代码
                print("in time")
                self.presentedViewController?.dismiss(animated: false, completion: nil)
 
            }
        }
        
        
   
    }
    
    //rate 年利率 年利率除以12就是月利率
    //nper 贷款期数，单位月 该项贷款的付款总数。
    //pv 贷款金额,现值或一系列未来付款的当前值的累积和，也称为本金。

    func PMT(rate:Float, nper:Float,pv:Float)->Float{
        
        var v = (1 + (rate / 12))
        var t = (-(nper / 12) * 12)
        var result = (pv * (rate / 12)) / (1 - pow(v, t))
        return Float(result)
    }

    @objc func monthSelected0(){
        print("monthSelected 0")
        if(selected[0] == 1){
            //selected[0] = 0
            //btnLoan0.backgroundColor = UIColor.white
        }else{
            
            btnLoan0.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
            btnLoan1.backgroundColor = UIColor.white
            btnLoan2.backgroundColor = UIColor.white
            btnLoan3.backgroundColor = UIColor.white
            btnLoan4.backgroundColor = UIColor.white
            selected[0] = 1
            selected[1] = 0
            selected[2] = 0
            selected[3] = 0
            selected[4] = 0
            textField2.text = "4.85"
            period = 12
        }
    }
    @objc func monthSelected1(){
        print("monthSelected 1")
        if(selected[1] == 1){
            //selected[1] = 0
            //btnLoan1.backgroundColor = UIColor.white
        }else{
            
            btnLoan0.backgroundColor = UIColor.white
            btnLoan1.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
            btnLoan2.backgroundColor = UIColor.white
            btnLoan3.backgroundColor = UIColor.white
            btnLoan4.backgroundColor = UIColor.white
            selected[0] = 0
            selected[1] = 1
            selected[2] = 0
            selected[3] = 0
            selected[4] = 0
            textField2.text = "5.25"
            period = 24
            
        }
    }
    @objc func monthSelected2(){
        print("monthSelected 2")
        print(selected[2])
        if(selected[2] == 1){
            //selected[2] = 0
            //btnLoan2.backgroundColor = UIColor.white
        }else{
            
            btnLoan0.backgroundColor = UIColor.white
            btnLoan1.backgroundColor = UIColor.white
            btnLoan2.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
            btnLoan3.backgroundColor = UIColor.white
            btnLoan4.backgroundColor = UIColor.white
            selected[0] = 0
            selected[1] = 0
            selected[2] = 1
            selected[3] = 0
            selected[4] = 0
            textField2.text = "5.25"
            period = 36
        }

    }
    
    @objc func monthSelected3(){
        print("monthSelected 3")
        if(selected[3] == 1){
            
        }else{
            
            btnLoan0.backgroundColor = UIColor.white
            btnLoan1.backgroundColor = UIColor.white
            btnLoan2.backgroundColor = UIColor.white
            btnLoan3.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
            btnLoan4.backgroundColor = UIColor.white
            selected[0] = 0
            selected[1] = 0
            selected[2] = 0
            selected[3] = 1
            selected[4] = 0
            textField2.text = "5.25"
            period = 48
        }
        
    }
    
    @objc func monthSelected4(){
        print("monthSelected 4")
        if(selected[4] == 1){
            
        }else{
            
            btnLoan0.backgroundColor = UIColor.white
            btnLoan1.backgroundColor = UIColor.white
            btnLoan2.backgroundColor = UIColor.white
            btnLoan3.backgroundColor = UIColor.white
            btnLoan4.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
            selected[0] = 0
            selected[1] = 0
            selected[2] = 0
            selected[3] = 0
            selected[4] = 1
            textField2.text = "5.25"
            period = 60
        }
        
    }
    
    
    @objc func arrowClick(){
        print("arrow click")
        if(pickerOne.isHidden){
            pickerOne.isHidden = false
        }else{
            pickerOne.isHidden = true
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
        //pickerOne.isHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 25
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        loanRateLabSelected.text = pickerData[row]
        rate = pickerDataList[row]
        //print(rate)
        pickerOne.isHidden = true
    }
 
}
