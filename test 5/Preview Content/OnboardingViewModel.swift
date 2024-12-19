import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int = 0 // الصفحة الحالية
    
    let slides: [Slide] = [
        Slide(
            image: "doc.text.viewfinder",
            title: "مسح النصوص بسهولة",
            description: "استخدم الكاميرا لمسح الكتب أو المستندات أو أي نص مطبوع"
        ),
        Slide(
            image: "paintpalette",
            title: "تخصيص ألوان النصوص",
            description: "تغيير ألوان النصوص والخلفيات لتحسين تجربة القراءة"
        ),
        Slide(
            image: "speaker.wave.1",
            title: "القراءة الصوتية",
            description: "يمكنك تحويل النصوص إلى صوت واضح وسلس لقراءة مريحة"
        )
    ]
}

