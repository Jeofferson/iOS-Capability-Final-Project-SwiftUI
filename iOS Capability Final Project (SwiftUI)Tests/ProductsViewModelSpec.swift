//
//  ProductsViewModelSpec.swift
//  iOS Capability Final Project (SwiftUI)Tests
//
//  Created by Jeofferson Dela Pena on 10/13/22.
//

import Quick
import Nimble
@testable import iOS_Capability_Final_Project__SwiftUI_

class ProductsViewModelSpec: QuickSpec {
    override func spec() {
        describe("the ProductsViewModel") {
            var viewModel: ProductsViewModel!
            
            beforeEach {
                viewModel = ProductsViewModel(service: ProductServiceMock())
            }
            
            afterEach {
                viewModel = nil
            }
            
            describe("its getProducts function") {
                context("when its response is a success") {
                    it("should set the products property to the fetched products") {
                        viewModel.getProducts()
                        expect(viewModel.products) == [Product.example, Product.example]
                    }
                }
            }
        }
    }
}
