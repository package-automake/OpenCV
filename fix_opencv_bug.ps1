function FixOpenCVBug() {
    $content = Get-Content "opencv_contrib\modules\wechat_qrcode\src\zxing\zxing.hpp"
    $content[29] = "#if defined(__ANDROID_API__) || defined(_MSC_VER) || defined(__MINGW32__) || defined(__MINGW64__)"
    
    $content | set-Content "opencv_contrib\modules\wechat_qrcode\src\zxing\zxing.hpp"
}