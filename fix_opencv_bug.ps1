function FixOpenCVBug($version) {
    $version_list = "4.5.2", "4.5.3", "4.5.4"
    if ($version_list -contains $version) {
        $content = Get-Content "opencv_contrib\modules\wechat_qrcode\src\zxing\zxing.hpp"
        $content[29] = "#if defined(__ANDROID_API__) || defined(_MSC_VER) || defined(__MINGW32__) || defined(__MINGW64__)"
        
        $content | set-Content "opencv_contrib\modules\wechat_qrcode\src\zxing\zxing.hpp"
    }
}