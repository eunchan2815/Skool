import SwiftUI

struct SkoolSecureField: View {
    @State private var showPassword = false
    let image: UIImage
    let inputText: String
    @Binding var postText: String
    
    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .frame(width: 20, height: 25)
                .padding(.leading, 12)
            
            if showPassword == true {
                TextField(inputText, text: $postText)
                    .font(.system(size: 15))
                    .padding(.leading, 11)
                    .frame(height: 50)
                    .tint(.sub1)
                    .font(.medium(14))
                    .hideKeyBoard()
            } else {
                SecureField(inputText, text: $postText)
                    .font(.system(size: 15))
                    .padding(.leading, 11)
                    .frame(height: 50)
                    .tint(.sub1)
                    .font(.medium(14))
                    .hideKeyBoard()
            }
            
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
                    .padding(.trailing, 12)
            }
            .buttonStyle(PlainButtonStyle())
            
        }
        .frame(width: 300, height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(postText.isEmpty ? Color.init(uiColor: .systemGray4) : Color.sub1 , lineWidth: 1)
        )
        .padding(.vertical, 2)
    }
}
