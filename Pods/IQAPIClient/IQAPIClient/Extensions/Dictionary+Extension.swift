//
//  Dictionary+Extension.swift
//  https://github.com/hackiftekhar/IQAPIClient
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

internal extension Dictionary where Key == String {

    var jsonString: String? {
        guard let data = data else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }

    var data: Data? {

        guard JSONSerialization.isValidJSONObject(self) else {
            print("Invalid JSON")
            return nil
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: [])
            return data
        } catch let error {
            print(error)
        }

        return nil
    }

    var prettyJsonString: String? {
        guard let data = prettyData else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }

    var prettyData: Data? {

        guard JSONSerialization.isValidJSONObject(self) else {
            print("Invalid JSON")
            return nil
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return data
        } catch let error {
            print(error)
        }

        return nil
    }
}
