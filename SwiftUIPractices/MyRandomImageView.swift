//
//  MyRandomImageView.swift
//  SwiftUIPractices
//
//  Created by 조규연 on 9/4/24.
//

import SwiftUI

struct Section: Identifiable {
    let id = UUID()
    var title: String
}

struct MyRandomImageView: View {
    @State private var sectionTitles = [
        Section(title: "첫번째 섹션"),
        Section(title: "두번째 섹션"),
        Section(title: "세번째 섹션"),
        Section(title: "네번째 섹션")
    ]
    
    var body: some View {
        NavigationView {
            sections()
            .navigationTitle("My Random Image")
        }
    }
    
    func sections() -> some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach($sectionTitles, id: \.id) { $item in
                    SectionView(title: $item.title, imageCount: 5)
                }
            }
            .padding()
        }
    }
}

private struct SectionView: View {
    @Binding var title: String
    var imageCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(0..<imageCount, id: \.self) { index in
                        NavigationLink {
                            NavigationLazyView(ImageDetailView(sectionTitle: $title))
                        } label: {
                            RandomImageView()
                                .frame(width: 100, height: 140)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct RandomImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/200")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                Color.gray
            @unknown default:
                Color.gray
            }
        }
    }
}

#Preview {
    MyRandomImageView()
}
