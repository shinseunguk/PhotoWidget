//
//  SearchController.swift
//  PhotoWidget
//
//  Created by ukBook on 2022/11/19.
//

import UIKit
import SnapKit

class SearchController: UIViewController {
    
    let searchView = SearchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(searchView)
        
        searchView.snp.makeConstraints({make in
            make.topMargin.equalTo(0)
            make.bottomMargin.equalTo(0)
            make.leftMargin.equalTo(0)
            make.rightMargin.equalTo(0)
        })
    }
    
}
