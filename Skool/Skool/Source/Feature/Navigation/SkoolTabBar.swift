import SwiftUI

struct SkoolTabBar: View {
    @Binding var selectedTab: TabType
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Rectangle()
                .fill(Color.gray)
                .frame(maxWidth: .infinity, maxHeight: 1)
            HStack(spacing: 48) {
                ForEach(TabType.allCases, id: \.self) { tab in
                    ZStack {
                        if tab == selectedTab {
                            Rectangle()
                                .fill(Color.main)
                                .frame(width: 65, height: 60)
                                .cornerRadius(14)
                        }
                        VStack(spacing: 2) {
                            Image(selectedTab == tab ? tab.click : tab.image)
                                .resizable()
                                .frame(
                                    width: tab == TabType.seat ? 50 : 24,
                                    height: tab == TabType.seat ? 25 : 24
                                )
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.2)) {
                                        selectedTab = tab
                                    }
                                }
                                .padding(.bottom, 4)
                            Text(tab.text)
                                .foregroundStyle(selectedTab == tab ? .white : .black)
                                .font(.custom("Pretendard-Regular", size: 14))
                                .padding(.vertical, 2)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 80)
        }
        .padding(.vertical, 13)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    SkoolTabBar(selectedTab: .constant(.timeTable))
}