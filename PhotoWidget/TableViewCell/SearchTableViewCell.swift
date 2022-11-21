//
//  SearchTableViewCell.swift
//  PhotoWidget
//
//  Created by ukBook on 2022/11/19.
//

import Foundation
import UIKit
import SnapKit

class SearchTableViewCell : UITableViewCell {
    
    static let cellId = "CellId"
    
    let thumbnail = UIImageView()
//    let title = UILabel()
//    let author = UILabel()
//    let publish = UILabel()
    
    let title : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = label.font.withSize(18)
        label.textColor = .black
        return label
    }()
    
    let author : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    
    let publish : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder) error")
    }
    
    func layout() {
        self.backgroundColor = .white
        
        self.addSubview(thumbnail)
        self.addSubview(title)
        self.addSubview(author)
        self.addSubview(publish)
        
        thumbnail.snp.makeConstraints{(make) in
            make.topMargin.equalTo(10)
            make.leftMargin.equalTo(10)
            make.bottomMargin.equalTo(-10)
            make.width.equalTo(90)
        }
        
        title.snp.makeConstraints{(make) in
            make.topMargin.equalTo(13)
            make.leftMargin.equalTo(thumbnail.snp.right).offset(30)
        }
        
        author.snp.makeConstraints{(make) in
            make.topMargin.equalTo(title.snp.bottom).offset(13)
            make.leftMargin.equalTo(thumbnail.snp.right).offset(30)
        }
        
        publish.snp.makeConstraints{(make) in
            make.bottomMargin.equalTo(-10)
            make.leftMargin.equalTo(thumbnail.snp.right).offset(30)
        }
        
    }
}
