import SwiftUI

struct SettingsScreen: View {
//    @EnvironmentObject var store: StorekitStore
    
    var body: some View {
        VStack {
            ScrollView {
//                if let product = store.unlockAdvancedEquationsPurchase {
//                    SettingsInAppPurchases(product: product)
//                        .padding(.top)
//                }
                
                VStack {}
                    .padding(.vertical)
                
                Text("[Contact Support](https://rjsappdev.wixsite.com/construction/general-5)")
                    .modifier(RoundedBorderView())
                
                Text("[Privacy Policy](https://rjsappdev.wixsite.com/construction/privacy-policy)")
                    .modifier(RoundedBorderView())
                
                Text("[EULA](https://rjsappdev.wixsite.com/construction/eula)")
                    .modifier(RoundedBorderView())
            }
            
            HStack {
                Spacer()
                
                Button {
                    if let url = URL(string: "https://shiner.rjs-app-dev.us/") {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    Image(systemName: "pawprint.circle")
                }
                .padding(.horizontal)
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: 400)
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsScreen()
//        .environmentObject(StorekitStore())
}
