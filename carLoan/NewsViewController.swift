
import Foundation
import UIKit


class NewsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var array:[Dictionary<String,String>] = [] as! [Dictionary]
    var refreshControl:UIRefreshControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车市新闻"
        
        view.backgroundColor = UIColor.blue
        let screenWidth = self.view.frame.width;      //the main screen size of width;
        let screenHeight = self.view.frame.height;    //the main screen size of height;
        
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white;
        //tableView.frame.origin = CGPoint(x:0,y:0)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView .register(NewCell.classForCoder(), forCellReuseIdentifier: "cell")
 
        
        let footerLabel = UILabel.init()
        footerLabel.frame = CGRect(x:0, y:0, width:screenWidth, height: 50)
        footerLabel.textAlignment = .center
        footerLabel.lineBreakMode = .byWordWrapping
        footerLabel.font = UIFont.systemFont(ofSize: 16)
        footerLabel.textColor = UIColor.gray
        footerLabel.text = "到底啦";
        tableView.tableFooterView = footerLabel
        
        refreshControl = UIRefreshControl.init()
        refreshControl?.attributedTitle = NSAttributedString.init(string: "正在下拉刷新")
        refreshControl?.addTarget(self, action: #selector(self.refreshAction), for: .valueChanged)
        tableView.addSubview(refreshControl!)
        //初始化数据
        var dic0:[String:String] = ["laba":"凯迪拉克CT5官图公布 将于成都车展亮相","labb":"日前，我们从上汽通用官方渠道获悉，凯迪拉克CT5将于今年9月5日开幕的成都车展正式亮相","imag":"image0","url":"http://news.m.yiche.com/zonghexinwen/20190730/0509502540.html"]
        var dic1:[String:String] = ["laba":"全新路虎揽胜极光、领克03+领衔，本周4款重磅新车将上市","labb":"时间已经来到了7月底，再过一个月车市有望迎来“金九银十”的销售旺季","imag":"image1","url":"http://news.m.yiche.com/hao/wenzhang/30474459"]
        var dic2:[String:String] = ["laba":"进入国内近20年，公认够硬耐撞，这台帅爆B级车终于换代了","labb":"豪华品牌的中型车，还有那些车型还没更新换代？——沃尔沃S60L","imag":"image2","url":"http://news.m.yiche.com/hao/wenzhang/30474008"]
        var dic3:[String:String] = ["laba":"2019款凯翼X5上市 售7.89万元起步 升级多达24项","labb":"7月29日，2019款凯翼X5正式上市，新款车型配备了满足国六b排放标准的1.5TCI发动机","imag":"image3","url":"http://news.m.yiche.com/xinchexiaoxi/20190729/1109501402.html"]
        var dic4:[String:String] = ["laba":"全新北京BJ40家族正式上市 售16.49-20.49万元/增环塔冠军版","labb":"北京汽车正式对外宣布，北京BJ40环塔冠军版、BJ40城市猎人版、新BJ40 PLUS上市","imag":"image4","url":"http://news.m.yiche.com/xinchexiaoxi/20190729/2009497394.html"]
        var dic5:[String:String] = ["laba":"预算10万+，谁还买合资SUV？！","labb":"随着本月几款小型SUV新车的陆续上市，国内本就竞争激烈的10万-15万元的市场又迎来新的选择","imag":"image5","url":"http://news.m.yiche.com/hao/wenzhang/30467423"]
        var dic6:[String:String] = ["laba":"近年来最热门的十大配置 开始觉得鸡肋 用一次就戒不掉","labb":"曾经，汽车销售会把电动天窗、多功能方向盘、自动空调和车身稳定系统等配置","imag":"image6","url":"http://news.m.yiche.com/hao/wenzhang/30467507"]
        var dic7:[String:String] = ["laba":"林肯首款国产车下线 换代MKC 轴距大幅加长","labb":"此前林肯已经在海外发布了现款MKC的继任车型——全新Corsair，其将成为林肯在华国产的首款产品","imag":"image7","url":"http://news.m.yiche.com/hao/wenzhang/30482777"]
        var dic8:[String:String] = ["laba":"北汽新款BJ40 PLUS谍照 换装全新造型电子挡杆","labb":"日前，我们从相关渠道获得了一组北汽新款BJ40 PLUS的测试图，新车外观和内饰设计几乎没有改变","imag":"image8","url":"http://news.m.yiche.com/xinchexiaoxi/20190628/1409459265.html"]
        var dic9:[String:String] = ["laba":"新国产“牧马人”3天后上市 升级2.3T动力只卖10几万","labb":"越野在多数用户的印象中都是“土豪”的游戏，牧马人、普拉多等车，售价动辄超过40多万","imag":"image9","url":"http://news.m.yiche.com/hao/wenzhang/30450606"]
        
        array.append(dic0)
        array.append(dic1)
        array.append(dic2)
        array.append(dic3)
        array.append(dic4)
        array.append(dic5)
        array.append(dic6)
        array.append(dic7)
        array.append(dic8)
        array.append(dic9)
        
        /*
        for idx in 0...9 {
            
            var dict:[String:String] = [:]
            //dict["laba"] = "用于管理内容的绘制有关的对象显示在一个滚动视图应该瓦片的内容的子视图，以便没有视图超过屏幕的大小。当用户在滚动滚动视图，这个对象应该添加和删除子视图是必要的"
            //dict["labb"] = "测试圈儿圈儿人人"+String(idx)
            //dict["imag"] = "image"+String(idx)
            array.append(dict)
        }
        */
        
    }
    
    @objc func refreshAction(){
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (timer) in

            self.refreshControl?.endRefreshing()
        }
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:NewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewCell
        //print(indexPath[1])
        cell.titlea.text = self.array[indexPath[1]]["laba"]
        cell.titleb.text = self.array[indexPath[1]]["labb"]
        cell.iView.image = UIImage(named: self.array[indexPath[1]]["imag"]!)

        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath)
        let detailVIewController = NewsDetail()
        detailVIewController.title = self.array[indexPath[1]]["laba"]
        detailVIewController.link = self.array[indexPath[1]]["url"]
        self.navigationController?.pushViewController(detailVIewController, animated: true)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
