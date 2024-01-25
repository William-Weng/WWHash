//
//  Extension.swift
//  WWHash
//
//  Created by Willilam.Weng on 2024/1/25.
//

import UIKit
import CommonCrypto

// MARK: - String (function)
extension String {
    
    /// [文字 => MD5](https://blog.csdn.net/PRESISTSI/article/details/82224809) / [William => 604c8dd5066ee30539037569a028dc9b](http://www.md5.cz/)
    /// - Returns: String
    func _md5() -> Self { return self._secureHashAlgorithm(digestLength: CC_MD5_DIGEST_LENGTH, encode: CC_MD5) }
    
    /// [文字 => SHA1](https://stackoverflow.com/questions/25761344/how-to-hash-nsstring-with-sha1-in-swift)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha1.html)
    func _sha1() -> Self { return self._secureHashAlgorithm(digestLength: CC_SHA1_DIGEST_LENGTH, encode: CC_SHA1) }
    
    /// [文字 => SHA224](https://www.blocktempo.com/the-state-of-hashing-algorithms-the-why-the-how-and-the-future/)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha224.html)
    func _sha224() -> Self { return self._secureHashAlgorithm(digestLength: CC_SHA224_DIGEST_LENGTH, encode: CC_SHA224) }
    
    /// [文字 => SHA256](https://stackoverflow.com/questions/25388747/sha256-in-swift)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha256.html)
    func _sha256() -> Self { return self._secureHashAlgorithm(digestLength: CC_SHA256_DIGEST_LENGTH, encode: CC_SHA256) }
    
    /// [文字 => SHA384](http://www.tsnien.idv.tw/Security_WebBook/第四章 雜湊與亂數演算法.html)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha384.html)
    func _sha384() -> Self { return self._secureHashAlgorithm(digestLength: CC_SHA384_DIGEST_LENGTH, encode: CC_SHA384) }
    
    /// [文字 => SHA512](https://crypto.stackexchange.com/questions/47996/how-different-is-sha-512-224-when-compared-to-sha-512)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha512.html)
    func _sha512() -> Self { return self._secureHashAlgorithm(digestLength: CC_SHA512_DIGEST_LENGTH, encode: CC_SHA512) }
}

// MARK: - String (private function)
private extension String {
    
    /// [計算SHA家族的雜湊值](https://zh.wikipedia.org/zh-tw/SHA家族)
    /// - Parameters:
    ///   - digestLength: [雜湊值長度](https://ithelp.ithome.com.tw/articles/10241695)
    ///   - encode: [雜湊函式](https://ithelp.ithome.com.tw/articles/10208884)
    /// - Returns: [String](https://emn178.github.io/online-tools/)
    func _secureHashAlgorithm(digestLength: Int32, encode: (_ data: UnsafeRawPointer?, _ len: CC_LONG, _ md: UnsafeMutablePointer<UInt8>?) -> UnsafeMutablePointer<UInt8>?) -> String {
        let data = Data(self.utf8)
        return data._secureHashAlgorithm(digestLength: digestLength, encode: encode)
    }
    
    /// [SecItemUpdate(_:_:)](https://developer.apple.com/documentation/security/1393617-secitemupdate)
    /// - Parameters:
    ///   - query: [CFString : Any]
    ///   - fields: [CFString : Any]
    /// - Returns: OSStatus
    func _SecItemUpdate(query: [CFString : Any], fields: [CFString : Any]) -> OSStatus {
        return SecItemUpdate(query as CFDictionary, fields as CFDictionary)
    }
    
    /// [SecItemAdd(_:_:)](https://developer.apple.com/documentation/security/1401659-secitemadd)
    /// - Parameters:
    ///   - query: [CFString : Any]
    ///   - result: UnsafeMutablePointer<CFTypeRef?>?
    /// - Returns: OSStatus
    func _SecItemAdd(query: [CFString : Any], result: UnsafeMutablePointer<CFTypeRef?>?) -> OSStatus {
        return SecItemAdd(query as CFDictionary, result)
    }
    
    /// [SecItemCopyMatching(_:_:)](https://developer.apple.com/documentation/security/1398306-secitemcopymatching)
    /// - Parameters:
    ///   - query: [CFString : Any]
    ///   - result: UnsafeMutablePointer<CFTypeRef?>?
    /// - Returns: OSStatus
    func _SecItemCopyMatching(query: [CFString : Any], result: UnsafeMutablePointer<CFTypeRef?>?) -> OSStatus {
        return SecItemCopyMatching(query as CFDictionary, result)
    }
    
    /// [SecItemDelete(_:)](https://developer.apple.com/documentation/security/1395547-secitemdelete)
    /// - Parameter query: [CFString : Any]
    /// - Returns: OSStatus
    func _SecItemDelete(_ query: [CFString : Any]) -> OSStatus {
        return SecItemDelete(query as CFDictionary)
    }
}

// MARK: - Data (SHA值)
extension Data {
    
    /// [Data => MD5](https://blog.csdn.net/PRESISTSI/article/details/82224809) / [William => 604c8dd5066ee30539037569a028dc9b](http://www.md5.cz/)
    func _md5() -> String { return self._secureHashAlgorithm(digestLength: CC_MD5_DIGEST_LENGTH, encode: CC_MD5) }
    
    /// [Data => SHA1](https://stackoverflow.com/questions/25761344/how-to-hash-nsstring-with-sha1-in-swift)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha1.html)
    func _sha1() -> String { return self._secureHashAlgorithm(digestLength: CC_SHA1_DIGEST_LENGTH, encode: CC_SHA1) }
    
    /// [Data => SHA224](https://www.blocktempo.com/the-state-of-hashing-algorithms-the-why-the-how-and-the-future/)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha224.html)
    func _sha224() -> String { return self._secureHashAlgorithm(digestLength: CC_SHA224_DIGEST_LENGTH, encode: CC_SHA224) }
    
    /// [Data => SHA256](https://stackoverflow.com/questions/25388747/sha256-in-swift)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha256.html)
    func _sha256() -> String { return self._secureHashAlgorithm(digestLength: CC_SHA256_DIGEST_LENGTH, encode: CC_SHA256) }
    
    /// [Data => SHA384](http://www.tsnien.idv.tw/Security_WebBook/第四章 雜湊與亂數演算法.html)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha384.html)
    func _sha384() -> String { return self._secureHashAlgorithm(digestLength: CC_SHA384_DIGEST_LENGTH, encode: CC_SHA384) }
    
    /// [Data => SHA512](https://crypto.stackexchange.com/questions/47996/how-different-is-sha-512-224-when-compared-to-sha-512)
    /// - Returns: [String](https://emn178.github.io/online-tools/sha512.html)
    func _sha512() -> String { return self._secureHashAlgorithm(digestLength: CC_SHA512_DIGEST_LENGTH, encode: CC_SHA512) }
}

// MARK: - Data (SHA值)
private extension Data {
    
    /// [計算SHA家族的雜湊值](https://zh.wikipedia.org/zh-tw/SHA家族)
    /// - Parameters:
    ///   - digestLength: [雜湊值長度](https://ithelp.ithome.com.tw/articles/10241695)
    ///   - encode: [雜湊函式](https://ithelp.ithome.com.tw/articles/10208884)
    /// - Returns: [String](https://emn178.github.io/online-tools/)
    func _secureHashAlgorithm(digestLength: Int32, encode: (_ data: UnsafeRawPointer?, _ len: CC_LONG, _ md: UnsafeMutablePointer<UInt8>?) -> UnsafeMutablePointer<UInt8>?) -> String {
        
        var hash = [UInt8](repeating: 0, count: Int(digestLength))
        self.withUnsafeBytes { _ = encode($0.baseAddress, CC_LONG(self.count), &hash) }
        
        let hexBytes = hash.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}
