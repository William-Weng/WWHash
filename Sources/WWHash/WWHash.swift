//
//  WWHash.swift
//  WWHash
//
//  Created by Willilam.Weng on 2024/1/25.
//

import UIKit

// MARK: - 計算Hash值
public enum WWHash {
    
    case md5
    case sha1
    case sha224
    case sha256
    case sha384
    case sha512
    
    /// [雜湊編碼 - 文字 => Hash](https://ithelp.ithome.com.tw/articles/10208884)
    /// - Parameter string: String
    /// - Returns: String
    public func encode(string: String) -> String {
        switch self {
        case .md5: return string._md5()
        case .sha1: return string._sha1()
        case .sha224: return string._sha224()
        case .sha256: return string._sha256()
        case .sha384: return string._sha384()
        case .sha512: return string._sha512()
        }
    }
    
    /// [雜湊編碼 - Data => Hash](https://ithelp.ithome.com.tw/articles/10208884)
    /// - Parameter data: Data
    /// - Returns: String
    public func encode(data: Data) -> String {
        switch self {
        case .md5: return data._md5()
        case .sha1: return data._sha1()
        case .sha224: return data._sha224()
        case .sha256: return data._sha256()
        case .sha384: return data._sha384()
        case .sha512: return data._sha512()
        }
    }
}
