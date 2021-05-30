//
//  CustomViewController.swift
//  CUSTABAR
//
//  Created by Yudai Takahashi on 2021/05/28.
//

import UIKit

class CustomViewController: UIViewController,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var customTextField: UITextField!
    @IBOutlet var tableView0: UITableView!
    @IBOutlet var tableView1: UITableView!
    @IBOutlet var tableView2: UITableView!
    
    // 表示用データ
    var items0: NSMutableArray = ["Short", "Tall", "Grande", "Venti"]
    var items1: NSMutableArray = ["バニラ", "キャラメル", "シンプルクラシック", "アーモンドトフィー", "モカ", "ホワイトモカ","チャイ"]
    var items2: NSMutableArray = ["チョコ", "キャラメル"]
    var items: [NSMutableArray] = []
    var rowListArray = [Int]()
    var itemListArray = [Int]()
    var sortArray = [Int]()
    
    // 処理分岐用
    var tag:Int = 0
    var cellIdentifier:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customTextField.delegate = self
        
        // デリゲートの設定
        tableView0.delegate = self
        tableView0.dataSource = self
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView2.delegate = self
        tableView2.dataSource = self
        
        //  複数選択を有効にする
        tableView0.allowsMultipleSelectionDuringEditing = true
        tableView1.allowsMultipleSelectionDuringEditing = true
        tableView2.allowsMultipleSelectionDuringEditing = true
        
        // 表示用データの配列を配列にする
        items.append(items0)
        items.append(items1)
        items.append(items2)
        
    }
    
    // 処理を分岐するメソッド
    func checkTableView(_ tableView: UITableView) -> Void{
        if (tableView.tag == 0) {
            tag = 0
            cellIdentifier = "cellIdentifier0"
        }
        else if (tableView.tag == 1) {
            tag = 1
            cellIdentifier = "cellIdentifier1"
        }
        else {
            tag = 2
            cellIdentifier = "cellIdentifier2"
        }
    }
    
    // セルの数を返す。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        checkTableView(tableView)
        
        return items[tag].count
    }
    
    // セルを返す。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        checkTableView(tableView)
        
        // セルにテキストを出力する。
        let cell = tableView.dequeueReusableCell(withIdentifier:  cellIdentifier, for:indexPath as IndexPath)
        cell.textLabel?.text = items[tag][indexPath.row] as? String
        
        //  セルの選択時の背景色を消す
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        //  セルの選択状況の判定
        if (rowListArray.contains(indexPath.row)){
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }

        return cell
    }
    
    // 選択時のの動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell = tableView.cellForRow(at: indexPath)
        // 選択したセルにチェックマークが無い場合
        if(cell?.accessoryType == UITableViewCell.AccessoryType.none){
            cell?.accessoryType = .checkmark
            self.rowListArray.append(indexPath.row)
        }else{
        // 選択したセルにチェックマークがある場合
            cell?.accessoryType = .none
            let  listNumber = rowListArray.filter ({ (n:Int) -> Bool in
                if n != indexPath.row{
                    return true
                }else{
                    return false
                }})
            rowListArray = listNumber
        }
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

