function FixOpenCVBug() {
    $content = Get-Content "opencv_contrib\modules\wechat_qrcode\src\zxing\zxing.hpp"
    $content[30] = "#if defined(__ANDROID_API__) || defined(_MSC_VER) || defined(__MINGW32__) || defined(__MINGW64__)"
    
    for ($i = 53; $i -le 62; $i++) {
        $content[$i] = ""
    }
    $content | set-Content "opencv_contrib\modules\wechat_qrcode\src\zxing\zxing.hpp"
}