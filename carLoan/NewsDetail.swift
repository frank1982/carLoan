

import Foundation
import UIKit
import WebKit

class NewsDetail: UIViewController{
    
    var link:String?
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "详情"
        
        view.backgroundColor = UIColor.gray
        
        webView = WKWebView(frame: self.view.frame)
        // 下面一行代码意思是充满的意思(一定要加，不然也会显示有问题)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(webView)
        let mapwayURL = URL(string: link!)!
        let mapwayRequest = URLRequest(url: mapwayURL)
        webView.load(mapwayRequest)
        
        print(link)
        
    }
}
