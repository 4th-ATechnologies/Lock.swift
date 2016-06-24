// DatabaseModes.swift
//
// Copyright (c) 2016 Auth0 (http://auth0.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

public enum DatabaseModes: Int {
    case Login = 0
    case Signup
    case ForgotPassword

    var title: String {
        switch self {
        case .Login:
            return i18n(key: "com.auth0.lock.database.mode.switcher.login", value: "LOG IN", comment: "Login Switch")
        case .Signup:
            return i18n(key: "com.auth0.lock.database.mode.switcher.signup", value: "SIGN UP", comment: "Signup Switch")
        case .ForgotPassword:
            return i18n(key: "com.auth0.lock.database.mode.switcher.forgot-password", value: "Don’t remember your password?", comment: "Forgot password")
        }
    }
}
