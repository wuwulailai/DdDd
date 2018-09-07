//
//  StenographyHandlerTestCase.swift
//  Evergreen
//
//  Created by Nils Fischer on 04.04.16.
//  Copyright © 2016 viWiD Webdesign & iOS Development. All rights reserved.
//

import Foundation
import XCTest
import Log


class StenographyTestCase: XCTestCase {
    
    var stenographyHandler: StenographyHandler!
    var records: [Record] {
        return stenographyHandler.records
    }
    
    override func setUp() {
        super.setUp()
        stenographyHandler = StenographyHandler()
        Log.defaultLogger.handlers = [ stenographyHandler ]
    }
    
}
