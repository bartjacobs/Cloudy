//
//  XCTestCase.swift
//  Cloudy
//
//  Created by Bart Jacobs on 06/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import XCTest

extension XCTestCase {

    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)

        return try! Data(contentsOf: url!)
    }

}
