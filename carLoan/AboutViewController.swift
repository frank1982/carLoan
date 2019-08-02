
import Foundation
import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        self.title = "关于我们"
        
        let screenWidth = self.view.frame.width
        let screenHeight = self.view.frame.height
        let statusHeight = UIApplication.shared.statusBarFrame.height
        let navigationHeight = self.navigationController?.navigationBar.frame.height
        var fixedHeight = statusHeight + navigationHeight!
        
        let infoDictionary = Bundle.main.infoDictionary!
        let minorVersion = infoDictionary["CFBundleShortVersionString"]//版本号（内部标示）
        let appVersion = minorVersion as! String
        
        print(appVersion)
        var  versionLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+60, width: screenWidth-20, height:20))
        versionLab.text = "当前版本: "+appVersion
        versionLab.textAlignment =  NSTextAlignment.center
        versionLab.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(versionLab)
        
        var  wxLab =  UILabel(frame:CGRect.init(x: 10, y:fixedHeight+100, width: screenWidth-20, height:20))
        wxLab.text = "francisco198211"
        wxLab.textAlignment =  NSTextAlignment.center
        wxLab.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(wxLab)
        
        var w = (screenWidth-40)/3
        var btn = UIButton(frame:CGRect.init(x: (screenWidth-w)/2, y:fixedHeight+160, width: w, height:44))
        btn.backgroundColor = UIColor.init(red: (255 / 255.0), green: (193 / 255.0), blue: (37 / 255.0), alpha: 1.0);
        btn.setTitle("复制微信号", for:.normal)
        btn.titleLabel?.textColor = UIColor.white
        btn.addTarget(self, action:#selector(self.tapped), for:.touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func tapped(){
        var str = "francisco198211"
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
