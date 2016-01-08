

import UIKit
let  kMinimumSegmentWidth:CGFloat = 68.0
class YYSegment: UIView {

    var titleLabel:UILabel?
    
    init(title:NSString){
        super.init(frame:CGRectZero)
        self.userInteractionEnabled = false
        self.titleLabel = UILabel(frame:self.frame)
        self.titleLabel!.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        self.titleLabel!.font = UIFont.systemFontOfSize(13)
        self.titleLabel!.textAlignment = NSTextAlignment.Center
        self.titleLabel!.backgroundColor = UIColor.clearColor()
        self.addSubview(self.titleLabel!)
        titleLabel!.text = title as String
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.userInteractionEnabled = false
        self.titleLabel = UILabel(frame:self.frame)
        self.titleLabel!.autoresizingMask = [UIViewAutoresizing.FlexibleHeight , UIViewAutoresizing.FlexibleWidth]
        self.titleLabel!.font = UIFont.systemFontOfSize(13)
        self.titleLabel!.textAlignment = NSTextAlignment.Center
        self.titleLabel!.backgroundColor = UIColor.clearColor()
        self.addSubview(self.titleLabel!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func sizeThatFits(size: CGSize) -> CGSize {
        let sizeThatFits = self.titleLabel!.sizeThatFits(size)
        var width = kMinimumSegmentWidth
        if width > sizeThatFits.width*1.7 {
            width = sizeThatFits.width*1.7
        }
        return CGSizeMake(width, sizeThatFits.height);
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */

}
