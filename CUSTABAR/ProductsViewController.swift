//
//  ProductsViewController.swift
//  CUSTABAR
//
//  Created by Yudai Takahashi on 2021/05/27.
//
import UIKit


class ProductsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    private let photos = ["maccha", "vanilla", "darkmocha", "caramel"]
    private let titles = ["抹茶", "バニラ", "ダークモカ", "キャラメル"]
    private let tallPrice = ["670", "650", "720", "560"]
    private let grandePrice = ["720", "700","770","610"]
    private let ventiPrice = ["770", "750", "820", "660"]
    
    
    // 1行あたりのアイテム数
    private let itemsPerRow: CGFloat = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NavigationBarを表示したい場合
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [
                    // 文字の色
            .foregroundColor: UIColor(red: 5/255, green: 132/255, blue: 144/255, alpha: 1.0),
            NSAttributedString.Key.font: UIFont(name: "VAL",size: 35)!]
        
    }

    // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    

    // セル（要素）に表示する内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // "Cell" の部分は　Storyboard でつけた cell の identifier。
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)

        // Tag番号を使ってインスタンスをつくる
        let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
        let photoImage = UIImage(named: photos[indexPath.row])
        photoImageView.image = photoImage
        
        let HeightLine = cell.contentView.viewWithTag(2)  as! UILabel
        HeightLine.backgroundColor = UIColor(red: 166/255, green: 170/255, blue: 169/255, alpha: 1.0)

        let nameLabel = cell.contentView.viewWithTag(3) as! UILabel
        nameLabel.text = titles[indexPath.row]
        
        let tallLabel = cell.contentView.viewWithTag(4) as! UILabel
        tallLabel.text = String("Tall: ¥"+tallPrice[indexPath.row])
        
        let grandeLabel = cell.contentView.viewWithTag(5) as! UILabel
        grandeLabel.text = String("Grande: ¥"+grandePrice[indexPath.row])
        
        let ventiLabel = cell.contentView.viewWithTag(6) as! UILabel
        ventiLabel.text = String("Venti: ¥"+ventiPrice[indexPath.row])
        
        return cell
    
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = collectionView.frame.width / 2.39
        let height: CGFloat = collectionView.frame.height / 7.22
        return CGSize(width: width, height: height)
    }
    
    
}
