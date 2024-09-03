//
//  ProfileImageView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/2/24.
//

import SwiftUI

struct ProfileImage: Identifiable {
    let id = UUID()
    let index: Int
    let name: NSDataAssetName
}

struct ProfileImageView: View {
    @Binding var profileImage: Image
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack(spacing: 40) {
            profileImage
                .resizable()
                .asCircleWithBorderColor(width: 100, height: 100, borderColor: .blue, lineWidth: 4)
            
            ProfileGridView(profileImage: $profileImage, selectedIndex: $selectedIndex)
            Spacer()
        }
        .padding()
    }
}

private struct ProfileGridView: View {
    @Binding var profileImage: Image
    @Binding var selectedIndex: Int
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    let list = [
        ProfileImage(index: 0, name: NSDataAssetName(stringLiteral: "profile_0")),
        ProfileImage(index: 1, name: NSDataAssetName(stringLiteral: "profile_1")),
        ProfileImage(index: 2, name: NSDataAssetName(stringLiteral: "profile_2")),
        ProfileImage(index: 3, name: NSDataAssetName(stringLiteral: "profile_3")),
        ProfileImage(index: 4, name: NSDataAssetName(stringLiteral: "profile_4")),
        ProfileImage(index: 5, name: NSDataAssetName(stringLiteral: "profile_5")),
        ProfileImage(index: 6, name: NSDataAssetName(stringLiteral: "profile_6")),
        ProfileImage(index: 7, name: NSDataAssetName(stringLiteral: "profile_7")),
        ProfileImage(index: 8, name: NSDataAssetName(stringLiteral: "profile_8")),
        ProfileImage(index: 9, name: NSDataAssetName(stringLiteral: "profile_9")),
        ProfileImage(index: 10, name: NSDataAssetName(stringLiteral: "profile_10")),
        ProfileImage(index: 11, name: NSDataAssetName(stringLiteral: "profile_11"))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(list, id: \.id) { item in
                profileImageItem(item)
            }
        })
    }
    
    func profileImageItem(_ item: ProfileImage) -> some View {
        Button {
            profileImage = Image(item.name)
            selectedIndex = item.index
        } label: {
            Image(item.name)
                .resizable()
                .asCircleWithBorderColor(width: 80, height: 80, borderColor: selectedIndex == item.index ? .blue : .gray, lineWidth: selectedIndex == item.index ? 2 : 1)
                .opacity(selectedIndex == item.index ? 1 : 0.5)
        }
    }
}
