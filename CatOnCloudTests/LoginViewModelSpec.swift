//
//  LoginViewModelSpec.swift
//  CatOnCloudTests
//
//  Created by Xingxin Zeng  on 18/10/2017.
//  Copyright © 2017 Xingxin Zeng . All rights reserved.
//

import Quick
import Nimble

@testable import CatOnCloud

class LoginViewModelSpec: QuickSpec {
    override func spec() {
        describe("Login logic"){
            it("should login success", closure: {
                expect(true).to(equal(LoginViewModel().login(username: "admin", password: "admin")))
            })
            
            it("should login fail", closure: {
                expect(false).to(equal(LoginViewModel().login(username: "balabala", password: "balabala")))
            })
        }
    }
}
