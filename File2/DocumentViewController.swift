//
//  DocumentViewController.swift
//  File2
//
//  Created by 登坂直弥 on 2017/10/25.
//  Copyright © 2017年 super.naoya. All rights reserved.
//

import UIKit

//1st Scene:ファイル選択画面
class DocumentViewController: UIViewController {
    
    @IBAction func selectFile(_ sender: Any) {
    }
    @IBOutlet weak var documentNameLabel: UILabel!
    
    var document: UIDocument?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access the document
        document?.open(completionHandler: { (success) in
            if success {
                // Display the content of the document, e.g.:
                self.documentNameLabel.text = self.document?.fileURL.lastPathComponent
            } else {
                // Make sure to handle the failed import appropriately, e.g., by presenting an error message to the user.
            }
        })
    }
    
    @IBAction func dismissDocumentViewController() {
        dismiss(animated: true) {
            self.document?.close(completionHandler: nil)
        }
    }
}

//Second Scene:TableViewにcsvのcolumnを表示させる処理
// セクションを含めて、テーブルビューにデータを表示

class ViewController: UIViewController,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    var dataInSection = [["青山","阿部"], ["加藤","川島","神田"], ["佐藤","坂田"], ["田中"]]
    
    //入力されたグループ数をアルゴリズムの分ける数に配属させる処理
 
    
    
    
//これは最後のUI（結果画面用！
    //セクション:グループ数名を返す（）
    var sectionIndex:[String] = ["あ行", "か行", "さ行", "た行"]
    
    //アルゴリズムによって並び替えられたデータをTableViewに返す
    func tableView(tableView:UITableView, cellForRowAtIndexPath indexPath:IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for:indexPath) as UITableViewCell
        var test = dataInSection[indexPath.section]
        cell.textLabel?.text = test[indexPath.row]
        return cell
    }
    
    //データの個数を返す　　＊まだよくわかっていない
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return dataInSection[section].count
    }
    
    //セクション名を返す
    func tableView(_ tableView:UITableView, titleForHeaderInSection section:Int) -> String?{
        return sectionIndex[section]
    }
    
    //セクションの個数を返す
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionIndex.count
    }
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//final Scene: ファイルを出力する

