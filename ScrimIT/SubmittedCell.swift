//
//  SubmittedCell.swift
//  ScrimIT
//
//  Created by Anthony Ma on 2/3/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class SubmittedCell: UITableViewCell {
    
    var responseCellView: VideoCellTitleView?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        responseCellView = VideoCellTitleView()
        responseCellView?.nameLabel?.textColor = UIColor.white
        contentView.addSubview(responseCellView!)
        responseCellView?.translatesAutoresizingMaskIntoConstraints = false
        responseCellView?.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        responseCellView?.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        responseCellView?.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        responseCellView?.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
