import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = OnboardingViewModel() // ربط ViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            // زر التخطي في أعلى اليسار
            HStack {
                Spacer()
                Text("تخطي")
                    .font(Font.custom("Maqroo-Regular", size: 25))
                    .foregroundColor(.dg)
                    .padding(.trailing, 280)
                    .padding(.top, 70)
                Spacer()
            }
            
            Spacer()
            
            // الجزء الرئيسي: الدائرة الثابتة والمحتوى المتغير
            ZStack {
                // الدائرة الثابتة في المنتصف
                Circle()
                    .fill(Color.lb)
                    .frame(width: 180, height: 180)
                    .shadow(color: Color.shd.opacity(0.8), radius: 2, x: 1, y: 3)
                    .padding(.top, -130)
                
                // TabView لعرض الشرائح
                TabView(selection: $viewModel.currentPage) {
                    ForEach(viewModel.slides.indices, id: \.self) { index in
                        VStack(spacing: 10) {
                            Image(systemName: viewModel.slides[index].image)
                                .font(.system(size: 60, weight: .regular))
                                .foregroundColor(Color.db)
                                .padding(.top, 65)
                            
                            Text(viewModel.slides[index].title)
                                .font(Font.custom("Maqroo-Regular", size: 33))
                                .foregroundColor(.dg)
                                .padding(.bottom, 5)
                                .padding(.top, 73)
                            
                            Text(viewModel.slides[index].description)
                                .font(Font.custom("Maqroo-Regular", size: 22))
                                .foregroundColor(.dg)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 60)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // إخفاء المؤشر الافتراضي
            }
            
            Spacer()
            
            // النقاط السفلية للتنقل
            HStack(spacing: 14) {
                ForEach(viewModel.slides.indices, id: \.self) { index in
                    Circle()
                        .fill(viewModel.currentPage == index ? Color.db : Color.db.opacity(0.3)) // تمييز النقطة الحالية
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.bottom, 120)
        }
        .background(Color.lg.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
