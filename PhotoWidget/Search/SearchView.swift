//
//  SearchView.swift
//  PhotoWidget
//
//  Created by ukBook on 2022/11/19.
//

import Foundation
import UIKit
import Alamofire

class SearchView : UIView{
    
    let searchTextField : UITextField = {
        let searchTextField = UITextField()
        searchTextField.borderStyle = .line
        searchTextField.placeholder = "제목, 작가, 출판사 검색"
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        searchTextField.layer.borderWidth = 1
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.textColor = .black
        searchTextField.setPlaceholder(color: .black)
        return searchTextField
    }()
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    let uiButton : UIButton = {
        let uiButton = UIButton()
        uiButton.setTitle("검색", for: .normal)
        uiButton.backgroundColor = .blue
        uiButton.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        return uiButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.cellId)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        addSubview(searchTextField)
        addSubview(tableView)
        addSubview(uiButton)
        
        
        searchTextField.snp.makeConstraints {(make) in
            make.topMargin.equalTo(30)
            make.leftMargin.equalTo(20)
            make.rightMargin.equalTo(-20)
        }
        
        tableView.snp.makeConstraints {(make) in
            make.topMargin.equalTo(searchTextField.snp.bottom).offset(30)
            make.leftMargin.equalTo(20)
            make.rightMargin.equalTo(-20)
            make.bottomMargin.equalTo(-10)
        }
        
        uiButton.snp.makeConstraints {(make) in
            make.leftMargin.equalTo(searchTextField.snp.right).offset(10)
            make.centerY.equalTo(searchTextField.snp.centerY)
            make.width.equalTo(50)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldDidChange(_ sender: Any){
        let searchText = searchTextField.text ?? ""
        print(searchText)
//        APIRequest(searchText)
    }
    
    @objc func btnAction() {
        let searchText = searchTextField.text
//        print(searchText)
//        APIRequest()
    }
    
    func APIRequest(_ searchText: String) {
            let url = "http://openlibrary.org/search.json?author=\(searchText)"
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: ["Content-Type":"application/json", "Accept":"application/json"])
                .validate(statusCode: 200..<300)
                .responseJSON { (json) in
                    //여기서 가져온 데이터를 자유롭게 활용하세요.
                    print(json)
            }
        }
}


extension SearchView : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.cellId, for: indexPath) as! SearchTableViewCell
        cell.thumbnail.image = UIImage(systemName: "bell")
        cell.title.text = "제목제목제목"
        cell.author.text = "작가작가작가"
        cell.publish.text = "출판사출판사"
        
        return cell
    }
}
