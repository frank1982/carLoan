import UIKit

class NewCell: UITableViewCell {
    
    let cellWidth = Int(UIScreen.main.bounds.width)
    var viewH:Int = 0
    var viewW:Int = 0

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super . init(style: style, reuseIdentifier: reuseIdentifier)
        

        var image = UIImage(named: "image0")
        var height = image?.size.height
        var width = image?.size.width
        var scale = height! / width!
        viewH = 64
        viewW = Int(64/scale)
        
        let cellWidth = Int(UIScreen.main.bounds.width)
        
        //let imageView = UIImageView(image: image)
        //imageView.frame = CGRect(x: cellWidth-viewW-10, y: 8, width: viewW, height: viewH)
        //imageView.layer.masksToBounds = true
        //imageView.layer.cornerRadius = 5
        self.contentView.addSubview(iView)
        
        var txtViewA = UIView(frame: CGRect.init(x: 10, y: 8, width: cellWidth-viewW-20, height:48))
        //txtViewA.backgroundColor = UIColor.red
        txtViewA.addSubview(titlea)
        self.contentView.addSubview(txtViewA)
        
        
        var txtViewB = UIView(frame: CGRect.init(x: 10, y: 56, width: cellWidth-viewW-20, height: 16))
        //txtViewB.backgroundColor = UIColor.green
        txtViewB.addSubview(titleb)
        self.contentView.addSubview(txtViewB)
        
    }
    
    
    lazy var iView:UIImageView={
        
        let cellWidth = Int(UIScreen.main.bounds.width)
        //var imageView = UIImageView(image:UIImage(named: "image0"))
        var imageView = UIImageView()
        imageView.frame = CGRect(x: cellWidth-viewW-10, y: 8, width: viewW, height: viewH)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
        
        return imageView
    }()
    
    lazy var titlea:UILabel={
        
        let  titlea =  UILabel(frame:CGRect.init(x: 0, y: 0, width: cellWidth-viewW-20, height:48))
        //var words = "用于管理内容的绘制有关的对象显示在一个滚动视图应该瓦片的内容的子视图，以便没有视图超过屏幕的大小。当用户在滚动滚动视图，这个对象应该添加和删除子视图是必要的"
        titlea.numberOfLines=0
        titlea.lineBreakMode = NSLineBreakMode.byWordWrapping
        //titlea.text = words
        //titlea.backgroundColor = UIColor.gray
        return titlea
    }()
    
    
    lazy var titleb:UILabel={

        let  titleb =  UILabel(frame:CGRect.init(x: 0, y: 0, width: cellWidth-viewW-20, height:12))
        titleb.textColor = UIColor.gray
        titleb.font = UIFont.systemFont(ofSize: 12)
        return titleb
    }()
    
    
    //var screenWidth:Int = 0
    /*
    //懒加载label
    lazy var  titleLable:UILabel = {
        let  titleLable =  UILabel(frame:CGRect.init(x: 100, y: 0, width: 100, height: 30))
        titleLable.backgroundColor = .green
        titleLable.textAlignment = NSTextAlignment.center
        return titleLable
        
    }( )
    */
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
