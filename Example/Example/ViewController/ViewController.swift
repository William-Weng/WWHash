//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/1/1.
//

import UIKit
import WWPrint
import WWHash

// MARK: - Hash範例
final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printHash()
    }
}

// MARK: - 小工具
private extension ViewController {
    
    /// 列印Hash值
    func printHash() {
        
        let string = "很多人以為雜湊就是加密，但雜湊不是加密！ 雜湊不是加密！ 雜湊不是加密！ 雜湊是因為他的特性很適合來做加密的運算，但真的不等同於加密！"
        let md5 = WWHash.md5.encode(string: string)
        let sha256 = WWHash.sha256.encode(data: string.data(using: .utf8)!)
        
        wwPrint("md5 => \(md5)")
        wwPrint("sha256 => \(sha256)")
    }
}
