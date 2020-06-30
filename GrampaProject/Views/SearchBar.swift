//
//  SearchBar.swift
//  GrampaProject
//
//  Created by Alessandro dovere on 22/05/2020.
//  Copyright © 2020 Alessandro dovere. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    class Coordinator:NSObject,UISearchBarDelegate{
        @Binding var text : String
        init(text: Binding<String>) {
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = "Search"
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
