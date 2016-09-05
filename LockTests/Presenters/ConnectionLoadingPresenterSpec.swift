// ConnectionLoadingPresenterSpec.swift
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

import Quick
import Nimble

@testable import Lock

class ConnectionLoadingPresenterSpec: QuickSpec {

    override func spec() {

        var interactor: MockConnectionsLoader!
        var presenter: ConnectionLoadingPresenter!
        var messagePresenter: MockMessagePresenter!
        var navigator: MockNavigator!

        beforeEach {
            messagePresenter = MockMessagePresenter()
            interactor = MockConnectionsLoader()
            navigator = MockNavigator()
            presenter = ConnectionLoadingPresenter(loader: interactor, navigator: navigator)
            presenter.messagePresenter = messagePresenter
        }

        it("should build LoadingView") {
            expect(presenter.view as? LoadingView).toNot(beNil())
        }

        it("should reload when connections are obtained") {
            var connections = OfflineConnections()
            connections.database(name: connection, requiresUsername: false)
            interactor.connections = connections
            presenter.view
            expect(navigator.connections).toEventuallyNot(beNil())
        }

        it("should exit with error when failed to get connections") {
            interactor.connections = nil
            presenter.view
            expect(navigator.unrecoverableError).toEventuallyNot(beNil())
        }

        it("should exit with error when there are no connections") {
            interactor.connections = OfflineConnections()
            presenter.view
            expect(navigator.unrecoverableError).toEventuallyNot(beNil())
        }

    }
}
