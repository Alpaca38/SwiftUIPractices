//
//  ProfileView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/2/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var nicknameText: String = ""
    @State private var buttonSelects: [Bool] = Array(repeating: false, count: 8)
    @State private var isSheet = false
    @State private var profileImage = Image(NSDataAssetName(stringLiteral: "profile_0"))
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack(spacing: 40) {
            NavigationLink {
                ProfileImageView(profileImage: $profileImage, selectedIndex: $selectedIndex)
            } label: {
                profileImage
                    .resizable()
                    .asCircleWithBorderColor(width: 100, height: 100, borderColor: .blue, lineWidth: 4)
            }

            
            TextField("닉네임을 입력해주세요 :)", text: $nicknameText)
                .padding(.horizontal, 10)
                .overlay {
                    Divider().offset(y: 20.0)
                }
            
            HStack {
                Text("MBTI")
                    .bold()
                
                Spacer()
                
                MBTIGridView(buttonSelects: $buttonSelects)
            }
            .padding(.top, 50)
            
            Spacer()
            
            Button(action: {
                isSheet = true
            }, label: {
                Text("완료")
                    .asRoundedRectWithColor(color: .blue)
            })
        }
        .padding()
        .navigationTitle("PROFILE SETTING")
        .sheet(isPresented: $isSheet, content: {
            SignInCompleteView()
        })
    }
}

private struct MBTIGridView: View {
    @Binding var buttonSelects: [Bool]
    
    var columns: [GridItem] = Array(repeating: .init(.fixed(50)), count: 4)
    
    let list = [
        MBTIItem(item: "E", index: 0),
        MBTIItem(item: "S", index: 1),
        MBTIItem(item: "T", index: 2),
        MBTIItem(item: "J", index: 3),
        MBTIItem(item: "I", index: 4),
        MBTIItem(item: "N", index: 5),
        MBTIItem(item: "F", index: 6),
        MBTIItem(item: "P", index: 7),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, content: {
            ForEach(list, id: \.id) { item in
                mbtiItem(item)
            }
        })
    }
    
    func mbtiItem(_ item: MBTIItem) -> some View {
        Button(action: {
            buttonSelects[item.index].toggle()
            toggleOppositeColor(item.index)
        }, label: {
            Text(item.item)
                .foregroundStyle(buttonSelects[item.index] ? .blue : .gray)
                .asCircleWithBorderColor(width: 50, height: 50, borderColor: buttonSelects[item.index] ? .blue : .gray, lineWidth: 1)
        })
    }
    
    func toggleOppositeColor(_ index: Int) {
        let pairs: [Int: Int] = [0: 4, 1: 5, 2: 6, 3: 7, 4: 0, 5: 1, 6: 2, 7: 3]
        
        if let oppositeIndex = pairs[index] {
            buttonSelects[oppositeIndex] = false
        }
    }
}

#Preview {
    ProfileView()
}
