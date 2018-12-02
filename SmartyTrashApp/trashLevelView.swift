//
//  trashLevelView.swift
//  SmartyTrashApp
//
//  Created by Priyanka Priyadarshini Mishra on 11/26/18.
//  Copyright © 2018 Priyanka Priyadarshini Mishra. All rights reserved.
//

import UIKit

@IBDesignable class trashLevelView: UIView {
    
    @IBInspectable var cornerradius : CGFloat = 2;
    @IBInspectable var shadowOffSetWidth : CGFloat = 0;
    @IBInspectable var shadowOffSetHeight : CGFloat = 5;
    @IBInspectable var shadowcolor : UIColor = UIColor.black;
    @IBInspectable var shadowOpacity : CGFloat = 0.5;
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerradius;
        layer.shadowColor = shadowcolor.cgColor;
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight);
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius);
        layer.shadowPath = shadowPath.cgPath;
        layer.shadowOpacity =  Float(shadowOpacity);
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
